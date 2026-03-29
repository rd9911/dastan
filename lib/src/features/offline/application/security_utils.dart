import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

/// Security utilities for offline bundles.
class SecurityUtils {
  /// Generates a content integrity hash for verification.
  static String computeIntegrityHash(Uint8List data) {
    return sha256.convert(data).toString();
  }

  /// Verifies data integrity against expected hash.
  static bool verifyIntegrity(Uint8List data, String expectedHash) {
    return computeIntegrityHash(data) == expectedHash;
  }

  /// Simple XOR-based obfuscation for bundle metadata.
  /// Note: For production, use proper encryption (e.g., AES via pointycastle).
  static Uint8List obfuscate(Uint8List data, String key) {
    final keyBytes = utf8.encode(key);
    final result = Uint8List(data.length);
    for (int i = 0; i < data.length; i++) {
      result[i] = data[i] ^ keyBytes[i % keyBytes.length];
    }
    return result;
  }

  /// Deobfuscates data (XOR is symmetric).
  static Uint8List deobfuscate(Uint8List data, String key) {
    return obfuscate(data, key); // XOR is its own inverse
  }

  /// Strips EXIF metadata from JPEG images.
  /// This is a simplified implementation that removes APP1 segments.
  static Uint8List stripExifFromJpeg(Uint8List jpegData) {
    if (jpegData.length < 2 || jpegData[0] != 0xFF || jpegData[1] != 0xD8) {
      return jpegData; // Not a valid JPEG
    }

    final result = <int>[];
    result.addAll([0xFF, 0xD8]); // SOI marker

    int i = 2;
    while (i < jpegData.length - 1) {
      if (jpegData[i] != 0xFF) {
        i++;
        continue;
      }

      final marker = jpegData[i + 1];

      // Skip APP1 (EXIF) segments (0xE1)
      if (marker == 0xE1) {
        if (i + 3 < jpegData.length) {
          final segmentLength = (jpegData[i + 2] << 8) | jpegData[i + 3];
          i += 2 + segmentLength;
          continue;
        }
      }

      // End of image
      if (marker == 0xD9) {
        result.addAll([0xFF, 0xD9]);
        break;
      }

      // Start of scan - copy rest of file
      if (marker == 0xDA) {
        result.addAll(jpegData.sublist(i));
        break;
      }

      // Copy other segments
      if (marker >= 0xE0 && marker <= 0xEF ||
          marker == 0xFE ||
          marker == 0xDB ||
          marker == 0xC0 ||
          marker == 0xC4 ||
          marker == 0xDD) {
        if (i + 3 < jpegData.length) {
          final segmentLength = (jpegData[i + 2] << 8) | jpegData[i + 3];
          result.addAll(jpegData.sublist(i, i + 2 + segmentLength));
          i += 2 + segmentLength;
          continue;
        }
      }

      result.addAll([jpegData[i], jpegData[i + 1]]);
      i += 2;
    }

    return Uint8List.fromList(result);
  }
}
