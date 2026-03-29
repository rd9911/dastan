import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';

/// Result from gastronomy prefill operation.
class GastronomyPrefillResult {
  /// Prefilled place for search.
  final GastronomyPlace? place;

  /// Whether destination was prefilled from itinerary.
  final bool hasDestination;

  const GastronomyPrefillResult({this.place, this.hasDestination = false});
}

/// Service for prefilling gastronomy search based on itinerary context.
///
/// Following Riverpod architecture - this is an application-layer service
/// that orchestrates data from multiple sources (itinerary, saved items).
class GastronomyPrefillService {
  /// Generates prefill data from Active Itinerary.
  ///
  /// [itinerary] - The active itinerary
  GastronomyPrefillResult generatePrefill({required Itinerary itinerary}) {
    // Extract destination from itinerary
    final place = itinerary.destination != null
        ? GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: itinerary.destination!,
          )
        : null;

    return GastronomyPrefillResult(place: place, hasDestination: place != null);
  }

  /// Suggests default filters based on itinerary context.
  ///
  /// This is a placeholder for future ML-based recommendations.
  GastronomyFilters suggestFilters({required Itinerary itinerary}) {
    // Default to no specific filters
    return const GastronomyFilters();
  }

  /// Suggests cuisines based on destination.
  ///
  /// This is a placeholder for future recommendations.
  List<CuisineType> suggestCuisines({required Itinerary itinerary}) {
    // Default suggestions based on destination (placeholder)
    final destination = itinerary.destination?.toLowerCase() ?? '';

    if (destination.contains('italy') ||
        destination.contains('rome') ||
        destination.contains('milan') ||
        destination.contains('florence')) {
      return [CuisineType.italian, CuisineType.mediterranean];
    }

    if (destination.contains('france') || destination.contains('paris')) {
      return [CuisineType.french, CuisineType.cafe];
    }

    if (destination.contains('japan') || destination.contains('tokyo')) {
      return [CuisineType.japanese, CuisineType.asian];
    }

    if (destination.contains('mexico')) {
      return [CuisineType.mexican, CuisineType.american];
    }

    if (destination.contains('india')) {
      return [CuisineType.indian, CuisineType.asian];
    }

    // Default variety
    return [CuisineType.italian, CuisineType.asian, CuisineType.cafe];
  }
}
