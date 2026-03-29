import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';

/// Abstract repository interface for entertainment data.
///
/// Following Riverpod architecture - this interface lives in the data layer
/// and abstracts away the data source (API, mock, etc.) from the application layer.
abstract class EntertainmentRepository {
  /// Searches for entertainment venues.
  ///
  /// [request] - Search parameters including place, tags, filters
  /// [cursor] - Optional pagination cursor for subsequent pages
  ///
  /// Returns [EntertainmentSearchResult] with items and pagination info.
  Future<EntertainmentSearchResult> search(
    EntertainmentSearchRequest request, {
    String? cursor,
  });

  /// Gets full detail for a specific entertainment venue.
  ///
  /// [providerId] - The provider ID (google, tripadvisor, etc.)
  /// [externalId] - The external ID from the provider
  ///
  /// Returns [EntertainmentPlaceDetail] with full venue information.
  Future<EntertainmentPlaceDetail> getDetail(
    String providerId,
    String externalId,
  );

  /// Cancels any in-flight search request.
  ///
  /// Used when the user changes filters, sorts, or navigates away.
  void cancelSearch();
}
