import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/offline/application/security_utils.dart';

void main() {
  group('computeIntegrityHash', () {
    test('produces consistent hash for same data', () {
      final data = Uint8List.fromList([1, 2, 3, 4, 5]);
      final hash1 = SecurityUtils.computeIntegrityHash(data);
      final hash2 = SecurityUtils.computeIntegrityHash(data);
      expect(hash1, hash2);
    });

    test('produces different hash for different data', () {
      final data1 = Uint8List.fromList([1, 2, 3]);
      final data2 = Uint8List.fromList([1, 2, 4]);
      final hash1 = SecurityUtils.computeIntegrityHash(data1);
      final hash2 = SecurityUtils.computeIntegrityHash(data2);
      expect(hash1, isNot(hash2));
    });
  });

  group('verifyIntegrity', () {
    test('returns true for matching hash', () {
      final data = Uint8List.fromList([1, 2, 3, 4, 5]);
      final hash = SecurityUtils.computeIntegrityHash(data);
      expect(SecurityUtils.verifyIntegrity(data, hash), true);
    });

    test('returns false for mismatched hash', () {
      final data = Uint8List.fromList([1, 2, 3, 4, 5]);
      expect(SecurityUtils.verifyIntegrity(data, 'wronghash'), false);
    });
  });

  group('obfuscate/deobfuscate', () {
    test('round-trip preserves data', () {
      final data = Uint8List.fromList([72, 101, 108, 108, 111]); // "Hello"
      const key = 'secret';

      final obfuscated = SecurityUtils.obfuscate(data, key);
      final deobfuscated = SecurityUtils.deobfuscate(obfuscated, key);

      expect(deobfuscated, data);
    });

    test('obfuscated data differs from original', () {
      final data = Uint8List.fromList([72, 101, 108, 108, 111]);
      const key = 'secret';

      final obfuscated = SecurityUtils.obfuscate(data, key);

      expect(obfuscated, isNot(data));
    });
  });

  group('stripExifFromJpeg', () {
    test('returns non-JPEG data unchanged', () {
      final data = Uint8List.fromList([1, 2, 3, 4, 5]);
      final result = SecurityUtils.stripExifFromJpeg(data);
      expect(result, data);
    });

    test('preserves JPEG SOI marker', () {
      // Minimal JPEG: SOI + EOI
      final jpeg = Uint8List.fromList([0xFF, 0xD8, 0xFF, 0xD9]);
      final result = SecurityUtils.stripExifFromJpeg(jpeg);
      expect(result[0], 0xFF);
      expect(result[1], 0xD8);
    });
  });
}
