import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart'
    show PropertyType;

part 'accommodation_search_request.freezed.dart';
part 'accommodation_search_request.g.dart';

/// Room guest configuration: list of ages per room
/// e.g., {0: [30, 32], 1: [8]} means room 0 has 2 adults (30, 32), room 1 has 1 child (8)
typedef RoomGuests = Map<int, List<int>>;

/// Request for accommodation search, requires Active Itinerary context.
@freezed
abstract class AccommodationSearchRequest with _$AccommodationSearchRequest {
  const factory AccommodationSearchRequest({
    /// Active itinerary ID - required for context binding
    required String itineraryId,

    /// Place to search (city, region, or specific area)
    required String place,

    /// Check-in date
    required DateTime checkIn,

    /// Check-out date
    required DateTime checkOut,

    /// Room configurations with guest ages per room
    /// Default: 1 room with 2 adults
    @Default({
      0: [30, 30],
    })
    RoomGuests guests,

    /// Optional filters
    AccommodationFilters? filters,

    /// Optional sort preference
    @Default(AccommodationSort.recommended) AccommodationSort sort,
  }) = _AccommodationSearchRequest;

  factory AccommodationSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$AccommodationSearchRequestFromJson(json);
}

/// Filters for accommodation search
@freezed
abstract class AccommodationFilters with _$AccommodationFilters {
  const factory AccommodationFilters({
    /// Price range (per night)
    double? minPrice,
    double? maxPrice,

    /// Property types to include
    List<PropertyType>? propertyTypes,

    /// Minimum star rating
    int? minStarRating,

    /// Minimum review score (0-10)
    double? minReviewScore,

    /// Maximum distance to POI in meters
    int? maxDistanceToPoi,

    /// POI coordinates for distance filter
    double? poiLat,
    double? poiLng,

    /// Amenity filters
    bool? freeCancellation,
    bool? payAtProperty,
    bool? breakfastIncluded,
    bool? wifi,
    bool? parking,
    bool? pool,
    bool? petFriendly,
    bool? accessible,
  }) = _AccommodationFilters;

  factory AccommodationFilters.fromJson(Map<String, dynamic> json) =>
      _$AccommodationFiltersFromJson(json);
}

/// Sort options for results
enum AccommodationSort {
  recommended,
  priceLowToHigh,
  priceHighToLow,
  reviewScore,
  starRating,
  distanceToPoi,
  bestValue,
  cancellationFriendly,
}
