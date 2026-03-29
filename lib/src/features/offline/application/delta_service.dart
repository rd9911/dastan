import 'package:dastan/src/features/offline/domain/offline_manifest.dart';

/// Represents a change between two bundle versions.
class BundleDelta {
  final List<BundleAsset> added;
  final List<BundleAsset> removed;
  final List<BundleAsset> modified;

  const BundleDelta({
    required this.added,
    required this.removed,
    required this.modified,
  });

  bool get isEmpty => added.isEmpty && removed.isEmpty && modified.isEmpty;
  int get totalChanges => added.length + removed.length + modified.length;
}

class DeltaService {
  /// Computes the delta between two manifests.
  BundleDelta computeDelta(
    OfflineBundleManifest oldManifest,
    OfflineBundleManifest newManifest,
  ) {
    final oldAssets = {for (final a in oldManifest.assets) a.path: a};
    final newAssets = {for (final a in newManifest.assets) a.path: a};

    final added = <BundleAsset>[];
    final removed = <BundleAsset>[];
    final modified = <BundleAsset>[];

    // Find added and modified
    for (final entry in newAssets.entries) {
      final oldAsset = oldAssets[entry.key];
      if (oldAsset == null) {
        added.add(entry.value);
      } else if (oldAsset.sha256 != entry.value.sha256) {
        modified.add(entry.value);
      }
    }

    // Find removed
    for (final entry in oldAssets.entries) {
      if (!newAssets.containsKey(entry.key)) {
        removed.add(entry.value);
      }
    }

    return BundleDelta(added: added, removed: removed, modified: modified);
  }

  /// Applies a delta to update the bundle.
  /// Returns the list of assets that need to be downloaded.
  Future<List<BundleAsset>> applyDelta(
    String bundleId,
    BundleDelta delta, {
    required Future<void> Function(BundleAsset asset) downloadAsset,
    required Future<void> Function(String path) deleteAsset,
  }) async {
    // Delete removed assets
    for (final asset in delta.removed) {
      await deleteAsset(asset.path);
    }

    // Download added and modified assets
    final toDownload = [...delta.added, ...delta.modified];
    for (final asset in toDownload) {
      await downloadAsset(asset);
    }

    return toDownload;
  }
}
