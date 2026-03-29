import 'package:freezed_annotation/freezed_annotation.dart';

part 'conflict_models.freezed.dart';
part 'conflict_models.g.dart';

/// Types of conflicts that can occur in a day plan.
enum ConflictType {
  /// Two entries overlap in time
  overlap,

  /// Venue/activity is closed at scheduled time
  closed,

  /// Transfer time between entries is too tight
  tightTransfer,

  /// Entry falls outside itinerary dates
  outsideItinerary,

  /// Entry duration exceeds available time
  durationExceeded,
}

/// A suggested fix for a conflict.
@freezed
abstract class ConflictSuggestion with _$ConflictSuggestion {
  const factory ConflictSuggestion({
    required String id,
    required String label,
    required String description,
    required ConflictFixAction action,
    Map<String, dynamic>? params,
  }) = _ConflictSuggestion;

  factory ConflictSuggestion.fromJson(Map<String, dynamic> json) =>
      _$ConflictSuggestionFromJson(json);
}

/// The action type for a conflict fix.
enum ConflictFixAction {
  shiftEarlier,
  shiftLater,
  swapOrder,
  extendDuration,
  reduceDuration,
  replaceNearby,
  remove,
}

/// Represents a detected conflict in the day plan.
@freezed
abstract class Conflict with _$Conflict {
  const factory Conflict({
    required String id,
    required ConflictType type,
    required List<String> entryIds,
    required String message,
    required List<ConflictSuggestion> suggestions,
    DateTime? detectedAt,
  }) = _Conflict;

  factory Conflict.fromJson(Map<String, dynamic> json) =>
      _$ConflictFromJson(json);
}
