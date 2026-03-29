// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccommodationSearchRequest _$AccommodationSearchRequestFromJson(
  Map<String, dynamic> json,
) => _AccommodationSearchRequest(
  itineraryId: json['itineraryId'] as String,
  place: json['place'] as String,
  checkIn: DateTime.parse(json['checkIn'] as String),
  checkOut: DateTime.parse(json['checkOut'] as String),
  guests:
      (json['guests'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          int.parse(k),
          (e as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
      ) ??
      const {
        0: [30, 30],
      },
  filters: json['filters'] == null
      ? null
      : AccommodationFilters.fromJson(json['filters'] as Map<String, dynamic>),
  sort:
      $enumDecodeNullable(_$AccommodationSortEnumMap, json['sort']) ??
      AccommodationSort.recommended,
);

Map<String, dynamic> _$AccommodationSearchRequestToJson(
  _AccommodationSearchRequest instance,
) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'place': instance.place,
  'checkIn': instance.checkIn.toIso8601String(),
  'checkOut': instance.checkOut.toIso8601String(),
  'guests': instance.guests.map((k, e) => MapEntry(k.toString(), e)),
  'filters': instance.filters?.toJson(),
  'sort': _$AccommodationSortEnumMap[instance.sort]!,
};

const _$AccommodationSortEnumMap = {
  AccommodationSort.recommended: 'recommended',
  AccommodationSort.priceLowToHigh: 'priceLowToHigh',
  AccommodationSort.priceHighToLow: 'priceHighToLow',
  AccommodationSort.reviewScore: 'reviewScore',
  AccommodationSort.starRating: 'starRating',
  AccommodationSort.distanceToPoi: 'distanceToPoi',
  AccommodationSort.bestValue: 'bestValue',
  AccommodationSort.cancellationFriendly: 'cancellationFriendly',
};

_AccommodationFilters _$AccommodationFiltersFromJson(
  Map<String, dynamic> json,
) => _AccommodationFilters(
  minPrice: (json['minPrice'] as num?)?.toDouble(),
  maxPrice: (json['maxPrice'] as num?)?.toDouble(),
  propertyTypes: (json['propertyTypes'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$PropertyTypeEnumMap, e))
      .toList(),
  minStarRating: (json['minStarRating'] as num?)?.toInt(),
  minReviewScore: (json['minReviewScore'] as num?)?.toDouble(),
  maxDistanceToPoi: (json['maxDistanceToPoi'] as num?)?.toInt(),
  poiLat: (json['poiLat'] as num?)?.toDouble(),
  poiLng: (json['poiLng'] as num?)?.toDouble(),
  freeCancellation: json['freeCancellation'] as bool?,
  payAtProperty: json['payAtProperty'] as bool?,
  breakfastIncluded: json['breakfastIncluded'] as bool?,
  wifi: json['wifi'] as bool?,
  parking: json['parking'] as bool?,
  pool: json['pool'] as bool?,
  petFriendly: json['petFriendly'] as bool?,
  accessible: json['accessible'] as bool?,
);

Map<String, dynamic> _$AccommodationFiltersToJson(
  _AccommodationFilters instance,
) => <String, dynamic>{
  'minPrice': instance.minPrice,
  'maxPrice': instance.maxPrice,
  'propertyTypes': instance.propertyTypes
      ?.map((e) => _$PropertyTypeEnumMap[e]!)
      .toList(),
  'minStarRating': instance.minStarRating,
  'minReviewScore': instance.minReviewScore,
  'maxDistanceToPoi': instance.maxDistanceToPoi,
  'poiLat': instance.poiLat,
  'poiLng': instance.poiLng,
  'freeCancellation': instance.freeCancellation,
  'payAtProperty': instance.payAtProperty,
  'breakfastIncluded': instance.breakfastIncluded,
  'wifi': instance.wifi,
  'parking': instance.parking,
  'pool': instance.pool,
  'petFriendly': instance.petFriendly,
  'accessible': instance.accessible,
};

const _$PropertyTypeEnumMap = {
  PropertyType.hotel: 'hotel',
  PropertyType.hostel: 'hostel',
  PropertyType.apartment: 'apartment',
  PropertyType.resort: 'resort',
  PropertyType.villa: 'villa',
  PropertyType.guesthouse: 'guesthouse',
  PropertyType.bedAndBreakfast: 'bedAndBreakfast',
  PropertyType.motel: 'motel',
};
