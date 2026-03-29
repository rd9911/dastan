import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';

part 'offline_manifest.freezed.dart';
part 'offline_manifest.g.dart';

@freezed
abstract class OfflineBundleManifest with _$OfflineBundleManifest {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory OfflineBundleManifest({
    required String itineraryId,
    required int version,
    required DateTime createdAt,
    required Map<ItinerarySection, List<SavedItem>> sections,
    required List<DayPlan> dayPlans,
    required List<BundleAsset> assets,
    required List<SearchIndexEntry> searchIndex,
    required Map<String, dynamic> metadata,
  }) = _OfflineBundleManifest;

  const OfflineBundleManifest._();

  factory OfflineBundleManifest.fromJson(Map<String, dynamic> json) =>
      _$OfflineBundleManifestFromJson(json);
}

@freezed
abstract class BundleAsset with _$BundleAsset {
  const factory BundleAsset({
    required String path,
    required String originalUrl,
    required String sha256,
    required BundleAssetKind kind,
  }) = _BundleAsset;

  factory BundleAsset.fromJson(Map<String, dynamic> json) =>
      _$BundleAssetFromJson(json);
}

enum BundleAssetKind { image, tile, other }

@freezed
abstract class SearchIndexEntry with _$SearchIndexEntry {
  const factory SearchIndexEntry({
    required String tokenId,
    required List<String> itemIds,
  }) = _SearchIndexEntry;

  factory SearchIndexEntry.fromJson(Map<String, dynamic> json) =>
      _$SearchIndexEntryFromJson(json);
}
