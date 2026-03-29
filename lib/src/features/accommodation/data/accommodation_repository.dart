import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';

/// Repository interface for accommodation search and details.
abstract class AccommodationRepository {
  /// Search for properties matching the request.
  ///
  /// Returns a paginated list of property summaries.
  /// Use [cursor] for pagination (null for first page).
  Future<AccommodationSearchResult> search(
    AccommodationSearchRequest request, {
    String? cursor,
  });

  /// Get detailed property information including room matrix and policies.
  Future<PropertyItem> getPropertyDetail(String providerId, String externalId);

  /// Cancel any in-flight search requests.
  void cancelSearch();
}

/// Result of an accommodation search with pagination support.
class AccommodationSearchResult {
  final List<PropertyItem> items;
  final String? nextCursor;
  final int totalCount;

  const AccommodationSearchResult({
    required this.items,
    this.nextCursor,
    required this.totalCount,
  });
}
