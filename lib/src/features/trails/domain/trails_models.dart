import 'package:freezed_annotation/freezed_annotation.dart';

part 'trails_models.freezed.dart';
part 'trails_models.g.dart';

/// Difficulty level of a trail.
enum TrailDifficulty { easy, moderate, hard }

/// Place granularity for search.
enum PlaceGranularity { city, region, poi, park }

/// Sort options for trails search.
enum TrailsSort {
  recommended,
  difficultyAsc,
  difficultyDesc,
  lengthAsc,
  lengthDesc,
  durationAsc,
  durationDesc,
}

/// Place for trails search.
@freezed
abstract class TrailPlace with _$TrailPlace {
  const factory TrailPlace({
    required PlaceGranularity granularity,
    required String value,
    double? latitude,
    double? longitude,
  }) = _TrailPlace;

  factory TrailPlace.fromJson(Map<String, dynamic> json) =>
      _$TrailPlaceFromJson(json);
}

/// Trail location details.
@freezed
abstract class TrailLocation with _$TrailLocation {
  const factory TrailLocation({
    required double lat,
    required double lng,
    required String name,
    String? address,
    double? distanceFromCenterKm,
  }) = _TrailLocation;

  factory TrailLocation.fromJson(Map<String, dynamic> json) =>
      _$TrailLocationFromJson(json);
}

/// Filters for trails search.
@freezed
abstract class TrailsFilters with _$TrailsFilters {
  const factory TrailsFilters({
    @Default([]) List<TrailDifficulty> difficulty,
    double? lengthMinKm,
    double? lengthMaxKm,
    double? elevationGainMinM,
    double? elevationGainMaxM,
    bool? loopOnly,
    bool? kidFriendly,
    bool? dogFriendly,
  }) = _TrailsFilters;

  factory TrailsFilters.fromJson(Map<String, dynamic> json) =>
      _$TrailsFiltersFromJson(json);
}

/// Search request parameters.
@freezed
abstract class TrailsSearchRequest with _$TrailsSearchRequest {
  const factory TrailsSearchRequest({
    required String itineraryId,
    required TrailPlace place,
    @Default(TrailsFilters()) TrailsFilters? filters,
    @Default(TrailsSort.recommended) TrailsSort sort,
  }) = _TrailsSearchRequest;

  factory TrailsSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$TrailsSearchRequestFromJson(json);
}

/// Summary card for a trail in search results.
@freezed
abstract class TrailCard with _$TrailCard {
  const factory TrailCard({
    required String id,
    required String providerId,
    required String externalId,
    required String name,
    required String thumbnail,
    required int durationMinutes,
    required TrailDifficulty difficulty,
    required double lengthKm,
    double? elevationGainM,
    required TrailLocation location,
    String? website,
    bool? isLoop,
  }) = _TrailCard;

  factory TrailCard.fromJson(Map<String, dynamic> json) =>
      _$TrailCardFromJson(json);
}

/// Detailed information about a trail.
@freezed
abstract class TrailDetail with _$TrailDetail {
  const factory TrailDetail({
    required String id,
    required String providerId,
    required String externalId,
    required String name,
    required String thumbnail,
    required int durationMinutes,
    required TrailDifficulty difficulty,
    required double lengthKm,
    double? elevationGainM,
    required TrailLocation location,
    @Default([]) List<String> photos,
    String? description,
    String? externalUrl,
    bool? isLoop,
    bool? kidFriendly,
    bool? dogFriendly,
    // Future: List<TrailPoint> routePoints,
  }) = _TrailDetail;

  factory TrailDetail.fromJson(Map<String, dynamic> json) =>
      _$TrailDetailFromJson(json);
}

/// Search results with pagination.
@freezed
abstract class TrailsSearchResult with _$TrailsSearchResult {
  const factory TrailsSearchResult({
    required List<TrailCard> items,
    required int totalCount,
    String? nextCursor,
    @Default(false) bool fromCache,
  }) = _TrailsSearchResult;

  factory TrailsSearchResult.fromJson(Map<String, dynamic> json) =>
      _$TrailsSearchResultFromJson(json);
}
