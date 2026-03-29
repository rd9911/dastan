// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapItem _$MapItemFromJson(Map<String, dynamic> json) => _MapItem(
  id: json['id'] as String,
  type: $enumDecode(_$MapItemTypeEnumMap, json['type']),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  iconUrl: json['iconUrl'] as String?,
  dedupeKey: json['dedupeKey'] as String,
  geometry:
      (json['geometry'] as List<dynamic>?)
          ?.map((e) => MapPoint.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MapItemToJson(_MapItem instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$MapItemTypeEnumMap[instance.type]!,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'iconUrl': instance.iconUrl,
  'dedupeKey': instance.dedupeKey,
  'geometry': instance.geometry.map((e) => e.toJson()).toList(),
};

const _$MapItemTypeEnumMap = {
  MapItemType.transport: 'transport',
  MapItemType.accommodation: 'accommodation',
  MapItemType.entertainment: 'entertainment',
  MapItemType.gastronomy: 'gastronomy',
  MapItemType.events: 'events',
  MapItemType.trails: 'trails',
  MapItemType.custom: 'custom',
};

_MapPoint _$MapPointFromJson(Map<String, dynamic> json) => _MapPoint(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
);

Map<String, dynamic> _$MapPointToJson(_MapPoint instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
};

_MapSnapshotRequest _$MapSnapshotRequestFromJson(Map<String, dynamic> json) =>
    _MapSnapshotRequest(
      itineraryId: json['itineraryId'] as String,
      centerLat: (json['centerLat'] as num).toDouble(),
      centerLng: (json['centerLng'] as num).toDouble(),
      zoom: (json['zoom'] as num).toDouble(),
      theme: $enumDecode(_$MapThemeEnumMap, json['theme']),
      highlightItemIds:
          (json['highlightItemIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MapSnapshotRequestToJson(_MapSnapshotRequest instance) =>
    <String, dynamic>{
      'itineraryId': instance.itineraryId,
      'centerLat': instance.centerLat,
      'centerLng': instance.centerLng,
      'zoom': instance.zoom,
      'theme': _$MapThemeEnumMap[instance.theme]!,
      'highlightItemIds': instance.highlightItemIds,
    };

const _$MapThemeEnumMap = {
  MapTheme.standard: 'standard',
  MapTheme.dark: 'dark',
  MapTheme.retro: 'retro',
  MapTheme.satellite: 'satellite',
};

_MapSnapshotResponse _$MapSnapshotResponseFromJson(Map<String, dynamic> json) =>
    _MapSnapshotResponse(
      snapshotId: json['snapshotId'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MapSnapshotResponseToJson(
  _MapSnapshotResponse instance,
) => <String, dynamic>{
  'snapshotId': instance.snapshotId,
  'imageUrl': instance.imageUrl,
  'createdAt': instance.createdAt.toIso8601String(),
};
