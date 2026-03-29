import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';

/// Result from entertainment prefill operation.
class EntertainmentPrefillResult {
  /// Prefilled place for search.
  final EntertainmentPlace? place;

  /// Suggested date range.
  final DateTimeRange? dateRange;

  /// Whether dates were derived from transport/accommodation context.
  final bool hasSmartDates;

  /// Description of how dates were derived.
  final String? smartDatesDescription;

  const EntertainmentPrefillResult({
    this.place,
    this.dateRange,
    this.hasSmartDates = false,
    this.smartDatesDescription,
  });
}

/// Service for prefilling entertainment search based on itinerary context.
///
/// Following Riverpod architecture - this is an application-layer service
/// that orchestrates data from multiple sources (itinerary, saved items).
class EntertainmentPrefillService {
  /// Generates prefill data from itinerary and saved items.
  ///
  /// [itinerary] - The active itinerary
  /// [savedItems] - Optional saved transport/accommodation items for Smart Dates
  EntertainmentPrefillResult generatePrefill({
    required Itinerary itinerary,
    List<SavedItem>? savedItems,
  }) {
    // Extract destination from itinerary
    final place = itinerary.destination != null
        ? EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: itinerary.destination!,
          )
        : null;

    // Try to derive dates from saved items
    DateTimeRange? dateRange;
    bool hasSmartDates = false;
    String? smartDatesDescription;

    if (savedItems != null && savedItems.isNotEmpty) {
      final derivedDates = _deriveDatesFromSavedItems(savedItems);
      if (derivedDates != null) {
        dateRange = derivedDates;
        hasSmartDates = true;
        smartDatesDescription = 'Based on your transport/accommodation';
      }
    }

    // Fall back to itinerary dates
    if (dateRange == null &&
        itinerary.startDate != null &&
        itinerary.endDate != null) {
      dateRange = DateTimeRange(
        start: itinerary.startDate!,
        end: itinerary.endDate!,
      );
    }

    return EntertainmentPrefillResult(
      place: place,
      dateRange: dateRange,
      hasSmartDates: hasSmartDates,
      smartDatesDescription: smartDatesDescription,
    );
  }

  /// Derives date range from saved transport and accommodation items.
  DateTimeRange? _deriveDatesFromSavedItems(List<SavedItem> items) {
    DateTime? earliest;
    DateTime? latest;

    for (final item in items) {
      if (item.time != null) {
        final start = item.time!.start;
        final end = item.time!.end;

        if (earliest == null || start.isBefore(earliest)) {
          earliest = start;
        }
        if (latest == null || end.isAfter(latest)) {
          latest = end;
        }
      }
    }

    if (earliest != null && latest != null) {
      return DateTimeRange(start: earliest, end: latest);
    }

    return null;
  }

  /// Suggests entertainment tags based on itinerary theme or past selections.
  ///
  /// This is a placeholder for future ML-based recommendations.
  List<EntertainmentTag> suggestTags({
    required Itinerary itinerary,
    List<SavedItem>? savedEntertainment,
  }) {
    // Default suggestions for now
    return [
      EntertainmentTag.museum,
      EntertainmentTag.landmark,
      EntertainmentTag.park,
    ];
  }
}
