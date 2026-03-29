import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_models.freezed.dart';
part 'events_models.g.dart';

/// Event categories.
enum EventCategory {
  concert,
  theatre,
  sports,
  festival,
  exhibition,
  conference,
  comedy,
  film,
  food,
  nightlife,
  community,
  other,
}

/// Place granularity for search.
enum PlaceGranularity { city, neighborhood, poi, region }

/// Sort options for events search.
enum EventsSort { date, distance, popularity, recommended }

/// Place for events search.
@freezed
abstract class EventPlace with _$EventPlace {
  const factory EventPlace({
    required PlaceGranularity granularity,
    required String value,
    double? latitude,
    double? longitude,
  }) = _EventPlace;

  factory EventPlace.fromJson(Map<String, dynamic> json) =>
      _$EventPlaceFromJson(json);
}

/// Date window for event filtering.
@freezed
abstract class EventDateWindow with _$EventDateWindow {
  const factory EventDateWindow({
    required DateTime start,
    required DateTime end,
  }) = _EventDateWindow;

  factory EventDateWindow.fromJson(Map<String, dynamic> json) =>
      _$EventDateWindowFromJson(json);
}

/// Venue information for an event.
@freezed
abstract class EventVenue with _$EventVenue {
  const factory EventVenue({
    required String name,
    required double latitude,
    required double longitude,
    String? address,
    String? city,
  }) = _EventVenue;

  factory EventVenue.fromJson(Map<String, dynamic> json) =>
      _$EventVenueFromJson(json);
}

/// Filters for events search.
@freezed
abstract class EventsFilters with _$EventsFilters {
  const factory EventsFilters({
    @Default([]) List<EventCategory> categories,
    bool? duringMyDates,
    bool? free,
    bool? familyFriendly,
    bool? thisWeekend,
    bool? today,
  }) = _EventsFilters;

  factory EventsFilters.fromJson(Map<String, dynamic> json) =>
      _$EventsFiltersFromJson(json);
}

/// Events search request.
@freezed
abstract class EventsSearchRequest with _$EventsSearchRequest {
  const factory EventsSearchRequest({
    required String itineraryId,
    required EventPlace place,
    EventDateWindow? dateWindow,
    @Default(EventsFilters()) EventsFilters? filters,
    @Default(EventsSort.date) EventsSort sort,
  }) = _EventsSearchRequest;

  factory EventsSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$EventsSearchRequestFromJson(json);
}

/// Event card for search results.
@freezed
abstract class EventCard with _$EventCard {
  const factory EventCard({
    required String id,
    required String providerId,
    required String externalId,
    required String title,
    required EventCategory category,
    required DateTime start,
    DateTime? end,
    required EventVenue venue,
    required String leadImage,
    int? distance,
    String? price,
    bool? isFree,
    bool? familyFriendly,
    String? website,
    String? ticketUrl,
    String? shortDescription,
  }) = _EventCard;

  factory EventCard.fromJson(Map<String, dynamic> json) =>
      _$EventCardFromJson(json);
}

/// Full detail for an event.
@freezed
abstract class EventDetail with _$EventDetail {
  const factory EventDetail({
    required String id,
    required String providerId,
    required String externalId,
    required String title,
    required EventCategory category,
    required DateTime start,
    DateTime? end,
    required EventVenue venue,
    @Default([]) List<String> photos,
    String? descriptionShort,
    String? descriptionFull,
    String? website,
    String? ticketUrl,
    String? price,
    bool? isFree,
    bool? familyFriendly,
    String? organizer,
    int? attendeeCount,
  }) = _EventDetail;

  factory EventDetail.fromJson(Map<String, dynamic> json) =>
      _$EventDetailFromJson(json);
}

/// Search result with pagination.
@freezed
abstract class EventsSearchResult with _$EventsSearchResult {
  const factory EventsSearchResult({
    required List<EventCard> items,
    required int totalCount,
    String? nextCursor,
    @Default(false) bool fromCache,
  }) = _EventsSearchResult;

  factory EventsSearchResult.fromJson(Map<String, dynamic> json) =>
      _$EventsSearchResultFromJson(json);
}
