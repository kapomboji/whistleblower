import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';

import '../../../core/services/cloud_storage_service.dart';
import '../../../core/services/compression_service.dart';
import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';
import '../../splash/presentation/splash_preloader.dart';
import 'file_attachment_models.dart';
import 'report_fraud_flow_data.dart';
import 'report_fraud_flow_widgets.dart';

class ReportFraudAttachmentPage extends StatefulWidget {
  const ReportFraudAttachmentPage({super.key});

  @override
  State<ReportFraudAttachmentPage> createState() => _ReportFraudAttachmentPageState();
}

class _ReportFraudAttachmentPageState extends State<ReportFraudAttachmentPage> {
  final List<AttachmentItem> _attachments = [];
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final CloudStorageService _cloudStorage = CloudStorageService();
  final CompressionService _compression = CompressionService();
  bool _recordingAudio = false;
  bool _attachmentsCollapsed = false;
  bool _isPlayingAudio = false;
  String? _activeAudioPath;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _addDocument() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'png', 'jpg', 'jpeg', 'mp4', 'mov', 'wav', 'm4a', 'aac'],
    );

    if (result == null || result.files.isEmpty) return;
    final file = result.files.first;
    final path = file.path;
    if (path == null) return;

    if (!_cloudStorage.isUploadSizeWithinLimit(file.size)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Upload limit exceeded. Maximum allowed size is 50 MB.')),
      );
      return;
    }

    setState(() {
      _attachments.add(AttachmentItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: file.name,
        path: path,
        type: AttachmentType.document,
      ));
    });

    await _compressAndShowStats(File(path));
  }

  Future<void> _pickFromCloud(String provider) async {
    if (!mounted) return;
    
    if (provider == 'Google Drive') {
      await _pickFromGoogleDrive();
    } else if (provider == 'Dropbox') {
      await _pickFromDropbox();
    }
  }

  Future<void> _pickFromGoogleDrive() async {
    try {
      if (!mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SplashPreloader(size: 92, logoSize: 38),
              SizedBox(height: 16),
              Text('Signing in to Google Drive...'),
            ],
          ),
        ),
      );

      final account = await _cloudStorage.signInWithGoogle();
      if (!mounted) return;
      Navigator.of(context).pop();

      if (account == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google Sign-In cancelled')),
        );
        return;
      }

      final driveFiles = await _cloudStorage.listGoogleDriveFiles();
      if (!mounted) return;

      if (driveFiles == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to load Google Drive files')),
        );
        return;
      }

      if (driveFiles.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No Google Drive files found')),
        );
        return;
      }

      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (sheetContext) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Select a Google Drive file',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.6,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: driveFiles.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 6),
                      itemBuilder: (_, index) {
                        final file = driveFiles[index];
                        return ListTile(
                          leading: const Icon(Icons.insert_drive_file),
                          title: Text(file.name),
                          subtitle: Text(file.sizeDisplay),
                          onTap: () async {
                            Navigator.of(sheetContext).pop();
                            await _downloadAndAttachGoogleDriveFile(file);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      if (!mounted) return;
      if (Navigator.canPop(context)) Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  Future<void> _pickFromDropbox() async {
    try {
      if (!mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SplashPreloader(size: 92, logoSize: 38),
              SizedBox(height: 16),
              Text('Signing in to Dropbox...'),
            ],
          ),
        ),
      );

      if (!_cloudStorage.isDropboxOAuthConfigured) {
        if (!mounted) return;
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dropbox authentication is not configured. Add your Dropbox OAuth client ID first.'),
          ),
        );
        return;
      }

      final signedIn = await _cloudStorage.signInWithDropbox();
      if (!mounted) return;
      Navigator.of(context).pop();

      if (!signedIn) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dropbox sign-in cancelled or failed')),
        );
        return;
      }

      final accessToken = await _cloudStorage.authenticateDropbox();
      if (!mounted) return;

      if (accessToken == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dropbox is not connected for this session')),
        );
        return;
      }

      final dropboxFiles = await _cloudStorage.listDropboxFiles();
      if (!mounted) return;

      if (dropboxFiles == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to load Dropbox files')),
        );
        return;
      }

      if (dropboxFiles.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No Dropbox files found')),
        );
        return;
      }

      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (sheetContext) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Select a Dropbox file',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.6,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: dropboxFiles.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 6),
                      itemBuilder: (_, index) {
                        final file = dropboxFiles[index];
                        if (file.isFolder) return const SizedBox.shrink();
                        return ListTile(
                          leading: const Icon(Icons.insert_drive_file),
                          title: Text(file.name),
                          subtitle: Text(file.sizeDisplay),
                          onTap: () async {
                            Navigator.of(sheetContext).pop();
                            await _downloadAndAttachDropboxFile(file);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      if (!mounted) return;
      if (Navigator.canPop(context)) Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  Future<void> _showCloudPicker() async {
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 14),
                _buildCloudPickerOption(
                  ctx: ctx,
                  assetPath: 'assets/dropbox.png',
                  label: 'Dropbox',
                  onTap: () {
                    Navigator.of(ctx).pop();
                    _pickFromCloud('Dropbox');
                  },
                ),
                _buildCloudPickerOption(
                  ctx: ctx,
                  assetPath: 'assets/google_drive.png',
                  label: 'Google Drive',
                  onTap: () {
                    Navigator.of(ctx).pop();
                    _pickFromCloud('Google Drive');
                  },
                ),
                _buildCloudPickerOption(
                  ctx: ctx,
                  icon: const Icon(Icons.folder, color: AppColors.darkBlue),
                  label: 'Local Device',
                  onTap: () {
                    Navigator.of(ctx).pop();
                    _addDocument();
                  },
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _capturePhoto() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (file == null) return;

    final pickedFile = File(file.path);
    if (!_cloudStorage.isUploadWithinLimit(pickedFile)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Upload limit exceeded. Maximum allowed size is 50 MB.')),
      );
      return;
    }

    setState(() {
      _attachments.add(AttachmentItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: file.name,
        path: file.path,
        type: AttachmentType.document,
      ));
    });
  }

  Future<void> _recordAudio() async {
    if (_recordingAudio) {
      // Stop recording
      try {
        final path = await _recorder.stop();
        if (path != null && path.isNotEmpty) {
          final recordedFile = File(path);
          if (!_cloudStorage.isUploadWithinLimit(recordedFile)) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Upload limit exceeded. Maximum allowed size is 50 MB.')),
              );
            }
            return;
          }

          setState(() {
            _attachments.add(AttachmentItem(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              name: 'Audio_${DateTime.now().millisecondsSinceEpoch}.wav',
              path: path,
              type: AttachmentType.audio,
            ));
            _recordingAudio = false;
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error stopping recording: $e')),
          );
        }
      }
    } else {
      // Start recording
      final status = await Permission.microphone.request();
      if (!status.isGranted) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Microphone permission is required to record audio')),
          );
        }
        return;
      }

      try {
        final isSupported = await _recorder.isEncoderSupported(AudioEncoder.wav);
        if (!isSupported) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('WAV encoding is not supported on this device')),
            );
          }
          return;
        }

        final documentsDir = await getApplicationDocumentsDirectory();
        final audioFileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.wav';
        final audioPath = '${documentsDir.path}/$audioFileName';

        await _recorder.start(
          const RecordConfig(
            encoder: AudioEncoder.wav,
            bitRate: 128000,
            sampleRate: 44100,
          ),
          path: audioPath,
        );

        setState(() {
          _recordingAudio = true;
        });
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error starting recording: $e')),
          );
        }
      }
    }
  }

  Future<void> _downloadAndAttachGoogleDriveFile(DriveFileInfo file) async {
    final downloadedFile = await _cloudStorage.downloadFileFromDrive(file.id, file.name);
    if (downloadedFile == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to download the selected Google Drive file')),
      );
      return;
    }

    await _attachDownloadedFile(downloadedFile, file.name);
  }

  Future<void> _downloadAndAttachDropboxFile(DropboxFileInfo file) async {
    final downloadedFile = await _cloudStorage.downloadFileFromDropbox(file.path, file.name);
    if (downloadedFile == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to download the selected Dropbox file')),
      );
      return;
    }

    await _attachDownloadedFile(downloadedFile, file.name);
  }

  Future<void> _attachDownloadedFile(File file, String fileName) async {
    if (!_cloudStorage.isUploadWithinLimit(file)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Upload limit exceeded. Maximum allowed size is 50 MB.')),
      );
      return;
    }

    if (!mounted) return;
    setState(() {
      _attachments.add(AttachmentItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: fileName,
        path: file.path,
        type: AttachmentType.document,
      ));
    });
  }

  void _removeAttachment(String id) {
    setState(() {
      _attachments.removeWhere((item) => item.id == id);
    });
  }

  Future<void> _compressAndShowStats(File file) async {
    if (!mounted) return;
    
    final stats = await _compression.getCompressionStats(file);
    if (stats == null || !mounted) return;

    final originalSizeKB = (stats['originalSize'] as int) / 1024;
    final compressedSizeKB = (stats['compressedSize'] as int) / 1024;
    final ratio = stats['compressionRatio'];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Compression: ${originalSizeKB.toStringAsFixed(2)}KB → ${compressedSizeKB.toStringAsFixed(2)}KB ($ratio% saved)',
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  String _getFileSizeString(String filePath) {
    try {
      final file = File(filePath);
      final bytes = file.lengthSync();
      
      if (bytes < 1024) {
        return '$bytes B';
      } else if (bytes < 1024 * 1024) {
        return '${(bytes / 1024).toStringAsFixed(2)} KB';
      } else {
        return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
      }
    } catch (e) {
      return 'Unknown size';
    }
  }

  void _toggleAttachmentsPanel() {
    setState(() {
      _attachmentsCollapsed = !_attachmentsCollapsed;
    });
  }

  Future<void> _playAudio(String path) async {
    if (_activeAudioPath == path && _isPlayingAudio) {
      await _audioPlayer.pause();
      setState(() {
        _isPlayingAudio = false;
      });
      return;
    }

    if (_activeAudioPath != null && _activeAudioPath != path) {
      await _audioPlayer.stop();
    }

    await _audioPlayer.play(DeviceFileSource(path));
    setState(() {
      _activeAudioPath = path;
      _isPlayingAudio = true;
    });
  }

  Future<void> _showAudioPlayerSheet(AttachmentItem item) async {
    if (item.type != AttachmentType.audio) return;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFCBD3DE),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 16),
              const Icon(Icons.play_circle_fill, size: 48, color: AppColors.background),
              const SizedBox(height: 12),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () async {
                      await _playAudio(item.path);
                    },
                    icon: Icon(_activeAudioPath == item.path && _isPlayingAudio ? Icons.pause : Icons.play_arrow),
                    iconSize: 28,
                  ),
                  const SizedBox(width: 12),
                  IconButton.outlined(
                    onPressed: () async {
                      await _audioPlayer.stop();
                      setState(() {
                        _isPlayingAudio = false;
                        _activeAudioPath = null;
                      });
                    },
                    icon: const Icon(Icons.stop),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Playback is handled inside the app',
                style: TextStyle(color: Color(0xFF7D8BA3), fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCloudPickerOption({
    required BuildContext ctx,
    String? assetPath,
    Icon? icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (assetPath != null)
                Image.asset(
                  assetPath,
                  width: 28,
                  height: 28,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.cloud, color: AppColors.darkBlue),
                )
              else if (icon != null)
                icon,
              const SizedBox(width: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttachmentRow(AttachmentItem item) {
    final isAudio = item.type == AttachmentType.audio;

    return InkWell(
      onTap: () {
        if (isAudio) {
          _showAudioPlayerSheet(item);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F2F7),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Icon(
                  isAudio ? Icons.play_circle_fill : Icons.insert_drive_file,
                  color: isAudio ? AppColors.background : AppColors.darkBlue,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        isAudio ? 'Tap to play audio file' : 'Tap to preview file',
                        style: const TextStyle(
                          color: Color(0xFF7D8BA3),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _getFileSizeString(item.path),
                        style: const TextStyle(
                          color: Color(0xFF49B3F3),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => _removeAttachment(item.id),
              borderRadius: BorderRadius.circular(16),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.close, size: 20, color: Color(0xFF7D8BA3)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            FraudTopBar(title: ReportFraudFlowData.currentReportTitle),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(title: 'ADD ATTACHMENT'),
                    const SizedBox(height: 5),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Submit evidence if available e.g. document, photo, video, audio etc.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: InkWell(
                        onTap: _showCloudPicker,
                        borderRadius: BorderRadius.circular(24),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 28),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F2F7),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.cloud_upload_outlined, size: 42, color: AppColors.background),
                              SizedBox(height: 14),
                              Text(
                                'Upload any relevant documents, photos, videos, or audio recordings to support your report',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: const Color(0xFFBFC9D6),
                              thickness: 1,
                              endIndent: 12,
                            ),
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                              color: Color(0xFF7D8BA3),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: const Color(0xFFBFC9D6),
                              thickness: 1,
                              indent: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AttachmentAction(
                            assetPath: 'assets/capture.png',
                            label: 'Open Camera & Capture',
                            onTap: _capturePhoto,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AttachmentAction(
                            assetPath: 'assets/record.png',
                            label: _recordingAudio ? 'Stop Recording' : 'Record Audio File',
                            onTap: _recordAudio,
                            isRecording: _recordingAudio,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // removed the separate Upload File button — cloud area now handles provider selection
                    const SizedBox(height: 14),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeInOut,
                      height: _attachmentsCollapsed ? 82 : 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F2F7),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: _toggleAttachmentsPanel,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 6),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 38,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFCBD3DE),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
                                  if (_attachmentsCollapsed)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        _attachments.isEmpty
                                            ? '0 files attached'
                                            : '${_attachments.length} file${_attachments.length == 1 ? '' : 's'} attached',
                                        style: const TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          if (!_attachmentsCollapsed)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: _attachments.isEmpty
                                    ? const Center(
                                        child: Text(
                                          'No attachments added yet',
                                          style: TextStyle(
                                            color: Color(0xFF7D8BA3),
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    : ListView.separated(
                                        itemCount: _attachments.length,
                                        separatorBuilder: (context, index) => const SizedBox(height: 4),
                                        itemBuilder: (context, index) => _buildAttachmentRow(_attachments[index]),
                                      ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 16),
                    const Text(
                      'Each uploaded file will be archived and not editable. Please review to ensure completeness.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7D8BA3),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.reportFraudAcknowledgement);
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.background,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        ),
                        child: const Text(
                          'SAVE AND CONTINUE',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
