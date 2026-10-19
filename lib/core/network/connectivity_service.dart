import 'package:flutter/foundation.dart';

import 'api_client.dart';

class ConnectivityService {
  ConnectivityService({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  static final _googleConnectivityUri = Uri.parse(
    'https://www.google.com',
  );
  static final _webConnectivityUri = Uri.base.resolve(
    'assets/AssetManifest.bin.json',
  );

  final ApiClient _apiClient;

  Future<bool> hasInternetConnection() async {
    try {
      final uri = kIsWeb ? _webConnectivityUri : _googleConnectivityUri;
      final response = await _apiClient
          .get(uri)
          .timeout(const Duration(seconds: 5));
      return response.statusCode >= 200 && response.statusCode < 300;
    } catch (_) {
      return false;
    }
  }



  void dispose() => _apiClient.dispose();
}