import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
import 'package:drift/native.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/offline/data/offline_repository.dart';
import 'package:dastan/src/features/offline/domain/offline_manifest.dart';

void main() {
  late AppDatabase db;
  late OfflineRepository repository;

  setUp(() {
    db = AppDatabase.connect(NativeDatabase.memory());
    repository = OfflineRepository(db);
  });

  tearDown(() {
    db.close();
  });

  test('saveBundle stores manifest, assets, and index', () async {
    final manifest = OfflineBundleManifest(
      itineraryId: 'i1',
      version: 1,
      createdAt: DateTime.now(),
      sections: {},
      dayPlans: [],
      assets: [
        const BundleAsset(
          path: 'p1',
          originalUrl: 'u1',
          kind: BundleAssetKind.image,
          sha256: 'h1',
        ),
      ],
      searchIndex: [
        const SearchIndexEntry(tokenId: 't1', itemIds: ['ref1']),
      ],
      metadata: {'size': 100},
    );

    final bundleId = await repository.saveBundle(manifest);

    // Verify bundle row
    final bundle = await (db.select(
      db.offlineBundles,
    )..where((t) => t.id.equals(bundleId))).getSingle();

    expect(bundle.itineraryId, 'i1');
    expect(bundle.sizeBytes, 100);

    // Verify assets
    final assets = await (db.select(
      db.bundleAssets,
    )..where((t) => t.bundleId.equals(bundleId))).get();
    expect(assets.length, 1);
    expect(assets.first.path, 'p1');

    // Verify index
    final index = await (db.select(
      db.localSearchIndex,
    )..where((t) => t.bundleId.equals(bundleId))).get();
    expect(index.length, 1);
    expect(index.first.token, 't1');
  });
}
