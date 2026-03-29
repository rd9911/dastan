import 'dart:convert';
import 'package:crypto/crypto.dart';

class OfflineUtils {
  /// Generates a deterministic bundle ID based on the contents.
  /// Format: sha256(itineraryId|version|manifestHash)
  static String generateBundleId({
    required String itineraryId,
    required int version,
    required String manifestHash,
  }) {
    final input = '$itineraryId|$version|$manifestHash';
    return sha256.convert(utf8.encode(input)).toString();
  }

  /// Generates a deterministic share ID.
  /// Format: sha256(itineraryId|version|privacyHash|expiryIso)
  static String generateShareId({
    required String itineraryId,
    required int version,
    required String privacyHash,
    required DateTime expiry,
  }) {
    final input =
        '$itineraryId|$version|$privacyHash|${expiry.toIso8601String()}';
    return sha256.convert(utf8.encode(input)).toString();
  }
}
