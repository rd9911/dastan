import 'package:dastan/src/features/events/domain/events_models.dart';

/// Abstract repository interface for events data.
///
/// Following Riverpod architecture - this interface lives in the data layer
/// and abstracts away the data source (API, mock, etc.) from the application layer.
abstract class EventsRepository {
  /// Searches for events.
  ///
  /// [request] - Search parameters including place, date window, filters
  /// [cursor] - Optional pagination cursor for subsequent pages
  ///
  /// Returns [EventsSearchResult] with items and pagination info.
  Future<EventsSearchResult> search(
    EventsSearchRequest request, {
    String? cursor,
  });

  /// Gets full detail for a specific event.
  ///
  /// [providerId] - The provider ID (ticketmaster, eventbrite, etc.)
  /// [externalId] - The external ID from the provider
  ///
  /// Returns [EventDetail] with full event information.
  Future<EventDetail> getDetail(String providerId, String externalId);

  /// Cancels any in-flight search request.
  ///
  /// Used when the user changes filters, sorts, or navigates away.
  void cancelSearch();
}
