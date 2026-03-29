// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gastronomy_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GastronomyPlace _$GastronomyPlaceFromJson(Map<String, dynamic> json) =>
    _GastronomyPlace(
      granularity: $enumDecode(_$PlaceGranularityEnumMap, json['granularity']),
      value: json['value'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GastronomyPlaceToJson(_GastronomyPlace instance) =>
    <String, dynamic>{
      'granularity': _$PlaceGranularityEnumMap[instance.granularity]!,
      'value': instance.value,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

const _$PlaceGranularityEnumMap = {
  PlaceGranularity.city: 'city',
  PlaceGranularity.neighborhood: 'neighborhood',
  PlaceGranularity.poi: 'poi',
  PlaceGranularity.region: 'region',
};

_GastronomyFilters _$GastronomyFiltersFromJson(Map<String, dynamic> json) =>
    _GastronomyFilters(
      dietary:
          (json['dietary'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DietaryOptionEnumMap, e))
              .toList() ??
          const [],
      cuisine:
          (json['cuisine'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$CuisineTypeEnumMap, e))
              .toList() ??
          const [],
      priceBand: $enumDecodeNullable(_$PriceBandEnumMap, json['priceBand']),
      minRating: (json['minRating'] as num?)?.toDouble(),
      maxDistance: (json['maxDistance'] as num?)?.toDouble(),
      openNow: json['openNow'] as bool?,
      kidFriendly: json['kidFriendly'] as bool?,
      dogFriendly: json['dogFriendly'] as bool?,
      noiseLevel: $enumDecodeNullable(_$NoiseLevelEnumMap, json['noiseLevel']),
    );

Map<String, dynamic> _$GastronomyFiltersToJson(
  _GastronomyFilters instance,
) => <String, dynamic>{
  'dietary': instance.dietary.map((e) => _$DietaryOptionEnumMap[e]!).toList(),
  'cuisine': instance.cuisine.map((e) => _$CuisineTypeEnumMap[e]!).toList(),
  'priceBand': _$PriceBandEnumMap[instance.priceBand],
  'minRating': instance.minRating,
  'maxDistance': instance.maxDistance,
  'openNow': instance.openNow,
  'kidFriendly': instance.kidFriendly,
  'dogFriendly': instance.dogFriendly,
  'noiseLevel': _$NoiseLevelEnumMap[instance.noiseLevel],
};

const _$DietaryOptionEnumMap = {
  DietaryOption.vegan: 'vegan',
  DietaryOption.vegetarian: 'vegetarian',
  DietaryOption.halal: 'halal',
  DietaryOption.kosher: 'kosher',
  DietaryOption.glutenFree: 'glutenFree',
};

const _$CuisineTypeEnumMap = {
  CuisineType.italian: 'italian',
  CuisineType.french: 'french',
  CuisineType.asian: 'asian',
  CuisineType.mexican: 'mexican',
  CuisineType.indian: 'indian',
  CuisineType.japanese: 'japanese',
  CuisineType.chinese: 'chinese',
  CuisineType.thai: 'thai',
  CuisineType.mediterranean: 'mediterranean',
  CuisineType.american: 'american',
  CuisineType.spanish: 'spanish',
  CuisineType.greek: 'greek',
  CuisineType.turkish: 'turkish',
  CuisineType.vietnamese: 'vietnamese',
  CuisineType.korean: 'korean',
  CuisineType.middleEastern: 'middleEastern',
  CuisineType.african: 'african',
  CuisineType.caribbean: 'caribbean',
  CuisineType.brazilian: 'brazilian',
  CuisineType.peruvian: 'peruvian',
  CuisineType.fusion: 'fusion',
  CuisineType.seafood: 'seafood',
  CuisineType.steakhouse: 'steakhouse',
  CuisineType.vegetarian: 'vegetarian',
  CuisineType.vegan: 'vegan',
  CuisineType.cafe: 'cafe',
  CuisineType.bakery: 'bakery',
  CuisineType.dessert: 'dessert',
  CuisineType.bar: 'bar',
  CuisineType.other: 'other',
};

const _$PriceBandEnumMap = {
  PriceBand.budget: 'budget',
  PriceBand.moderate: 'moderate',
  PriceBand.upscale: 'upscale',
  PriceBand.fine: 'fine',
};

const _$NoiseLevelEnumMap = {
  NoiseLevel.quiet: 'quiet',
  NoiseLevel.moderate: 'moderate',
  NoiseLevel.lively: 'lively',
};

_GastronomySearchRequest _$GastronomySearchRequestFromJson(
  Map<String, dynamic> json,
) => _GastronomySearchRequest(
  itineraryId: json['itineraryId'] as String,
  place: GastronomyPlace.fromJson(json['place'] as Map<String, dynamic>),
  filters: json['filters'] == null
      ? const GastronomyFilters()
      : GastronomyFilters.fromJson(json['filters'] as Map<String, dynamic>),
  sort:
      $enumDecodeNullable(_$GastronomySortEnumMap, json['sort']) ??
      GastronomySort.recommended,
);

Map<String, dynamic> _$GastronomySearchRequestToJson(
  _GastronomySearchRequest instance,
) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'place': instance.place.toJson(),
  'filters': instance.filters?.toJson(),
  'sort': _$GastronomySortEnumMap[instance.sort]!,
};

const _$GastronomySortEnumMap = {
  GastronomySort.recommended: 'recommended',
  GastronomySort.rating: 'rating',
  GastronomySort.price: 'price',
  GastronomySort.distance: 'distance',
  GastronomySort.openNow: 'openNow',
};

_GastronomyResultCard _$GastronomyResultCardFromJson(
  Map<String, dynamic> json,
) => _GastronomyResultCard(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  name: json['name'] as String,
  thumbnail: json['thumbnail'] as String,
  priceBand: $enumDecode(_$PriceBandEnumMap, json['priceBand']),
  location: json['location'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num?)?.toInt(),
  cuisines:
      (json['cuisines'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CuisineTypeEnumMap, e))
          .toList() ??
      const [],
  dietary:
      (json['dietary'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DietaryOptionEnumMap, e))
          .toList() ??
      const [],
  photos:
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  distance: (json['distance'] as num?)?.toInt(),
  website: json['website'] as String?,
  address: json['address'] as String?,
  shortDescription: json['shortDescription'] as String?,
  isOpen: json['isOpen'] as bool?,
  kidFriendly: json['kidFriendly'] as bool?,
  dogFriendly: json['dogFriendly'] as bool?,
  noiseLevel: $enumDecodeNullable(_$NoiseLevelEnumMap, json['noiseLevel']),
);

Map<String, dynamic> _$GastronomyResultCardToJson(
  _GastronomyResultCard instance,
) => <String, dynamic>{
  'id': instance.id,
  'providerId': instance.providerId,
  'externalId': instance.externalId,
  'name': instance.name,
  'thumbnail': instance.thumbnail,
  'priceBand': _$PriceBandEnumMap[instance.priceBand]!,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'cuisines': instance.cuisines.map((e) => _$CuisineTypeEnumMap[e]!).toList(),
  'dietary': instance.dietary.map((e) => _$DietaryOptionEnumMap[e]!).toList(),
  'photos': instance.photos,
  'distance': instance.distance,
  'website': instance.website,
  'address': instance.address,
  'shortDescription': instance.shortDescription,
  'isOpen': instance.isOpen,
  'kidFriendly': instance.kidFriendly,
  'dogFriendly': instance.dogFriendly,
  'noiseLevel': _$NoiseLevelEnumMap[instance.noiseLevel],
};

_MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => _MenuItem(
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  dietary:
      (json['dietary'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DietaryOptionEnumMap, e))
          .toList() ??
      const [],
  category: json['category'] as String?,
);

Map<String, dynamic> _$MenuItemToJson(_MenuItem instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'currency': instance.currency,
  'dietary': instance.dietary.map((e) => _$DietaryOptionEnumMap[e]!).toList(),
  'category': instance.category,
};

_GastronomyOpeningHours _$GastronomyOpeningHoursFromJson(
  Map<String, dynamic> json,
) => _GastronomyOpeningHours(
  monday: json['monday'] as String?,
  tuesday: json['tuesday'] as String?,
  wednesday: json['wednesday'] as String?,
  thursday: json['thursday'] as String?,
  friday: json['friday'] as String?,
  saturday: json['saturday'] as String?,
  sunday: json['sunday'] as String?,
);

Map<String, dynamic> _$GastronomyOpeningHoursToJson(
  _GastronomyOpeningHours instance,
) => <String, dynamic>{
  'monday': instance.monday,
  'tuesday': instance.tuesday,
  'wednesday': instance.wednesday,
  'thursday': instance.thursday,
  'friday': instance.friday,
  'saturday': instance.saturday,
  'sunday': instance.sunday,
};

_GastronomyPlaceDetail _$GastronomyPlaceDetailFromJson(
  Map<String, dynamic> json,
) => _GastronomyPlaceDetail(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  externalId: json['externalId'] as String,
  name: json['name'] as String,
  location: json['location'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  priceBand: $enumDecode(_$PriceBandEnumMap, json['priceBand']),
  description: json['description'] as String?,
  photos:
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  menu:
      (json['menu'] as List<dynamic>?)
          ?.map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  cuisines:
      (json['cuisines'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CuisineTypeEnumMap, e))
          .toList() ??
      const [],
  dietary:
      (json['dietary'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DietaryOptionEnumMap, e))
          .toList() ??
      const [],
  openingHours: json['openingHours'] == null
      ? null
      : GastronomyOpeningHours.fromJson(
          json['openingHours'] as Map<String, dynamic>,
        ),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num?)?.toInt(),
  website: json['website'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  kidFriendly: json['kidFriendly'] as bool?,
  dogFriendly: json['dogFriendly'] as bool?,
  noiseLevel: $enumDecodeNullable(_$NoiseLevelEnumMap, json['noiseLevel']),
  distanceFromCenter: (json['distanceFromCenter'] as num?)?.toInt(),
  editorialSummary: json['editorialSummary'] as String?,
);

Map<String, dynamic> _$GastronomyPlaceDetailToJson(
  _GastronomyPlaceDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'providerId': instance.providerId,
  'externalId': instance.externalId,
  'name': instance.name,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'priceBand': _$PriceBandEnumMap[instance.priceBand]!,
  'description': instance.description,
  'photos': instance.photos,
  'menu': instance.menu.map((e) => e.toJson()).toList(),
  'cuisines': instance.cuisines.map((e) => _$CuisineTypeEnumMap[e]!).toList(),
  'dietary': instance.dietary.map((e) => _$DietaryOptionEnumMap[e]!).toList(),
  'openingHours': instance.openingHours?.toJson(),
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'website': instance.website,
  'phone': instance.phone,
  'address': instance.address,
  'kidFriendly': instance.kidFriendly,
  'dogFriendly': instance.dogFriendly,
  'noiseLevel': _$NoiseLevelEnumMap[instance.noiseLevel],
  'distanceFromCenter': instance.distanceFromCenter,
  'editorialSummary': instance.editorialSummary,
};

_GastronomySearchResult _$GastronomySearchResultFromJson(
  Map<String, dynamic> json,
) => _GastronomySearchResult(
  items: (json['items'] as List<dynamic>)
      .map((e) => GastronomyResultCard.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
  nextCursor: json['nextCursor'] as String?,
  fromCache: json['fromCache'] as bool? ?? false,
);

Map<String, dynamic> _$GastronomySearchResultToJson(
  _GastronomySearchResult instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'totalCount': instance.totalCount,
  'nextCursor': instance.nextCursor,
  'fromCache': instance.fromCache,
};
