import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dastan/src/features/planner/domain/autobuild_models.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
// import 'package:dastan/src/features/planner/application/eta_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'autobuild_service.g.dart';

@riverpod
class AutoBuildService extends _$AutoBuildService {
  @override
  void build() {}

  /// Generates a unique hash for the request to check for duplicates or cache.
  String generateRequestHash(AutoBuildRequest request) {
    // We hash the key components: Date, Candidate IDs, Preferences
    final candidateIds = request.candidates.map((e) => e.id).toList()..sort();

    final payload = {
      'date': request.date.toIso8601String(),
      'candidates': candidateIds,
      'prefs': request.preferences.toJson(),
    };

    final jsonString = jsonEncode(payload);
    final bytes = utf8.encode(jsonString);
    final digest = sha256.convert(bytes);

    return digest.toString();
  }

  /// Main entry point for generating a plan.
  Future<DayPlan> generatePlan(AutoBuildRequest request) async {
    // final etaService = ref.read(etaServiceProvider.notifier);

    // 1. Sort Candidates
    // Ticketed/Time-bound items first (Anchors), then clustered by location or priority
    final candidates = List<SavedItem>.from(request.candidates);

    // Split into Fixed (Anchors) vs Flexible
    final fixedItems = <SavedItem>[];
    final flexItems = <SavedItem>[];

    for (final item in candidates) {
      if (_isFixed(item)) {
        fixedItems.add(item);
      } else {
        flexItems.add(item);
      }
    }

    // Sort fixed items by time
    fixedItems.sort((a, b) => a.time!.start.compareTo(b.time!.start));

    // 2. Initial Timeline Construction
    final entries = <DayPlanEntry>[];

    // Start of Day
    DateTime currentTime = DateTime(
      request.date.year,
      request.date.month,
      request.date.day,
      request.preferences.startTime.hour,
      request.preferences.startTime.minute,
    );

    // 3. Place items
    // Simple strategy: Interleave Flex items between Fixed items if time permits

    int flexIndex = 0;

    // Add Fixed Items and try to fill gaps before/after
    for (int i = 0; i < fixedItems.length; i++) {
      final fixed = fixedItems[i];
      final fixedStart = fixed.time!.start;
      final fixedEnd = fixed.time!.end;

      // Fill gap between currentTime and fixedStart
      while (flexIndex < flexItems.length) {
        final flex = flexItems[flexIndex];
        final duration = _estimateDuration(flex, request.preferences.pace);

        // Calculate commute from last location to this flex
        // And from this flex to the next Fixed item

        // Simplification: Assume 0 commute for check, then refine
        // If currentTime + duration <= fixedStart
        if (currentTime.add(Duration(minutes: duration)).isBefore(fixedStart)) {
          // Add Flex
          entries.add(
            DayPlanEntry(
              id: '${DateTime.now().microsecondsSinceEpoch}_$flexIndex',
              savedItemId: flex.id,
              title: flex.title,
              type: PlanEntryType.flex,
              durationMinutes: duration,
              startTime: currentTime,
              endTime: currentTime.add(Duration(minutes: duration)),
            ),
          );

          currentTime = currentTime.add(Duration(minutes: duration));
          flexIndex++;
        } else {
          break; // No more space before this fixed item
        }
      }

      // Place Fixed Item
      entries.add(
        DayPlanEntry(
          id: '${DateTime.now().microsecondsSinceEpoch}_fixed_$i',
          savedItemId: fixed.id,
          title: fixed.title,
          type: PlanEntryType.fixed,
          startTime: fixedStart,
          endTime: fixedEnd,
          durationMinutes: fixedEnd.difference(fixedStart).inMinutes,
        ),
      );

      currentTime = fixedEnd;
    }

    // Fill remaining time after last fixed item
    while (flexIndex < flexItems.length) {
      final flex = flexItems[flexIndex];
      final duration = _estimateDuration(flex, request.preferences.pace);

      entries.add(
        DayPlanEntry(
          id: '${DateTime.now().microsecondsSinceEpoch}_$flexIndex',
          savedItemId: flex.id,
          title: flex.title,
          type: PlanEntryType.flex,
          durationMinutes: duration,
          startTime: currentTime,
          endTime: currentTime.add(Duration(minutes: duration)),
        ),
      );

      currentTime = currentTime.add(Duration(minutes: duration));
      flexIndex++;
    }

    final plan = DayPlan(
      itineraryId: request.itineraryId,
      date: request.date,
      entries: entries,
    );

    return plan;
  }

  bool _isFixed(SavedItem item) {
    // Only treat as fixed/anchor if it has a specific time
    return item.time != null;
  }

  int _estimateDuration(SavedItem item, AutoBuildPace pace) {
    // Basic duration rules
    int base = 60;
    switch (item.section) {
      case ItinerarySection.gastronomy:
        base = 90;
        break;
      case ItinerarySection.events:
        base = 120;
        break;
      case ItinerarySection.trails:
        base = 180;
        break;
      default:
        base = 60;
    }

    if (pace == AutoBuildPace.relaxed) return (base * 1.5).round();
    if (pace == AutoBuildPace.packed) return (base * 0.75).round();
    return base;
  }
}
