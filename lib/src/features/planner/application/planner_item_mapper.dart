import 'package:uuid/uuid.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';

class PlannerItemMapper {
  final Uuid _uuid;

  PlannerItemMapper({Uuid? uuid}) : _uuid = uuid ?? const Uuid();

  DayPlanEntry fromSavedItem(SavedItem item, DateTime dayDate) {
    // Determine type: default to flex unless time is present or explicitly fixed category
    final hasTime = item.time != null;
    final type = hasTime || item.section == ItinerarySection.transport
        ? PlanEntryType.fixed
        : PlanEntryType.flex;

    // Determine times
    // If fixed/hasTime, use them. If they are on a different calendar date,
    // we still map them as is (conflict detection will handle date mismatch later).
    final startTime = item.time?.start;
    final endTime = item.time?.end;

    // Determine duration
    int durationMinutes = 60; // Default fallback
    if (startTime != null && endTime != null) {
      durationMinutes = endTime.difference(startTime).inMinutes;
      if (durationMinutes < 0) durationMinutes = 60; // Safety
    } else {
      durationMinutes = _getDefaultDurationForSection(item.section);
    }

    return DayPlanEntry(
      id: _uuid.v4(),
      savedItemId: item.id,
      title: item.title,
      type: type,
      startTime: startTime,
      endTime: endTime,
      durationMinutes: durationMinutes,
      commuteMode: TravelMode.none,
      commuteDurationMinutes: null,
      bufferBeforeMinutes: null,
      notes: null, // Could map item.details notes if available
    );
  }

  int _getDefaultDurationForSection(ItinerarySection section) {
    switch (section) {
      case ItinerarySection.transport:
        return 120; // Fallback only if no end time
      case ItinerarySection.accommodation:
        return 60; // Check-in/out process?
      case ItinerarySection.entertainment:
        return 120; // 2 hours movie/show
      case ItinerarySection.gastronomy:
        return 90; // 1.5 hours meal
      case ItinerarySection.events:
        return 180; // 3 hours event
      case ItinerarySection.trails:
        return 180; // 3 hours hike
    }
  }
}
