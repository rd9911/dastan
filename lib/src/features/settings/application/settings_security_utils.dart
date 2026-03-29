import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

/// Security utilities for settings encryption and data protection.
class SettingsSecurityUtils {
  /// Derives an encryption key from user credentials.
  /// In production, this would use proper key derivation (PBKDF2, Argon2).
  static Uint8List deriveKey(String userId, String secret) {
    final input = '$userId:$secret';
    final hash = sha256.convert(utf8.encode(input));
    return Uint8List.fromList(hash.bytes);
  }

  /// Encrypts sensitive data (stub - would use AES-GCM in production).
  /// For demonstration, this uses a simple XOR with the derived key.
  static String encryptSensitive(String plaintext, Uint8List key) {
    // In production, use pointcastle/encrypt for real AES-GCM
    final bytes = utf8.encode(plaintext);
    final encrypted = _xorBytes(bytes, key);
    final encoded = base64Encode(encrypted);
    return 'ENC:$encoded';
  }

  /// Decrypts sensitive data.
  static String decryptSensitive(String ciphertext, Uint8List key) {
    if (!ciphertext.startsWith('ENC:')) {
      return ciphertext; // Not encrypted
    }
    final encoded = ciphertext.substring(4);
    final encrypted = base64Decode(encoded);
    final decrypted = _xorBytes(encrypted, key);
    return utf8.decode(decrypted);
  }

  static List<int> _xorBytes(List<int> data, Uint8List key) {
    if (key.isEmpty) return data;
    final result = <int>[];
    for (var i = 0; i < data.length; i++) {
      result.add(data[i] ^ key[i % key.length]);
    }
    return result;
  }

  /// Validates that a write request is authorized.
  /// In production, this would verify JWT tokens and RLS policies.
  static bool validateWriteAuthorization({
    required String userId,
    required String resourceOwnerId,
    String? authToken,
  }) {
    // Basic ownership check
    if (userId != resourceOwnerId) {
      return false;
    }
    // Token validation would happen here
    return authToken != null && authToken.isNotEmpty;
  }

  /// Sanitizes data before storage, removing potentially dangerous content.
  static Map<String, dynamic> sanitizeForStorage(Map<String, dynamic> data) {
    final sanitized = <String, dynamic>{};
    for (final entry in data.entries) {
      final value = entry.value;
      if (value is String) {
        // Remove potential XSS/injection patterns
        sanitized[entry.key] = _sanitizeString(value);
      } else if (value is Map<String, dynamic>) {
        sanitized[entry.key] = sanitizeForStorage(value);
      } else if (value is List) {
        sanitized[entry.key] = value.map((e) {
          if (e is String) return _sanitizeString(e);
          if (e is Map<String, dynamic>) return sanitizeForStorage(e);
          return e;
        }).toList();
      } else {
        sanitized[entry.key] = value;
      }
    }
    return sanitized;
  }

  static String _sanitizeString(String input) {
    // Basic sanitization - remove script tags and common injection patterns
    return input
        .replaceAll(
          RegExp(r'<script[^>]*>.*?</script>', caseSensitive: false),
          '',
        )
        .replaceAll(RegExp(r'javascript:', caseSensitive: false), '')
        .replaceAll(RegExp(r'on\w+\s*=', caseSensitive: false), '');
  }

  /// Masks sensitive data for logging/display.
  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return '***';
    final local = parts[0];
    final domain = parts[1];
    if (local.length <= 2) return '**@$domain';
    return '${local[0]}${'*' * (local.length - 2)}${local[local.length - 1]}@$domain';
  }

  /// Masks a phone number for display.
  static String maskPhone(String phone) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 4) return '***';
    return '${'*' * (digits.length - 4)}${digits.substring(digits.length - 4)}';
  }
}
