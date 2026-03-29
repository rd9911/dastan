// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trails_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrailPlace _$TrailPlaceFromJson(Map<String, dynamic> json) => _TrailPlace(
  granularity: $enumDecode(_$PlaceGranularityEnumMap, json['granularity']),
  value: json['value'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TrailPlaceToJson(_TrailPlace instance) =>
    <String, dynamic>{
      'granularity': _$PlaceGranularityEnumMap[instance.granularity]!,
      'value': instance.value,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

const _$PlaceGranularityEnumMap = {
  PlaceGranularity.city: 'city',
  PlaceGranularity.region: 'region',
  PlaceGranularity.poi: 'poi',
  PlaceGranularity.park: 'park',
};

_TrailLocation _$TrailLocationFromJson(Map<String, dynamic> json) =>
    _TrailLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      address: json['address'] as String?,
      distanceFromCenterKm: (json['distanceFromCenterKm'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TrailLocationToJson(_TrailLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'address': instance.address,
      'distanceFromCenterKm': instance.distanceFromCenterKm,
    };

_TrailsFilters _$TrailsFiltersFromJson(Map<String, dynamic> json) =>
    _TrailsFilters(
      difficulty:
          (json['difficulty'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$TrailDifficultyEnumMap, e))
              .toList() ??
          const [],
      lengthMinKm: (json['lengthMinKm'] as num?)?.toDouble(),
      lengthMaxKm: (json['lengthMaxKm'] as num?)?.toDouble(),
      elevationGainMinM: (json['elevationGainMinM'] as num?)?.toDouble(),
      elevationGainMaxM: (json['elevationGainMaxM'] as num?)?.toDouble(),
      loopOnly: json['loopOnly'] as bool?,
      kidFriendly: json['kidFriendly'] as bool?,
      dogFriendly: json['dogFriendly'] as bool?,
    );

Map<String, dynamic> _$TrailsFiltersToJson(_TrailsFilters instance) =>
    <String, dynamic>{
      'difficulty': instance.difficulty
          .map((e) => _$TrailDifficultyEnumMap[e]!)
          .toList(),
      'lengthMinKm': instance.lengthMinKm,
      'lengthMaxKm': instance.lengthMaxKm,
      'elevationGainMinM': instance.elevationGainMinM,
      'elevationGainMaxM': instance.elevationGainMaxM,
      'loopOnly': instance.loopOnly,
      'kidFriendly': instance.kidFriendly,
      'dogFriendly': instance.dogFriendly,
    };

const _$TrailDifficultyEnumMap = {
  TrailDifficulty.easy: 'easy',
  TrailDifficulty.moderate: 'moderate',
  TrailDifficulty.hard: 'hard',
};

_TrailsSearchRequest _$TrailsSearchRequestFromJson(Map<String, dynamic> json) =>
    _TrailsSearchRequest(
      itineraryId: json['itineraryId'] as String,
      place: TrailPlace.fromJson(json['place'] as Map<String, dynamic>),
      filters: json['filters'] == null
          ? const TrailsFilters()
          : TrailsFilters.fromJson(json['filters'] as Map<String, dynamic>),
      sort:
          $enumDecodeNullable(_$TrailsSortEnumMap, json['sort']) ??
          TrailsSort.recommended,
    );

Map<String, dynamic> _$TrailsSearchRequestToJson(
  _TrailsSearchRequest instance,
) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'place': instance.place.toJson(),
  'filters': instance.filters?.toJson(),
  'sort': _$TrailsSortEnumMap[instance.sort]!,
};

const _$TrailsSortEnumMap = {
  TrailsSort.recommended: 'recommended',
  TrailsSort.difficultyAsc: 'difficultyAsc',
  TrailsSort.difficultyDesc: 'difficultyDesc',
  TrailsSort.lengthAsc: 'lengthAsc',
  TrailsSort.lengthDesc: 'lengthDesc',
  TrailsSort.durationAsc: 'durationAsc',
  TrailsSort.durationDesc: 'durationDesc',
};

_TrailCard _$TrailCardFromJson(Map<String, dynamic> json) => _TrailCard(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  name: json['name'] as String,
  thumbnail: json['thumbnail'] as String,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  difficulty: $enumDecode(_$TrailDifficultyEnumMap, json['difficulty']),
  lengthKm: (json['lengthKm'] as num).toDouble(),
  elevationGainM: (json['elevationGainM'] as num?)?.toDouble(),
  location: TrailLocation.fromJson(json['location'] as Map<String, dynamic>),
  website: json['website'] as String?,
  isLoop: json['isLoop'] as bool?,
);

Map<String, dynamic> _$TrailCardToJson(_TrailCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'providerId': instance.providerId,
      'externalId': instance.externalId,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'durationMinutes': instance.durationMinutes,
      'difficulty': _$TrailDifficultyEnumMap[instance.difficulty]!,
      'lengthKm': instance.lengthKm,
      'elevationGainM': instance.elevationGainM,
      'location': instance.location.toJson(),
      'website': instance.website,
      'isLoop': instance.isLoop,
    };

_TrailDetail _$TrailDetailFromJson(Map<String, dynamic> json) => _TrailDetail(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  name: json['name'] as String,
  thumbnail: json['thumbnail'] as String,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  difficulty: $enumDecode(_$TrailDifficultyEnumMap, json['difficulty']),
  lengthKm: (json['lengthKm'] as num).toDouble(),
  elevationGainM: (json['elevationGainM'] as num?)?.toDouble(),
  location: TrailLocation.fromJson(json['location'] as Map<String, dynamic>),
  photos:
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  description: json['description'] as String?,
  externalUrl: json['externalUrl'] as String?,
  isLoop: json['isLoop'] as bool?,
  kidFriendly: json['kidFriendly'] as bool?,
  dogFriendly: json['dogFriendly'] as bool?,
);

Map<String, dynamic> _$TrailDetailToJson(_TrailDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'providerId': instance.providerId,
      'externalId': instance.externalId,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'durationMinutes': instance.durationMinutes,
      'difficulty': _$TrailDifficultyEnumMap[instance.difficulty]!,
      'lengthKm': instance.lengthKm,
      'elevationGainM': instance.elevationGainM,
      'location': instance.location.toJson(),
      'photos': instance.photos,
      'description': instance.description,
      'externalUrl': instance.externalUrl,
      'isLoop': instance.isLoop,
      'kidFriendly': instance.kidFriendly,
      'dogFriendly': instance.dogFriendly,
    };

_TrailsSearchResult _$TrailsSearchResultFromJson(Map<String, dynamic> json) =>
    _TrailsSearchResult(
      items: (json['items'] as List<dynamic>)
          .map((e) => TrailCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      nextCursor: json['nextCursor'] as String?,
      fromCache: json['fromCache'] as bool? ?? false,
    );

Map<String, dynamic> _$TrailsSearchResultToJson(_TrailsSearchResult instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'totalCount': instance.totalCount,
      'nextCursor': instance.nextCursor,
      'fromCache': instance.fromCache,
    };
