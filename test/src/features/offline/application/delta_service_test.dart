import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/offline/application/delta_service.dart';
import 'package:dastan/src/features/offline/domain/offline_manifest.dart';

void main() {
  late DeltaService service;

  setUp(() {
    service = DeltaService();
  });

  group('computeDelta', () {
    test('returns empty delta for identical manifests', () {
      final manifest = OfflineBundleManifest(
        itineraryId: 'i1',
        version: 1,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'a.jpg',
            originalUrl: 'u1',
            sha256: 'h1',
            kind: BundleAssetKind.image,
          ),
        ],
        searchIndex: [],
        metadata: {},
      );

      final delta = service.computeDelta(manifest, manifest);
      expect(delta.isEmpty, true);
    });

    test('detects added assets', () {
      final oldManifest = OfflineBundleManifest(
        itineraryId: 'i1',
        version: 1,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [],
        searchIndex: [],
        metadata: {},
      );

      final newManifest = OfflineBundleManifest(
        itineraryId: 'i1',
        version: 2,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'a.jpg',
            originalUrl: 'u1',
            sha256: 'h1',
            kind: BundleAssetKind.image,
          ),
        ],
        searchIndex: [],
        metadata: {},
      );

      final delta = service.computeDelta(oldManifest, newManifest);
      expect(delta.added.length, 1);
      expect(delta.removed.length, 0);
      expect(delta.modified.length, 0);
    });

    test('detects removed assets', () {
      final oldManifest = OfflineBundleManifest(
        itineraryId: 'i1',
        version: 1,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'a.jpg',
            originalUrl: 'u1',
            sha256: 'h1',
            kind: BundleAssetKind.image,
          ),
        ],
        searchIndex: [],
        metadata: {},
      );

      final newManifest = OfflineBundleManifest(
        itineraryId: 'i1',
        version: 2,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [],
        searchIndex: [],
        metadata: {},
      );

      final delta = service.computeDelta(oldManifest, newManifest);
      expect(delta.added.length, 0);
      expect(delta.removed.length, 1);
      expect(delta.modified.length, 0);
    });

    test('detects modified assets by sha256 change', () {
      final oldManifest = OfflineBundleManifest(
        itineraryId: 'i1',
        version: 1,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'a.jpg',
            originalUrl: 'u1',
            sha256: 'h1',
            kind: BundleAssetKind.image,
          ),
        ],
        searchIndex: [],
        metadata: {},
      );

      final newManifest = OfflineBundleManifest(
        itineraryId: 'i1',
        version: 2,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'a.jpg',
            originalUrl: 'u1',
            sha256: 'h2',
            kind: BundleAssetKind.image,
          ),
        ],
        searchIndex: [],
        metadata: {},
      );

      final delta = service.computeDelta(oldManifest, newManifest);
      expect(delta.added.length, 0);
      expect(delta.removed.length, 0);
      expect(delta.modified.length, 1);
    });
  });

  group('applyDelta', () {
    test('calls download for added and modified, delete for removed', () async {
      final delta = BundleDelta(
        added: [
          const BundleAsset(
            path: 'new.jpg',
            originalUrl: 'u1',
            sha256: 'h1',
            kind: BundleAssetKind.image,
          ),
        ],
        removed: [
          const BundleAsset(
            path: 'old.jpg',
            originalUrl: 'u2',
            sha256: 'h2',
            kind: BundleAssetKind.image,
          ),
        ],
        modified: [
          const BundleAsset(
            path: 'mod.jpg',
            originalUrl: 'u3',
            sha256: 'h3',
            kind: BundleAssetKind.image,
          ),
        ],
      );

      final downloadedPaths = <String>[];
      final deletedPaths = <String>[];

      await service.applyDelta(
        'bundle1',
        delta,
        downloadAsset: (asset) async => downloadedPaths.add(asset.path),
        deleteAsset: (path) async => deletedPaths.add(path),
      );

      expect(downloadedPaths, containsAll(['new.jpg', 'mod.jpg']));
      expect(deletedPaths, contains('old.jpg'));
    });
  });
}
