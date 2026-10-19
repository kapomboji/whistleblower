import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../network/api_client.dart';

class CloudStorageService {
  static const int maxUploadSizeBytes = 50 * 1024 * 1024;

  static const String googleDriveClientId =
      '787156651568-9rb6c87j7b6r6h5q5h5b5h5b5h5b5h5b.apps.googleusercontent.com';

  static const String defaultDropboxRedirectUri = 'com.whistleblowerltd://oauth2';

  String _dropboxClientId = '';
  String _dropboxClientSecret = '';
  String _dropboxRedirectUri = defaultDropboxRedirectUri;
  String _dropboxState = '';

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: googleDriveClientId,
    scopes: ['https://www.googleapis.com/auth/drive.readonly'],
  );

  String? _dropboxAccessToken;
  String? _dropboxRefreshToken;
  final ApiClient _apiClient = ApiClient();

  bool isUploadWithinLimit(File file) {
    return file.lengthSync() <= maxUploadSizeBytes;
  }

  bool isUploadSizeWithinLimit(int fileSizeBytes) {
    return fileSizeBytes <= maxUploadSizeBytes;
  }

  Future<bool> isGoogleSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      return account;
    } catch (error) {
      return null;
    }
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<GoogleSignInAccount?> getGoogleAccount() async {
    return await _googleSignIn.signInSilently();
  }

  Future<List<DriveFileInfo>?> listGoogleDriveFiles() async {
    try {
      final accessToken = await _getGoogleDriveAccessToken();
      if (accessToken == null) return null;

      final driveApi = drive.DriveApi(
        GoogleDriveHttpClient(accessToken),
      );

      final fileList = await driveApi.files.list(
        q: "trashed = false",
        spaces: 'drive',
        pageSize: 50,
      );

      if (fileList.files == null || fileList.files!.isEmpty) {
        return [];
      }

      return fileList.files!
          .map((f) => DriveFileInfo(
                id: f.id ?? '',
                name: f.name ?? 'Untitled',
                mimeType: f.mimeType ?? 'application/octet-stream',
                size: int.tryParse(f.size ?? '0') ?? 0,
                modifiedTime: f.modifiedTime ?? DateTime.now(),
              ))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<File?> downloadFileFromDrive(String fileId, String fileName) async {
    try {
      final accessToken = await _getGoogleDriveAccessToken();
      if (accessToken == null) return null;

      final client = GoogleDriveHttpClient(accessToken);
      final url = Uri.parse(
        'https://www.googleapis.com/drive/v3/files/$fileId?alt=media',
      );

      final response = await client.get(url);

      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);
        return file;
      }
    } catch (e) {
      return null;
    }
    return null;
  }


  String? get dropboxAccessToken => _dropboxAccessToken;
  bool get isDropboxAuthenticated => _dropboxAccessToken != null;
  bool get isDropboxOAuthConfigured => _dropboxClientId.isNotEmpty;

  Future<void> configureDropboxOAuth({
    required String clientId,
    String? clientSecret,
    String redirectUri = defaultDropboxRedirectUri,
  }) async {
    _dropboxClientId = clientId;
    _dropboxClientSecret = clientSecret ?? '';
    _dropboxRedirectUri = redirectUri;
  }

  String? getDropboxOAuthUrl({String? state}) {
    if (!isDropboxOAuthConfigured) return null;

    _dropboxState = state ?? _generateRandomString(32);
    final params = {
      'client_id': _dropboxClientId,
      'response_type': 'code',
      'redirect_uri': _dropboxRedirectUri,
      'state': _dropboxState,
      'token_access_type': 'offline',
      'scope': 'files.metadata.read files.content.read',
    };
    final queryString = params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
    return 'https://www.dropbox.com/oauth2/authorize?$queryString';
  }

  Future<bool> signInWithDropbox() async {
    if (!isDropboxOAuthConfigured) return false;

    final authUrl = getDropboxOAuthUrl();
    if (authUrl == null) return false;

    try {
      final callbackUrl = await FlutterWebAuth2.authenticate(
        url: authUrl,
        callbackUrlScheme: _dropboxRedirectUri.split('://').first,
      );

      final callbackUri = Uri.parse(callbackUrl);
      final returnedState = callbackUri.queryParameters['state'];
      if (returnedState == null || returnedState != _dropboxState) {
        return false;
      }

      final code = callbackUri.queryParameters['code'];
      if (code == null || code.isEmpty) {
        return false;
      }

      return exchangeDropboxCode(code);
    } catch (_) {
      return false;
    }
  }

  Future<bool> exchangeDropboxCode(String code) async {
    if (!isDropboxOAuthConfigured) return false;

    try {
      final response = await _apiClient.post(
        Uri.parse('https://api.dropboxapi.com/oauth2/token'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'code': code,
          'grant_type': 'authorization_code',
          'client_id': _dropboxClientId,
          if (_dropboxClientSecret.isNotEmpty) 'client_secret': _dropboxClientSecret,
          'redirect_uri': _dropboxRedirectUri,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _dropboxAccessToken = json['access_token'];
        _dropboxRefreshToken = json.containsKey('refresh_token') ? json['refresh_token'] : null;
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<String?> authenticateDropbox() async {
    return _dropboxAccessToken;
  }

  /// List files from Dropbox
  Future<List<DropboxFileInfo>?> listDropboxFiles({String path = ''}) async {
    if (_dropboxAccessToken == null) return null;

    try {
      final response = await _apiClient.post(
        Uri.parse('https://api.dropboxapi.com/2/files/list_folder'),
        headers: {
          'Authorization': 'Bearer $_dropboxAccessToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'path': path.isEmpty ? '' : path}),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final entries = (json['entries'] as List?)?.cast<Map<String, dynamic>>() ?? [];

        return entries
            .map((e) => DropboxFileInfo(
                  id: e['id'] ?? '',
                  name: e['name'] ?? 'Untitled',
                  path: e['path_display'] ?? '',
                  size: e['size'] ?? 0,
                  isFolder: e['.tag'] == 'folder',
                  modifiedTime: e['server_modified'] != null
                      ? DateTime.parse(e['server_modified'])
                      : DateTime.now(),
                ))
            .toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  /// Download file from Dropbox
  Future<File?> downloadFileFromDropbox(String filePath, String fileName) async {
    if (_dropboxAccessToken == null) return null;

    try {
      final response = await _apiClient.post(
        Uri.parse('https://content.dropboxapi.com/2/files/download'),
        headers: {
          'Authorization': 'Bearer $_dropboxAccessToken',
          'Dropbox-API-Arg': jsonEncode({'path': filePath}),
        },
      );

      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);
        return file;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  void signOutDropbox() {
    _dropboxAccessToken = null;
    _dropboxRefreshToken = null;
  }

  Future<bool> refreshDropboxToken() async {
    if (!isDropboxOAuthConfigured || _dropboxRefreshToken == null) return false;

    try {
      final response = await _apiClient.post(
        Uri.parse('https://api.dropboxapi.com/oauth2/token'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'grant_type': 'refresh_token',
          'refresh_token': _dropboxRefreshToken,
          'client_id': _dropboxClientId,
          if (_dropboxClientSecret.isNotEmpty) 'client_secret': _dropboxClientSecret,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _dropboxAccessToken = json['access_token'];
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<String?> _getGoogleDriveAccessToken() async {
    final account = await getGoogleAccount();
    if (account == null) {
      final newAccount = await signInWithGoogle();
      if (newAccount == null) return null;
    }

    final auth = await _googleSignIn.currentUser?.authentication;
    return auth?.accessToken;
  }

  String _generateRandomString(int length) {
    const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(length, (index) => charset[random.nextInt(charset.length)]).join();
  }
}

class DriveFileInfo {
  final String id;
  final String name;
  final String mimeType;
  final int size;
  final DateTime modifiedTime;

  DriveFileInfo({
    required this.id,
    required this.name,
    required this.mimeType,
    required this.size,
    required this.modifiedTime,
  });

  String get sizeDisplay {
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(2)} KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  bool get isImage => mimeType.startsWith('image/');
  bool get isDocument => mimeType.contains('document') || mimeType.contains('pdf') || mimeType.contains('word');
  bool get isVideo => mimeType.startsWith('video/');
}

class DropboxFileInfo {
  final String id;
  final String name;
  final String path;
  final int size;
  final bool isFolder;
  final DateTime modifiedTime;

  DropboxFileInfo({
    required this.id,
    required this.name,
    required this.path,
    required this.size,
    required this.isFolder,
    required this.modifiedTime,
  });

  String get sizeDisplay {
    if (isFolder) return '-';
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(2)} KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  String get icon {
    if (isFolder) return Icons.folder_outlined.codePoint.toString();
    if (name.endsWith('.pdf')) return Icons.picture_as_pdf.codePoint.toString();
    if (name.endsWith('.doc') || name.endsWith('.docx')) return Icons.description.codePoint.toString();
    if (name.endsWith('.jpg') || name.endsWith('.png')) return Icons.photo.codePoint.toString();
    if (name.endsWith('.mp4') || name.endsWith('.mov')) return Icons.video_library.codePoint.toString();
    if (name.endsWith('.wav') || name.endsWith('.mp3')) return Icons.audiotrack.codePoint.toString();
    return Icons.attach_file.codePoint.toString();
  }
}

class GoogleDriveHttpClient extends http.BaseClient {
  final String accessToken;
  final http.Client _inner = http.Client();

  GoogleDriveHttpClient(this.accessToken);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['authorization'] = 'Bearer $accessToken';
    return _inner.send(request);
  }
}
