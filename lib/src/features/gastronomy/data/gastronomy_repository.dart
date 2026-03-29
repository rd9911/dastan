import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';

/// Abstract repository interface for gastronomy data.
///
/// Following Riverpod architecture - this interface lives in the data layer
/// and abstracts away the data source (API, mock, etc.) from the application layer.
abstract class GastronomyRepository {
  /// Searches for restaurants and cafés.
  ///
  /// [request] - Search parameters including place, filters, sort
  /// [cursor] - Optional pagination cursor for subsequent pages
  ///
  /// Returns [GastronomySearchResult] with items and pagination info.
  Future<GastronomySearchResult> search(
    GastronomySearchRequest request, {
    String? cursor,
  });

  /// Gets full detail for a specific gastronomy place.
  ///
  /// [providerId] - The provider ID (google, yelp, etc.)
  /// [externalId] - The external ID from the provider
  ///
  /// Returns [GastronomyPlaceDetail] with full venue information.
  Future<GastronomyPlaceDetail> getDetail(String providerId, String externalId);

  /// Cancels any in-flight search request.
  ///
  /// Used when the user changes filters, sorts, or navigates away.
  void cancelSearch();
}
