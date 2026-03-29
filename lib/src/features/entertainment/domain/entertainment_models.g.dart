// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entertainment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EntertainmentPlace _$EntertainmentPlaceFromJson(Map<String, dynamic> json) =>
    _EntertainmentPlace(
      granularity: $enumDecode(_$PlaceGranularityEnumMap, json['granularity']),
      value: json['value'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EntertainmentPlaceToJson(_EntertainmentPlace instance) =>
    <String, dynamic>{
      'granularity': _$PlaceGranularityEnumMap[instance.granularity]!,
      'value': instance.value,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

const _$PlaceGranularityEnumMap = {
  PlaceGranularity.city: 'city',
  PlaceGranularity.region: 'region',
  PlaceGranularity.neighborhood: 'neighborhood',
  PlaceGranularity.poi: 'poi',
};

_DateTimeRange _$DateTimeRangeFromJson(Map<String, dynamic> json) =>
    _DateTimeRange(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$DateTimeRangeToJson(_DateTimeRange instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };

_EntertainmentFilters _$EntertainmentFiltersFromJson(
  Map<String, dynamic> json,
) => _EntertainmentFilters(
  openNow: json['openNow'] as bool?,
  freeEntry: json['freeEntry'] as bool?,
  kidFriendly: json['kidFriendly'] as bool?,
  accessible: json['accessible'] as bool?,
  minRating: (json['minRating'] as num?)?.toDouble(),
  maxDistance: (json['maxDistance'] as num?)?.toInt(),
);

Map<String, dynamic> _$EntertainmentFiltersToJson(
  _EntertainmentFilters instance,
) => <String, dynamic>{
  'openNow': instance.openNow,
  'freeEntry': instance.freeEntry,
  'kidFriendly': instance.kidFriendly,
  'accessible': instance.accessible,
  'minRating': instance.minRating,
  'maxDistance': instance.maxDistance,
};

_EntertainmentSearchRequest _$EntertainmentSearchRequestFromJson(
  Map<String, dynamic> json,
) => _EntertainmentSearchRequest(
  itineraryId: json['itineraryId'] as String,
  place: EntertainmentPlace.fromJson(json['place'] as Map<String, dynamic>),
  dateRange: json['dateRange'] == null
      ? null
      : DateTimeRange.fromJson(json['dateRange'] as Map<String, dynamic>),
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$EntertainmentTagEnumMap, e))
          .toList() ??
      const [],
  filters: json['filters'] == null
      ? null
      : EntertainmentFilters.fromJson(json['filters'] as Map<String, dynamic>),
  sort:
      $enumDecodeNullable(_$EntertainmentSortEnumMap, json['sort']) ??
      EntertainmentSort.recommended,
);

Map<String, dynamic> _$EntertainmentSearchRequestToJson(
  _EntertainmentSearchRequest instance,
) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'place': instance.place.toJson(),
  'dateRange': instance.dateRange?.toJson(),
  'tags': instance.tags.map((e) => _$EntertainmentTagEnumMap[e]!).toList(),
  'filters': instance.filters?.toJson(),
  'sort': _$EntertainmentSortEnumMap[instance.sort]!,
};

const _$EntertainmentTagEnumMap = {
  EntertainmentTag.museum: 'museum',
  EntertainmentTag.garden: 'garden',
  EntertainmentTag.landmark: 'landmark',
  EntertainmentTag.architecture: 'architecture',
  EntertainmentTag.viewpoint: 'viewpoint',
  EntertainmentTag.park: 'park',
  EntertainmentTag.historicSite: 'historicSite',
  EntertainmentTag.artGallery: 'artGallery',
  EntertainmentTag.theater: 'theater',
  EntertainmentTag.zoo: 'zoo',
  EntertainmentTag.aquarium: 'aquarium',
  EntertainmentTag.themePark: 'themePark',
  EntertainmentTag.beach: 'beach',
  EntertainmentTag.natureReserve: 'natureReserve',
  EntertainmentTag.monument: 'monument',
};

const _$EntertainmentSortEnumMap = {
  EntertainmentSort.recommended: 'recommended',
  EntertainmentSort.distance: 'distance',
  EntertainmentSort.rating: 'rating',
  EntertainmentSort.popularity: 'popularity',
  EntertainmentSort.alphabetical: 'alphabetical',
};

_EntertainmentResultCard _$EntertainmentResultCardFromJson(
  Map<String, dynamic> json,
) => _EntertainmentResultCard(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  name: json['name'] as String,
  thumbnail: json['thumbnail'] as String,
  tag: $enumDecode(_$EntertainmentTagEnumMap, json['tag']),
  location: json['location'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num?)?.toInt(),
  distance: (json['distance'] as num?)?.toInt(),
  website: json['website'] as String?,
  allTags:
      (json['allTags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$EntertainmentTagEnumMap, e))
          .toList() ??
      const [],
  isOpen: json['isOpen'] as bool?,
  shortDescription: json['shortDescription'] as String?,
);

Map<String, dynamic> _$EntertainmentResultCardToJson(
  _EntertainmentResultCard instance,
) => <String, dynamic>{
  'id': instance.id,
  'providerId': instance.providerId,
  'externalId': instance.externalId,
  'name': instance.name,
  'thumbnail': instance.thumbnail,
  'tag': _$EntertainmentTagEnumMap[instance.tag]!,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'distance': instance.distance,
  'website': instance.website,
  'allTags': instance.allTags
      .map((e) => _$EntertainmentTagEnumMap[e]!)
      .toList(),
  'isOpen': instance.isOpen,
  'shortDescription': instance.shortDescription,
};

_OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) =>
    _OpeningHours(
      monday: json['monday'] as String?,
      tuesday: json['tuesday'] as String?,
      wednesday: json['wednesday'] as String?,
      thursday: json['thursday'] as String?,
      friday: json['friday'] as String?,
      saturday: json['saturday'] as String?,
      sunday: json['sunday'] as String?,
    );

Map<String, dynamic> _$OpeningHoursToJson(_OpeningHours instance) =>
    <String, dynamic>{
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };

_EntertainmentPlaceDetail _$EntertainmentPlaceDetailFromJson(
  Map<String, dynamic> json,
) => _EntertainmentPlaceDetail(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  name: json['name'] as String,
  tag: $enumDecode(_$EntertainmentTagEnumMap, json['tag']),
  location: json['location'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  description: json['description'] as String?,
  shortDescription: json['shortDescription'] as String?,
  photos:
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  openingHours: json['openingHours'] == null
      ? null
      : OpeningHours.fromJson(json['openingHours'] as Map<String, dynamic>),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num?)?.toInt(),
  website: json['website'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  priceLevel: (json['priceLevel'] as num?)?.toInt(),
  isFree: json['isFree'] as bool? ?? false,
  isKidFriendly: json['isKidFriendly'] as bool? ?? false,
  isAccessible: json['isAccessible'] as bool? ?? false,
  distanceFromCenter: (json['distanceFromCenter'] as num?)?.toInt(),
  allTags:
      (json['allTags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$EntertainmentTagEnumMap, e))
          .toList() ??
      const [],
  editorialSummary: json['editorialSummary'] as String?,
);

Map<String, dynamic> _$EntertainmentPlaceDetailToJson(
  _EntertainmentPlaceDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'providerId': instance.providerId,
  'externalId': instance.externalId,
  'name': instance.name,
  'tag': _$EntertainmentTagEnumMap[instance.tag]!,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'description': instance.description,
  'shortDescription': instance.shortDescription,
  'photos': instance.photos,
  'openingHours': instance.openingHours?.toJson(),
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'website': instance.website,
  'phone': instance.phone,
  'address': instance.address,
  'priceLevel': instance.priceLevel,
  'isFree': instance.isFree,
  'isKidFriendly': instance.isKidFriendly,
  'isAccessible': instance.isAccessible,
  'distanceFromCenter': instance.distanceFromCenter,
  'allTags': instance.allTags
      .map((e) => _$EntertainmentTagEnumMap[e]!)
      .toList(),
  'editorialSummary': instance.editorialSummary,
};

_EntertainmentSearchResult _$EntertainmentSearchResultFromJson(
  Map<String, dynamic> json,
) => _EntertainmentSearchResult(
  items: (json['items'] as List<dynamic>)
      .map((e) => EntertainmentResultCard.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
  nextCursor: json['nextCursor'] as String?,
  fromCache: json['fromCache'] as bool? ?? false,
);

Map<String, dynamic> _$EntertainmentSearchResultToJson(
  _EntertainmentSearchResult instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'totalCount': instance.totalCount,
  'nextCursor': instance.nextCursor,
  'fromCache': instance.fromCache,
};
