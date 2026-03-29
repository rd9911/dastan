import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_models.freezed.dart';
part 'planner_models.g.dart';

enum PlanEntryType { fixed, flex, custom }

enum TravelMode { walk, transit, drive, none }

@freezed
abstract class DayPlan with _$DayPlan {
  const factory DayPlan({
    required String itineraryId,
    required DateTime date,
    @Default([]) List<DayPlanEntry> entries,
    @Default(1) int version,
    DateTime? updatedAt,
  }) = _DayPlan;

  factory DayPlan.fromJson(Map<String, dynamic> json) =>
      _$DayPlanFromJson(json);
}

@freezed
abstract class DayPlanEntry with _$DayPlanEntry {
  const factory DayPlanEntry({
    required String id,
    String? savedItemId,
    required String title,
    @Default(PlanEntryType.fixed) PlanEntryType type,
    DateTime? startTime,
    DateTime? endTime,
    @Default(60) int durationMinutes,

    // Commute info (to get TO this entry)
    @Default(TravelMode.none) TravelMode commuteMode,
    int? commuteDurationMinutes,

    // Buffer
    int? bufferBeforeMinutes,

    String? notes,
  }) = _DayPlanEntry;

  factory DayPlanEntry.fromJson(Map<String, dynamic> json) =>
      _$DayPlanEntryFromJson(json);
}
