import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';


class CompressionService {

  Future<File?> compressFile(File inputFile) async {
    try {
      final bytes = await inputFile.readAsBytes();
      
      final compressed = gzip.encode(bytes);
      
      final tempDir = await getTemporaryDirectory();
      final compressedFileName = '${inputFile.path.split('/').last}.gz';
      final compressedFile = File('${tempDir.path}/$compressedFileName');
      
      await compressedFile.writeAsBytes(compressed);
      return compressedFile;
    } catch (e) {
      return null;
    }
  }

  Future<String?> compressFileToBase64(File inputFile) async {
    try {
      final bytes = await inputFile.readAsBytes();
      
      final compressed = gzip.encode(bytes);
      
      return base64Encode(compressed);
    } catch (e) {
      return null;
    }
  }

  Future<double?> getCompressionRatio(File inputFile) async {
    try {
      final bytes = await inputFile.readAsBytes();
      final compressed = gzip.encode(bytes);
      
      final originalSize = bytes.length;
      final compressedSize = compressed.length;
      
      return compressedSize / originalSize;
    } catch (e) {
      return null;
    }
  }

  Future<File?> decompressFile(File compressedFile) async {
    try {
      final bytes = await compressedFile.readAsBytes();
      
      final decompressed = gzip.decode(bytes);
      
      final tempDir = await getTemporaryDirectory();
      final fileName = compressedFile.path.split('/').last.replaceAll('.gz', '');
      final decompressedFile = File('${tempDir.path}/$fileName');
      
      await decompressedFile.writeAsBytes(decompressed);
      return decompressedFile;
    } catch (e) {
      return null;
    }
  }

  Future<List<int>?> decompressBase64(String base64Data) async {
    try {
      final compressed = base64Decode(base64Data);
      final decompressed = gzip.decode(compressed);
      return decompressed;
    } catch (e) {
      return null;
    }
  }

  Future<File?> compressMultipleFiles(List<File> files) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final archiveFileName = 'attachments_${DateTime.now().millisecondsSinceEpoch}.tar.gz';
      final archiveFile = File('${tempDir.path}/$archiveFileName');
      
      // Combine all files
      final allBytes = <int>[];
      for (final file in files) {
        final bytes = await file.readAsBytes();
        allBytes.addAll(bytes);
      }
      
      final compressed = gzip.encode(allBytes);
      await archiveFile.writeAsBytes(compressed);
      
      return archiveFile;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCompressionStats(File inputFile) async {
    try {
      final bytes = await inputFile.readAsBytes();
      final compressed = gzip.encode(bytes);
      
      final originalSize = bytes.length;
      final compressedSize = compressed.length;
      final savings = originalSize - compressedSize;
      final ratio = (savings / originalSize * 100).toStringAsFixed(2);
      
      return {
        'originalSize': originalSize,
        'compressedSize': compressedSize,
        'savedBytes': savings,
        'compressionRatio': ratio,
        'algorithm': 'DEFLATE/GZIP',
      };
    } catch (e) {
      return null;
    }
  }
}
