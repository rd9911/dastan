import 'package:freezed_annotation/freezed_annotation.dart';

part 'gastronomy_models.freezed.dart';
part 'gastronomy_models.g.dart';

/// Dietary options for restaurant filtering.
enum DietaryOption { vegan, vegetarian, halal, kosher, glutenFree }

/// Cuisine types for restaurant categorization.
enum CuisineType {
  italian,
  french,
  asian,
  mexican,
  indian,
  japanese,
  chinese,
  thai,
  mediterranean,
  american,
  spanish,
  greek,
  turkish,
  vietnamese,
  korean,
  middleEastern,
  african,
  caribbean,
  brazilian,
  peruvian,
  fusion,
  seafood,
  steakhouse,
  vegetarian,
  vegan,
  cafe,
  bakery,
  dessert,
  bar,
  other,
}

/// Price band for restaurants.
enum PriceBand { budget, moderate, upscale, fine }

/// Noise level at a venue.
enum NoiseLevel { quiet, moderate, lively }

/// Place granularity for search.
enum PlaceGranularity { city, neighborhood, poi, region }

/// Sort options for search results.
enum GastronomySort { recommended, rating, price, distance, openNow }

/// Place for gastronomy search.
@freezed
abstract class GastronomyPlace with _$GastronomyPlace {
  const factory GastronomyPlace({
    required PlaceGranularity granularity,
    required String value,
    double? latitude,
    double? longitude,
  }) = _GastronomyPlace;

  factory GastronomyPlace.fromJson(Map<String, dynamic> json) =>
      _$GastronomyPlaceFromJson(json);
}

/// Filters for gastronomy search.
@freezed
abstract class GastronomyFilters with _$GastronomyFilters {
  const factory GastronomyFilters({
    @Default([]) List<DietaryOption> dietary,
    @Default([]) List<CuisineType> cuisine,
    PriceBand? priceBand,
    double? minRating,
    double? maxDistance,
    bool? openNow,
    bool? kidFriendly,
    bool? dogFriendly,
    NoiseLevel? noiseLevel,
  }) = _GastronomyFilters;

  factory GastronomyFilters.fromJson(Map<String, dynamic> json) =>
      _$GastronomyFiltersFromJson(json);
}

/// Gastronomy search request.
@freezed
abstract class GastronomySearchRequest with _$GastronomySearchRequest {
  const factory GastronomySearchRequest({
    required String itineraryId,
    required GastronomyPlace place,
    @Default(GastronomyFilters()) GastronomyFilters? filters,
    @Default(GastronomySort.recommended) GastronomySort sort,
  }) = _GastronomySearchRequest;

  factory GastronomySearchRequest.fromJson(Map<String, dynamic> json) =>
      _$GastronomySearchRequestFromJson(json);
}

/// Result card for gastronomy search.
@freezed
abstract class GastronomyResultCard with _$GastronomyResultCard {
  const factory GastronomyResultCard({
    required String id,
    required String providerId,
    required String externalId,
    required String name,
    required String thumbnail,
    required PriceBand priceBand,
    required String location,
    required double latitude,
    required double longitude,
    double? rating,
    int? reviewCount,
    @Default([]) List<CuisineType> cuisines,
    @Default([]) List<DietaryOption> dietary,
    @Default([]) List<String> photos,
    int? distance,
    String? website,
    String? address,
    String? shortDescription,
    bool? isOpen,
    bool? kidFriendly,
    bool? dogFriendly,
    NoiseLevel? noiseLevel,
  }) = _GastronomyResultCard;

  factory GastronomyResultCard.fromJson(Map<String, dynamic> json) =>
      _$GastronomyResultCardFromJson(json);
}

/// Menu item at a restaurant.
@freezed
abstract class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String name,
    String? description,
    double? price,
    String? currency,
    @Default([]) List<DietaryOption> dietary,
    String? category,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
}

/// Opening hours for a restaurant.
@freezed
abstract class GastronomyOpeningHours with _$GastronomyOpeningHours {
  const factory GastronomyOpeningHours({
    String? monday,
    String? tuesday,
    String? wednesday,
    String? thursday,
    String? friday,
    String? saturday,
    String? sunday,
  }) = _GastronomyOpeningHours;

  factory GastronomyOpeningHours.fromJson(Map<String, dynamic> json) =>
      _$GastronomyOpeningHoursFromJson(json);
}

/// Full detail for a gastronomy place.
@freezed
abstract class GastronomyPlaceDetail with _$GastronomyPlaceDetail {
  const factory GastronomyPlaceDetail({
    required String id,
    required String providerId,
    required String externalId,
    required String name,
    required String location,
    required double latitude,
    required double longitude,
    required PriceBand priceBand,
    String? description,
    @Default([]) List<String> photos,
    @Default([]) List<MenuItem> menu,
    @Default([]) List<CuisineType> cuisines,
    @Default([]) List<DietaryOption> dietary,
    GastronomyOpeningHours? openingHours,
    double? rating,
    int? reviewCount,
    String? website,
    String? phone,
    String? address,
    bool? kidFriendly,
    bool? dogFriendly,
    NoiseLevel? noiseLevel,
    int? distanceFromCenter,
    String? editorialSummary,
  }) = _GastronomyPlaceDetail;

  factory GastronomyPlaceDetail.fromJson(Map<String, dynamic> json) =>
      _$GastronomyPlaceDetailFromJson(json);
}

/// Search result with pagination.
@freezed
abstract class GastronomySearchResult with _$GastronomySearchResult {
  const factory GastronomySearchResult({
    required List<GastronomyResultCard> items,
    required int totalCount,
    String? nextCursor,
    @Default(false) bool fromCache,
  }) = _GastronomySearchResult;

  factory GastronomySearchResult.fromJson(Map<String, dynamic> json) =>
      _$GastronomySearchResultFromJson(json);
}
