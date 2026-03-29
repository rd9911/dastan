import 'dart:convert';
import 'dart:typed_data';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/offline/domain/offline_manifest.dart';
import 'package:dastan/src/features/offline/domain/share_models.dart';
import 'package:dastan/src/features/offline/data/offline_repository.dart';
import 'package:dastan/src/features/offline/application/delta_service.dart';
import 'package:dastan/src/features/offline/application/share_service.dart';
import 'package:dastan/src/features/offline/application/security_utils.dart';

/// E2E Integration Tests for Story 10: Offline Snapshot & Share Flow
/// Tests AC1-AC8 acceptance criteria.
void main() {
  late AppDatabase db;
  late OfflineRepository repository;
  late DeltaService deltaService;
  late ShareService shareService;

  setUp(() {
    db = AppDatabase.connect(NativeDatabase.memory());
    repository = OfflineRepository(db);
    deltaService = DeltaService();
    shareService = ShareService();
  });

  tearDown(() => db.close());

  group('E2E: Offline Bundle Workflow', () {
    test('AC1: Create offline bundle and persist to database', () async {
      // Simulate creating a bundle
      final manifest = OfflineBundleManifest(
        itineraryId: 'trip-paris',
        version: 1,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'photo1.jpg',
            originalUrl: 'https://example.com/1.jpg',
            sha256: 'abc123',
            kind: BundleAssetKind.image,
          ),
          const BundleAsset(
            path: 'map.tile',
            originalUrl: 'https://tiles.example.com/x/y/z',
            sha256: 'def456',
            kind: BundleAssetKind.tile,
          ),
        ],
        searchIndex: [
          const SearchIndexEntry(tokenId: 'eiffel', itemIds: ['item1']),
        ],
        metadata: {'size': 1024000},
      );

      // Save bundle
      final bundleId = await repository.saveBundle(manifest);
      expect(bundleId.isNotEmpty, true);

      // Verify bundle exists
      final retrieved = await repository.getBundle('trip-paris');
      expect(retrieved, isNotNull);
      expect(retrieved!.itineraryId, 'trip-paris');
    });

    test('AC2: Bundle integrity verification', () async {
      final testData = Uint8List.fromList(utf8.encode('bundle content'));
      final hash = SecurityUtils.computeIntegrityHash(testData);

      expect(SecurityUtils.verifyIntegrity(testData, hash), true);
      expect(SecurityUtils.verifyIntegrity(testData, 'tampered'), false);
    });

    test('AC3: Delta update detects changes efficiently', () async {
      final oldManifest = OfflineBundleManifest(
        itineraryId: 'trip',
        version: 1,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'a.jpg',
            originalUrl: 'u1',
            sha256: 'hash1',
            kind: BundleAssetKind.image,
          ),
          const BundleAsset(
            path: 'b.jpg',
            originalUrl: 'u2',
            sha256: 'hash2',
            kind: BundleAssetKind.image,
          ),
        ],
        searchIndex: [],
        metadata: {},
      );

      final newManifest = OfflineBundleManifest(
        itineraryId: 'trip',
        version: 2,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'a.jpg',
            originalUrl: 'u1',
            sha256: 'hash1',
            kind: BundleAssetKind.image,
          ), // unchanged
          const BundleAsset(
            path: 'c.jpg',
            originalUrl: 'u3',
            sha256: 'hash3',
            kind: BundleAssetKind.image,
          ), // added
        ],
        searchIndex: [],
        metadata: {},
      );

      final delta = deltaService.computeDelta(oldManifest, newManifest);
      expect(delta.added.length, 1); // c.jpg
      expect(delta.removed.length, 1); // b.jpg
      expect(delta.modified.length, 0);
    });

    test('AC4: Share link with privacy redaction', () async {
      const config = ShareConfig(
        excludeNotes: true,
        excludePricing: true,
        reduceLocationPrecision: true,
        expiryDays: 7,
      );

      final link = await shareService.createShareLink(
        itineraryId: 'trip-paris',
        version: 1,
        config: config,
      );

      expect(link.url.contains('share'), true);
      expect(link.expiresAt, isNotNull);

      // Test privacy redaction
      final sensitiveData = {
        'title': 'Paris Trip',
        'notes': 'Secret notes',
        'price': 1500.0,
        'latitude': 48.8566,
        'longitude': 2.3522,
      };

      final redacted = shareService.applyPrivacyRedactions(
        sensitiveData,
        config,
      );
      expect(redacted.containsKey('notes'), false);
      expect(redacted.containsKey('price'), false);
      expect(redacted['latitude'], 49.0); // Rounded
    });

    test('AC5: EXIF stripping for shared images', () async {
      // Minimal JPEG with simulated EXIF segment
      final jpegWithExif = Uint8List.fromList([
        0xFF, 0xD8, // SOI
        0xFF, 0xE1, 0x00, 0x10, // APP1 (EXIF) with 16-byte payload
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0xFF, 0xD9, // EOI
      ]);

      final stripped = SecurityUtils.stripExifFromJpeg(jpegWithExif);

      // Should still be valid JPEG
      expect(stripped[0], 0xFF);
      expect(stripped[1], 0xD8);
      // Should have removed EXIF segment (size should be smaller)
      expect(stripped.length, lessThan(jpegWithExif.length));
    });

    test('AC6: Deterministic bundle IDs for idempotency', () async {
      final manifest1 = OfflineBundleManifest(
        itineraryId: 'trip',
        version: 1,
        createdAt: DateTime(2024, 1, 1),
        sections: {},
        dayPlans: [],
        assets: [],
        searchIndex: [],
        metadata: {'hash': 'contenthash'},
      );

      // Save same manifest twice (should be idempotent)
      final id1 = await repository.saveBundle(manifest1);
      final id2 = await repository.saveBundle(manifest1);

      expect(id1, id2); // Same inputs = same ID
    });
  });
}
