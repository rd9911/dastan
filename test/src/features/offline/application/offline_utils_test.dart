import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/offline/application/offline_utils.dart';

void main() {
  group('OfflineUtils', () {
    test('generateBundleId is deterministic', () {
      final id1 = OfflineUtils.generateBundleId(
        itineraryId: 'abc',
        version: 1,
        manifestHash: 'hash123',
      );
      final id2 = OfflineUtils.generateBundleId(
        itineraryId: 'abc',
        version: 1,
        manifestHash: 'hash123',
      );
      expect(id1, id2);
    });

    test('generateBundleId changes with different inputs', () {
      final id1 = OfflineUtils.generateBundleId(
        itineraryId: 'abc',
        version: 1,
        manifestHash: 'hash123',
      );
      final id2 = OfflineUtils.generateBundleId(
        itineraryId: 'abc',
        version: 2, // changed
        manifestHash: 'hash123',
      );
      expect(id1, isNot(id2));
    });

    test('generateShareId is deterministic', () {
      final id1 = OfflineUtils.generateShareId(
        itineraryId: 'abc',
        version: 1,
        privacyHash: 'priv1',
        expiry: DateTime.utc(2025, 1, 1),
      );
      final id2 = OfflineUtils.generateShareId(
        itineraryId: 'abc',
        version: 1,
        privacyHash: 'priv1',
        expiry: DateTime.utc(2025, 1, 1),
      );
      expect(id1, id2);
    });
  });
}
