import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

part 'autobuild_models.freezed.dart';
part 'autobuild_models.g.dart';

enum AutoBuildPace { relaxed, normal, packed }

/// Custom converter for TimeOfDay serialization
class TimeOfDayConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(String json) {
    final parts = json.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  @override
  String toJson(TimeOfDay time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}

@freezed
abstract class AutoBuildPreferences with _$AutoBuildPreferences {
  const factory AutoBuildPreferences({
    @TimeOfDayConverter()
    @Default(TimeOfDay(hour: 9, minute: 0))
    TimeOfDay startTime,

    @Default(AutoBuildPace.normal) AutoBuildPace pace,

    @Default([]) List<ItinerarySection> prioritizeSections,

    // Constraints
    @Default(true) bool respectOpeningHours,
    @Default(true) bool minimizeTravelTime,
  }) = _AutoBuildPreferences;

  factory AutoBuildPreferences.fromJson(Map<String, dynamic> json) =>
      _$AutoBuildPreferencesFromJson(json);
}

@freezed
abstract class AutoBuildRequest with _$AutoBuildRequest {
  const factory AutoBuildRequest({
    required String itineraryId,
    required DateTime date,
    required List<SavedItem> candidates,
    @Default(AutoBuildPreferences()) AutoBuildPreferences preferences,
  }) = _AutoBuildRequest;

  factory AutoBuildRequest.fromJson(Map<String, dynamic> json) =>
      _$AutoBuildRequestFromJson(json);
}
