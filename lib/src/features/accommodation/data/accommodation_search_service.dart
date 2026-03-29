import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/accommodation_result.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';

part 'accommodation_search_service.g.dart';

/// Accommodation search service that integrates with the Search Platform.
class AccommodationSearchService {
  final SearchOrchestrator _orchestrator;

  AccommodationSearchService(this._orchestrator);

  /// Search for accommodation using the unified Search Platform.
  Future<List<AccommodationResult>> search({
    required String location,
    required DateTime checkIn,
    required DateTime checkOut,
    AccommodationType? type,
    List<int> travelerAges = const [18],
  }) async {
    final response = await _orchestrator.search(
      SearchQuery(
        vertical: SearchVertical.accommodation,
        context: const SearchContext(locale: 'en', currency: 'USD'),
        params: {
          'location': location,
          'checkIn': checkIn.toIso8601String(),
          'checkOut': checkOut.toIso8601String(),
          if (type != null) 'type': type.name,
          'travelerAges': travelerAges,
        },
      ),
    );

    // Convert SearchResultItems to AccommodationResults
    return response.items
        .map(
          (item) => _toAccommodationResult(item, location, checkIn, checkOut),
        )
        .toList();
  }

  /// Convert a SearchResultItem to an AccommodationResult.
  AccommodationResult _toAccommodationResult(
    SearchResultItem item,
    String location,
    DateTime checkIn,
    DateTime checkOut,
  ) {
    final details = item.details ?? {};

    return AccommodationResult(
      id: item.id,
      providerId: item.provenance.firstOrNull ?? 'unknown',
      externalId: details['externalId'] ?? item.id,
      type: _parseType(details['type']),
      name: item.title,
      location: details['location'] ?? location,
      checkIn: checkIn,
      checkOut: checkOut,
      pricePerNight: item.price ?? 0,
      currency: item.priceCurrency ?? 'USD',
      rating: item.rating?.toInt() ?? 3,
      vendorUrl: details['vendorUrl'] ?? 'https://example.com/book',
    );
  }

  AccommodationType _parseType(dynamic type) {
    if (type == null) return AccommodationType.hotel;
    if (type is AccommodationType) return type;
    return AccommodationType.values.firstWhere(
      (t) => t.name == type.toString(),
      orElse: () => AccommodationType.hotel,
    );
  }
}

@riverpod
AccommodationSearchService accommodationSearchService(Ref ref) {
  return AccommodationSearchService(ref.watch(searchOrchestratorProvider));
}
