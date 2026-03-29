// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfflineBundleManifest _$OfflineBundleManifestFromJson(
  Map<String, dynamic> json,
) => _OfflineBundleManifest(
  itineraryId: json['itineraryId'] as String,
  version: (json['version'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  sections: (json['sections'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      $enumDecode(_$FeatureVerticalEnumMap, k),
      (e as List<dynamic>)
          .map((e) => SavedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
  dayPlans: (json['dayPlans'] as List<dynamic>)
      .map((e) => DayPlan.fromJson(e as Map<String, dynamic>))
      .toList(),
  assets: (json['assets'] as List<dynamic>)
      .map((e) => BundleAsset.fromJson(e as Map<String, dynamic>))
      .toList(),
  searchIndex: (json['searchIndex'] as List<dynamic>)
      .map((e) => SearchIndexEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$OfflineBundleManifestToJson(
  _OfflineBundleManifest instance,
) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'version': instance.version,
  'createdAt': instance.createdAt.toIso8601String(),
  'sections': instance.sections.map(
    (k, e) => MapEntry(
      _$FeatureVerticalEnumMap[k]!,
      e.map((e) => e.toJson()).toList(),
    ),
  ),
  'dayPlans': instance.dayPlans.map((e) => e.toJson()).toList(),
  'assets': instance.assets.map((e) => e.toJson()).toList(),
  'searchIndex': instance.searchIndex.map((e) => e.toJson()).toList(),
  'metadata': instance.metadata,
};

const _$FeatureVerticalEnumMap = {
  FeatureVertical.transport: 'transport',
  FeatureVertical.accommodation: 'accommodation',
  FeatureVertical.entertainment: 'entertainment',
  FeatureVertical.gastronomy: 'gastronomy',
  FeatureVertical.events: 'events',
  FeatureVertical.trails: 'trails',
};

_BundleAsset _$BundleAssetFromJson(Map<String, dynamic> json) => _BundleAsset(
  path: json['path'] as String,
  originalUrl: json['originalUrl'] as String,
  sha256: json['sha256'] as String,
  kind: $enumDecode(_$BundleAssetKindEnumMap, json['kind']),
);

Map<String, dynamic> _$BundleAssetToJson(_BundleAsset instance) =>
    <String, dynamic>{
      'path': instance.path,
      'originalUrl': instance.originalUrl,
      'sha256': instance.sha256,
      'kind': _$BundleAssetKindEnumMap[instance.kind]!,
    };

const _$BundleAssetKindEnumMap = {
  BundleAssetKind.image: 'image',
  BundleAssetKind.tile: 'tile',
  BundleAssetKind.other: 'other',
};

_SearchIndexEntry _$SearchIndexEntryFromJson(Map<String, dynamic> json) =>
    _SearchIndexEntry(
      tokenId: json['tokenId'] as String,
      itemIds: (json['itemIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SearchIndexEntryToJson(_SearchIndexEntry instance) =>
    <String, dynamic>{'tokenId': instance.tokenId, 'itemIds': instance.itemIds};
