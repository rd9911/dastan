import 'package:freezed_annotation/freezed_annotation.dart';

// Re-export FeatureVertical as ItinerarySection for backward compatibility
export 'vertical.dart' show FeatureVertical, ItinerarySection;
import 'vertical.dart';

part 'saved_item.freezed.dart';
part 'saved_item.g.dart';

enum SyncStatus { queued, synced, error }

@freezed
abstract class SavedItemExternal with _$SavedItemExternal {
  const factory SavedItemExternal({
    required String vendor,
    required String? vendorUrl,
    required String? externalId,
  }) = _SavedItemExternal;

  factory SavedItemExternal.fromJson(Map<String, dynamic> json) =>
      _$SavedItemExternalFromJson(json);
}

@freezed
abstract class SavedItemTime with _$SavedItemTime {
  const factory SavedItemTime({
    required DateTime start,
    required DateTime end,
  }) = _SavedItemTime;

  factory SavedItemTime.fromJson(Map<String, dynamic> json) =>
      _$SavedItemTimeFromJson(json);
}

@freezed
abstract class SavedItemLocation with _$SavedItemLocation {
  const factory SavedItemLocation({
    required String name,
    required double lat,
    required double lng,
  }) = _SavedItemLocation;

  factory SavedItemLocation.fromJson(Map<String, dynamic> json) =>
      _$SavedItemLocationFromJson(json);
}

@freezed
abstract class SavedItemSync with _$SavedItemSync {
  const factory SavedItemSync({
    required SyncStatus status,
    DateTime? lastAttemptAt,
  }) = _SavedItemSync;

  factory SavedItemSync.fromJson(Map<String, dynamic> json) =>
      _$SavedItemSyncFromJson(json);
}

@freezed
abstract class SavedItem with _$SavedItem {
  const factory SavedItem({
    required String id,
    required String itineraryId,
    required ItinerarySection section,
    required String title,
    required Map<String, dynamic> details,
    required SavedItemExternal? externalData,
    required SavedItemTime? time,
    required SavedItemLocation? location,
    @Default([]) List<Map<String, dynamic>> media,
    required String dedupeKey,
    required SavedItemSync sync,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SavedItem;

  factory SavedItem.fromJson(Map<String, dynamic> json) =>
      _$SavedItemFromJson(json);
}
