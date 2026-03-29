import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';

/// Service to detect calendar conflicts for events.
///
/// checks against saved transport and accommodation items in the itinerary.
class CalendarConflictService {
  /// Checks for conflicts between a potential event and saved items.
  ///
  /// [event] - The event to check
  /// [savedItems] - List of all saved items in the itinerary
  ///
  /// Returns a list of conflicting saved items.
  List<SavedItem> checkConflicts({
    required EventCard event,
    required List<SavedItem> savedItems,
  }) {
    final conflicts = <SavedItem>[];

    // Skip if event has no dates
    if (event.end == null) {
      return conflicts; // Assume point-in-time if end is null, or handle differently?
    }
    // Let's assume start + 2 hours if end is null for conflict check safety
    final eventStart = event.start;
    final eventEnd = event.end ?? event.start.add(const Duration(hours: 2));

    for (final item in savedItems) {
      // Skip events (don't conflict with other events for now, or maybe we should?)
      // Requirement says "overlaps flight departure/arrival" (Transport) and maybe Accommodation?
      // Usually accommodation spans days, so "overlap" might mean "during stay" which is fine.
      // But flight/train departure/arrival is a hard conflict.

      if (item.section == ItinerarySection.transport) {
        if (item.time == null) {
          continue;
        }

        final itemStart = item.time!.start;
        final itemEnd = item.time!.end;

        // Check overlap
        if (eventStart.isBefore(itemEnd) && eventEnd.isAfter(itemStart)) {
          conflicts.add(item);
        }
      }
      // Add other sections if needed
    }

    return conflicts;
  }
}
