import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';

/// Result from events prefill operation.
class EventsPrefillResult {
  /// Prefilled place for search.
  final EventPlace? place;

  /// Prefilled date window from itinerary dates.
  final EventDateWindow? dateWindow;

  /// Whether destination was prefilled from itinerary.
  final bool hasDestination;

  /// Whether dates were prefilled from itinerary.
  final bool hasDates;

  const EventsPrefillResult({
    this.place,
    this.dateWindow,
    this.hasDestination = false,
    this.hasDates = false,
  });
}

/// Service for prefilling events search based on itinerary context.
///
/// Following Riverpod architecture - this is an application-layer service
/// that orchestrates data from multiple sources (itinerary, saved items).
class EventsPrefillService {
  /// Generates prefill data from Active Itinerary.
  ///
  /// [itinerary] - The active itinerary
  EventsPrefillResult generatePrefill({required Itinerary itinerary}) {
    // Extract destination from itinerary
    final place = itinerary.destination != null
        ? EventPlace(
            granularity: PlaceGranularity.city,
            value: itinerary.destination!,
          )
        : null;

    // Extract date window from itinerary dates
    final dateWindow =
        (itinerary.startDate != null && itinerary.endDate != null)
        ? EventDateWindow(start: itinerary.startDate!, end: itinerary.endDate!)
        : null;

    return EventsPrefillResult(
      place: place,
      dateWindow: dateWindow,
      hasDestination: place != null,
      hasDates: dateWindow != null,
    );
  }

  /// Suggests default filters based on itinerary context.
  ///
  /// This is a placeholder for future enhanced recommendations.
  EventsFilters suggestFilters({required Itinerary itinerary}) {
    // Default to "during my dates" if itinerary has dates
    if (itinerary.startDate != null && itinerary.endDate != null) {
      return const EventsFilters(duringMyDates: true);
    }

    return const EventsFilters();
  }

  /// Suggests event categories based on destination.
  ///
  /// This is a placeholder for future recommendations.
  List<EventCategory> suggestCategories({required Itinerary itinerary}) {
    // Default variety of categories
    return [
      EventCategory.concert,
      EventCategory.theatre,
      EventCategory.festival,
      EventCategory.exhibition,
    ];
  }
}
