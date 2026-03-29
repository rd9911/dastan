import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/offline/application/offline_utils.dart';
import 'package:dastan/src/features/offline/domain/offline_manifest.dart';

class OfflineRepository {
  final AppDatabase _db;

  OfflineRepository(this._db);

  /// Saves an offline bundle manifest and its associated metadata (assets, index)
  /// to the local database.
  ///
  /// This is a transactional operation.
  Future<String> saveBundle(OfflineBundleManifest manifest) async {
    return _db.transaction(() async {
      // 1. Compute Bundle ID
      // For now, we use a simple content hash or UUID.
      // Ideally, the packager provides the hash, or we compute it from JSON content.
      final jsonString = jsonEncode(manifest.toJson());
      final manifestHash = sha256
          .convert(utf8.encode(jsonString))
          .toString(); // Needs crypto import?
      // Actually OfflineUtils uses crypto, let's use that or pass it.
      // Re-using OfflineUtils if possible, or just re-importing crypto here.

      final bundleId = OfflineUtils.generateBundleId(
        itineraryId: manifest.itineraryId,
        version: manifest.version,
        manifestHash: manifestHash,
      );

      // 2. Insert into OfflineBundles
      await _db
          .into(_db.offlineBundles)
          .insert(
            OfflineBundleRow(
              itineraryId: manifest.itineraryId,
              version: manifest.version,
              id: bundleId,
              createdAt: manifest.createdAt,
              sizeBytes: manifest.metadata['size'] as int? ?? 0,
              path: manifest.metadata['path'] as String? ?? '',
            ),
            mode: InsertMode.insertOrReplace,
          );

      // 3. Insert Assets
      // First delete existing assets for this bundle if replacing (cascade handles it likely, but safe to be sure)
      // Actually insertOrReplace on bundle might not cascade delete old children immediately if ID is same?
      // Since ID is hash-based, update implies new ID usually. If same ID, contents are same.
      // Just insert ignore or replace.

      final assetRows = manifest.assets
          .map(
            (a) => BundleAssetRow(
              bundleId: bundleId,
              path: a.path,
              originalUrl: a.originalUrl,
              kind: a.kind.name,
              sha256: a.sha256,
            ),
          )
          .toList();

      if (assetRows.isNotEmpty) {
        await _db.batch((batch) {
          batch.insertAll(
            _db.bundleAssets,
            assetRows,
            mode: InsertMode.insertOrReplace,
          );
        });
      }

      // 4. Insert Search Index
      final indexRows = manifest.searchIndex
          .map(
            (entry) => LocalSearchIndexRow(
              bundleId: bundleId,
              token: entry.tokenId,
              itemIds: jsonEncode(entry.itemIds),
            ),
          )
          .toList();

      if (indexRows.isNotEmpty) {
        await _db.batch((batch) {
          batch.insertAll(
            _db.localSearchIndex,
            indexRows,
            mode: InsertMode.insertOrReplace,
          );
        });
      }

      return bundleId;
    });
  }

  Future<void> deleteBundle(String bundleId) async {
    await (_db.delete(
      _db.offlineBundles,
    )..where((t) => t.id.equals(bundleId))).go();
  }

  Future<OfflineBundleRow?> getBundle(String itineraryId) async {
    final query = _db.select(_db.offlineBundles)
      ..where((t) => t.itineraryId.equals(itineraryId))
      ..orderBy([
        (t) => OrderingTerm(expression: t.version, mode: OrderingMode.desc),
      ])
      ..limit(1);

    return query.getSingleOrNull();
  }
}
