import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../core/domain/saved_item.dart';
import '../domain/planner_models.dart';

class SavedItemMapper {
  static DayPlanEntry mapToEntry(SavedItem item, DateTime date) {
    // Default logic:
    // Transformed -> Fixed if has time, else Flex
    // Gastronomy -> Flex, 90 mins
    // Museum (Ent/Events) -> Flex, 120 mins

    // Check if item has a specific time
    final fixedTime = item.time?.start;
    final isFixed = fixedTime != null;

    int duration = 60; // default
    if (item.section == ItinerarySection.gastronomy) duration = 90;
    if (item.section == ItinerarySection.entertainment ||
        item.section == ItinerarySection.events) {
      duration = 120; // 2 hours
    }

    DateTime? start;
    DateTime? end;

    if (isFixed) {
      // Assuming the item's time date component matches the plan date,
      // or we just take the TimeOfDay.
      // For MVP, assume strict match or adjust year/month/day
      final timeOfDay = TimeOfDay.fromDateTime(fixedTime);
      start = DateTime(
        date.year,
        date.month,
        date.day,
        timeOfDay.hour,
        timeOfDay.minute,
      );
      end = start.add(Duration(minutes: duration));
    }

    return DayPlanEntry(
      id: const Uuid().v4(),
      savedItemId: item.id,
      title: item.title,
      type: isFixed ? PlanEntryType.fixed : PlanEntryType.flex,
      startTime: start,
      endTime: end,
      durationMinutes: duration,
      // Default to transit? Or none until calculated
      commuteMode: TravelMode.none,
    );
  }
}
