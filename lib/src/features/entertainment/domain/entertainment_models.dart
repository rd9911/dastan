import 'package:freezed_annotation/freezed_annotation.dart';

part 'entertainment_models.freezed.dart';
part 'entertainment_models.g.dart';

/// Entertainment tag categories for filtering.
enum EntertainmentTag {
  museum,
  garden,
  landmark,
  architecture,
  viewpoint,
  park,
  historicSite,
  artGallery,
  theater,
  zoo,
  aquarium,
  themePark,
  beach,
  natureReserve,
  monument,
}

/// Place granularity for search.
enum PlaceGranularity {
  city,
  region,
  neighborhood,
  poi, // Point of Interest
}

/// Sort options for entertainment results.
enum EntertainmentSort {
  recommended,
  distance,
  rating,
  popularity,
  alphabetical,
}

/// A place specification with granularity and optional coordinates.
@freezed
abstract class EntertainmentPlace with _$EntertainmentPlace {
  const factory EntertainmentPlace({
    /// Place granularity (city, region, poi, etc.)
    required PlaceGranularity granularity,

    /// Place value (e.g., "Paris, France" or "Eiffel Tower")
    required String value,

    /// Optional latitude for POI granularity.
    double? latitude,

    /// Optional longitude for POI granularity.
    double? longitude,
  }) = _EntertainmentPlace;

  factory EntertainmentPlace.fromJson(Map<String, dynamic> json) =>
      _$EntertainmentPlaceFromJson(json);
}

/// Date range for filtering entertainment options.
@freezed
abstract class DateTimeRange with _$DateTimeRange {
  const factory DateTimeRange({
    required DateTime start,
    required DateTime end,
  }) = _DateTimeRange;

  factory DateTimeRange.fromJson(Map<String, dynamic> json) =>
      _$DateTimeRangeFromJson(json);
}

/// Filters for entertainment search.
@freezed
abstract class EntertainmentFilters with _$EntertainmentFilters {
  const factory EntertainmentFilters({
    /// Show only currently open venues.
    bool? openNow,

    /// Show only free-entry venues.
    bool? freeEntry,

    /// Show only kid-friendly venues.
    bool? kidFriendly,

    /// Show only accessible venues.
    bool? accessible,

    /// Minimum rating filter.
    double? minRating,

    /// Maximum distance from center in meters.
    int? maxDistance,
  }) = _EntertainmentFilters;

  factory EntertainmentFilters.fromJson(Map<String, dynamic> json) =>
      _$EntertainmentFiltersFromJson(json);
}

/// Request for entertainment search, requires Active Itinerary context.
@freezed
abstract class EntertainmentSearchRequest with _$EntertainmentSearchRequest {
  const factory EntertainmentSearchRequest({
    /// Active itinerary ID - required for context binding.
    required String itineraryId,

    /// Place to search (city, region, or specific POI).
    required EntertainmentPlace place,

    /// Optional date range for the visit.
    DateTimeRange? dateRange,

    /// Tag filters to include (empty = all tags).
    @Default([]) List<EntertainmentTag> tags,

    /// Optional filters.
    EntertainmentFilters? filters,

    /// Sort preference.
    @Default(EntertainmentSort.recommended) EntertainmentSort sort,
  }) = _EntertainmentSearchRequest;

  factory EntertainmentSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$EntertainmentSearchRequestFromJson(json);
}

/// Result card for entertainment search results list.
@freezed
abstract class EntertainmentResultCard with _$EntertainmentResultCard {
  const factory EntertainmentResultCard({
    /// Internal unique ID.
    required String id,

    /// Provider ID (google, tripadvisor, foursquare, etc.).
    required String providerId,

    /// External ID from the provider.
    required String externalId,

    /// Name of the entertainment venue.
    required String name,

    /// Thumbnail image URL.
    required String thumbnail,

    /// Primary entertainment tag.
    required EntertainmentTag tag,

    /// Location description.
    required String location,

    /// Latitude coordinate.
    required double latitude,

    /// Longitude coordinate.
    required double longitude,

    /// Optional rating (0-5).
    double? rating,

    /// Optional review count.
    int? reviewCount,

    /// Distance from search center in meters.
    int? distance,

    /// Website URL for vendor handoff.
    String? website,

    /// List of all applicable tags.
    @Default([]) List<EntertainmentTag> allTags,

    /// Whether venue is currently open.
    bool? isOpen,

    /// Short description preview.
    String? shortDescription,
  }) = _EntertainmentResultCard;

  factory EntertainmentResultCard.fromJson(Map<String, dynamic> json) =>
      _$EntertainmentResultCardFromJson(json);
}

/// Opening hours for a venue.
@freezed
abstract class OpeningHours with _$OpeningHours {
  const factory OpeningHours({
    String? monday,
    String? tuesday,
    String? wednesday,
    String? thursday,
    String? friday,
    String? saturday,
    String? sunday,
  }) = _OpeningHours;

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);
}

/// Full detail for an entertainment place.
@freezed
abstract class EntertainmentPlaceDetail with _$EntertainmentPlaceDetail {
  const factory EntertainmentPlaceDetail({
    /// Internal unique ID.
    required String id,

    /// Provider ID.
    required String providerId,

    /// External ID from the provider.
    required String externalId,

    /// Name of the venue.
    required String name,

    /// Primary entertainment tag.
    required EntertainmentTag tag,

    /// Location description.
    required String location,

    /// Latitude coordinate.
    required double latitude,

    /// Longitude coordinate.
    required double longitude,

    /// Full description.
    String? description,

    /// Short description for previews.
    String? shortDescription,

    /// Photo URLs.
    @Default([]) List<String> photos,

    /// Opening hours.
    OpeningHours? openingHours,

    /// Rating (0-5).
    double? rating,

    /// Review count.
    int? reviewCount,

    /// Website URL.
    String? website,

    /// Phone number.
    String? phone,

    /// Address.
    String? address,

    /// Price level (1-4, 1=cheap, 4=expensive).
    int? priceLevel,

    /// Whether entry is free.
    @Default(false) bool isFree,

    /// Whether venue is kid-friendly.
    @Default(false) bool isKidFriendly,

    /// Whether venue is accessible.
    @Default(false) bool isAccessible,

    /// Distance from center in meters.
    int? distanceFromCenter,

    /// All applicable tags.
    @Default([]) List<EntertainmentTag> allTags,

    /// Editorial summary.
    String? editorialSummary,
  }) = _EntertainmentPlaceDetail;

  factory EntertainmentPlaceDetail.fromJson(Map<String, dynamic> json) =>
      _$EntertainmentPlaceDetailFromJson(json);
}

/// Search results container with pagination.
@freezed
abstract class EntertainmentSearchResult with _$EntertainmentSearchResult {
  const factory EntertainmentSearchResult({
    /// List of result cards.
    required List<EntertainmentResultCard> items,

    /// Total number of results available.
    required int totalCount,

    /// Cursor for next page (null if no more).
    String? nextCursor,

    /// Whether results are from cache.
    @Default(false) bool fromCache,
  }) = _EntertainmentSearchResult;

  factory EntertainmentSearchResult.fromJson(Map<String, dynamic> json) =>
      _$EntertainmentSearchResultFromJson(json);
}
