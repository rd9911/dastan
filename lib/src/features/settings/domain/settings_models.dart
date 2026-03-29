import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_models.freezed.dart';
part 'settings_models.g.dart';

/// Units preferences for display formatting.
@freezed
abstract class UnitsPrefs with _$UnitsPrefs {
  const factory UnitsPrefs({
    @Default(true) bool useKilometers,
    @Default(true) bool useCelsius,
    @Default(true) bool use24HourClock,
  }) = _UnitsPrefs;

  factory UnitsPrefs.fromJson(Map<String, dynamic> json) =>
      _$UnitsPrefsFromJson(json);
}

/// User profile with identity and preferences.
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String userId,
    required String name,
    String? avatarUrl,
    String? homeCity,
    @Default('UTC') String timezone,
    @Default('en') String locale,
    @Default('USD') String currency,
    @Default(UnitsPrefs()) UnitsPrefs units,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// A preset for common traveler configurations.
@freezed
abstract class TravelerPreset with _$TravelerPreset {
  const factory TravelerPreset({
    required String id,
    required String name,
    @Default(2) int adults,
    @Default([]) List<int> childAges,
    @Default(false) bool isDefault,
  }) = _TravelerPreset;

  factory TravelerPreset.fromJson(Map<String, dynamic> json) =>
      _$TravelerPresetFromJson(json);
}

/// Default search preferences for each vertical.
@freezed
abstract class SearchDefaults with _$SearchDefaults {
  const factory SearchDefaults({
    TransportDefaults? transport,
    AccommodationDefaults? accommodation,
    FoodDefaults? food,
    TrailDefaults? trails,
  }) = _SearchDefaults;

  factory SearchDefaults.fromJson(Map<String, dynamic> json) =>
      _$SearchDefaultsFromJson(json);
}

@freezed
abstract class TransportDefaults with _$TransportDefaults {
  const factory TransportDefaults({
    @Default([]) List<String> preferredModes, // train, bus, flight, etc.
    @Default(false) bool directOnly,
    @Default('economy') String cabinClass,
  }) = _TransportDefaults;

  factory TransportDefaults.fromJson(Map<String, dynamic> json) =>
      _$TransportDefaultsFromJson(json);
}

@freezed
abstract class AccommodationDefaults with _$AccommodationDefaults {
  const factory AccommodationDefaults({
    @Default(3.5) double minReviewScore,
    @Default([]) List<String> requiredAmenities,
    int? maxPricePerNight,
  }) = _AccommodationDefaults;

  factory AccommodationDefaults.fromJson(Map<String, dynamic> json) =>
      _$AccommodationDefaultsFromJson(json);
}

@freezed
abstract class FoodDefaults with _$FoodDefaults {
  const factory FoodDefaults({
    @Default([])
    List<String> dietaryPreferences, // vegan, vegetarian, halal, etc.
    @Default([]) List<String> cuisineTypes,
    @Default(3.0) double minRating,
  }) = _FoodDefaults;

  factory FoodDefaults.fromJson(Map<String, dynamic> json) =>
      _$FoodDefaultsFromJson(json);
}

@freezed
abstract class TrailDefaults with _$TrailDefaults {
  const factory TrailDefaults({
    @Default([]) List<String> difficulties, // easy, moderate, hard
    int? maxDurationMinutes,
    int? maxDistanceKm,
  }) = _TrailDefaults;

  factory TrailDefaults.fromJson(Map<String, dynamic> json) =>
      _$TrailDefaultsFromJson(json);
}

/// Notification preferences.
@freezed
abstract class NotificationPrefs with _$NotificationPrefs {
  const factory NotificationPrefs({
    @Default(NotificationChannels()) NotificationChannels channels,
    @Default(NotificationCategories()) NotificationCategories categories,
    QuietHours? quietHours,
    @Default(false) bool tripOnlyMode,
  }) = _NotificationPrefs;

  factory NotificationPrefs.fromJson(Map<String, dynamic> json) =>
      _$NotificationPrefsFromJson(json);
}

@freezed
abstract class NotificationChannels with _$NotificationChannels {
  const factory NotificationChannels({
    @Default(true) bool push,
    @Default(true) bool email,
  }) = _NotificationChannels;

  factory NotificationChannels.fromJson(Map<String, dynamic> json) =>
      _$NotificationChannelsFromJson(json);
}

@freezed
abstract class NotificationCategories with _$NotificationCategories {
  const factory NotificationCategories({
    @Default(true) bool bookingUpdates,
    @Default(true) bool saveSyncStatus,
    @Default(true) bool plannerReminders,
    @Default(true) bool leaveNow,
  }) = _NotificationCategories;

  factory NotificationCategories.fromJson(Map<String, dynamic> json) =>
      _$NotificationCategoriesFromJson(json);
}

@freezed
abstract class QuietHours with _$QuietHours {
  const factory QuietHours({
    required int startHour, // 0-23
    required int endHour, // 0-23
  }) = _QuietHours;

  factory QuietHours.fromJson(Map<String, dynamic> json) =>
      _$QuietHoursFromJson(json);
}

/// Privacy and data control settings.
@freezed
abstract class PrivacySettings with _$PrivacySettings {
  const factory PrivacySettings({
    @Default(true) bool analyticsOptIn,
    @Default(true) bool diagnosticsOptIn,
    @Default(SnapshotDefaults()) SnapshotDefaults snapshotDefaults,
    @Default([]) List<String> connectedIntegrations, // email, calendar, etc.
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);
}

@freezed
abstract class SnapshotDefaults with _$SnapshotDefaults {
  const factory SnapshotDefaults({
    @Default(true) bool redactPII,
    @Default(false) bool redactPrices,
    @Default(true) bool redactNotes,
    @Default('visible') String photoVisibility, // visible, blur, hide
  }) = _SnapshotDefaults;

  factory SnapshotDefaults.fromJson(Map<String, dynamic> json) =>
      _$SnapshotDefaultsFromJson(json);
}

/// Security metadata.
@freezed
abstract class SecurityMeta with _$SecurityMeta {
  const factory SecurityMeta({
    @Default(false) bool twoFactorEnabled,
    String? twoFactorMethod, // totp, sms
    @Default([]) List<DeviceSession> activeSessions,
    DateTime? lastPasswordChange,
  }) = _SecurityMeta;

  factory SecurityMeta.fromJson(Map<String, dynamic> json) =>
      _$SecurityMetaFromJson(json);
}

@freezed
abstract class DeviceSession with _$DeviceSession {
  const factory DeviceSession({
    required String sessionId,
    required String deviceName,
    required String deviceType,
    required DateTime lastActive,
    @Default(false) bool isCurrent,
  }) = _DeviceSession;

  factory DeviceSession.fromJson(Map<String, dynamic> json) =>
      _$DeviceSessionFromJson(json);
}

/// Storage inventory entry for offline bundles.
@freezed
abstract class StorageEntry with _$StorageEntry {
  const factory StorageEntry({
    required String itineraryId,
    required String itineraryName,
    required int sizeBytes,
    required DateTime downloadedAt,
    DateTime? lastSyncedAt,
  }) = _StorageEntry;

  factory StorageEntry.fromJson(Map<String, dynamic> json) =>
      _$StorageEntryFromJson(json);
}
