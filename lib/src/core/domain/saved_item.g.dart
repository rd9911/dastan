// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedItemExternal _$SavedItemExternalFromJson(Map<String, dynamic> json) =>
    _SavedItemExternal(
      vendor: json['vendor'] as String,
      vendorUrl: json['vendorUrl'] as String?,
      externalId: json['externalId'] as String?,
    );

Map<String, dynamic> _$SavedItemExternalToJson(_SavedItemExternal instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'vendorUrl': instance.vendorUrl,
      'externalId': instance.externalId,
    };

_SavedItemTime _$SavedItemTimeFromJson(Map<String, dynamic> json) =>
    _SavedItemTime(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$SavedItemTimeToJson(_SavedItemTime instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };

_SavedItemLocation _$SavedItemLocationFromJson(Map<String, dynamic> json) =>
    _SavedItemLocation(
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$SavedItemLocationToJson(_SavedItemLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
    };

_SavedItemSync _$SavedItemSyncFromJson(Map<String, dynamic> json) =>
    _SavedItemSync(
      status: $enumDecode(_$SyncStatusEnumMap, json['status']),
      lastAttemptAt: json['lastAttemptAt'] == null
          ? null
          : DateTime.parse(json['lastAttemptAt'] as String),
    );

Map<String, dynamic> _$SavedItemSyncToJson(_SavedItemSync instance) =>
    <String, dynamic>{
      'status': _$SyncStatusEnumMap[instance.status]!,
      'lastAttemptAt': instance.lastAttemptAt?.toIso8601String(),
    };

const _$SyncStatusEnumMap = {
  SyncStatus.queued: 'queued',
  SyncStatus.synced: 'synced',
  SyncStatus.error: 'error',
};

_SavedItem _$SavedItemFromJson(Map<String, dynamic> json) => _SavedItem(
  id: json['id'] as String,
  itineraryId: json['itineraryId'] as String,
  section: $enumDecode(_$FeatureVerticalEnumMap, json['section']),
  title: json['title'] as String,
  details: json['details'] as Map<String, dynamic>,
  externalData: json['externalData'] == null
      ? null
      : SavedItemExternal.fromJson(
          json['externalData'] as Map<String, dynamic>,
        ),
  time: json['time'] == null
      ? null
      : SavedItemTime.fromJson(json['time'] as Map<String, dynamic>),
  location: json['location'] == null
      ? null
      : SavedItemLocation.fromJson(json['location'] as Map<String, dynamic>),
  media:
      (json['media'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  dedupeKey: json['dedupeKey'] as String,
  sync: SavedItemSync.fromJson(json['sync'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$SavedItemToJson(_SavedItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itineraryId': instance.itineraryId,
      'section': _$FeatureVerticalEnumMap[instance.section]!,
      'title': instance.title,
      'details': instance.details,
      'externalData': instance.externalData?.toJson(),
      'time': instance.time?.toJson(),
      'location': instance.location?.toJson(),
      'media': instance.media,
      'dedupeKey': instance.dedupeKey,
      'sync': instance.sync.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$FeatureVerticalEnumMap = {
  FeatureVertical.transport: 'transport',
  FeatureVertical.accommodation: 'accommodation',
  FeatureVertical.entertainment: 'entertainment',
  FeatureVertical.gastronomy: 'gastronomy',
  FeatureVertical.events: 'events',
  FeatureVertical.trails: 'trails',
};
