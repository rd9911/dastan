// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitsPrefs _$UnitsPrefsFromJson(Map<String, dynamic> json) => _UnitsPrefs(
  useKilometers: json['useKilometers'] as bool? ?? true,
  useCelsius: json['useCelsius'] as bool? ?? true,
  use24HourClock: json['use24HourClock'] as bool? ?? true,
);

Map<String, dynamic> _$UnitsPrefsToJson(_UnitsPrefs instance) =>
    <String, dynamic>{
      'useKilometers': instance.useKilometers,
      'useCelsius': instance.useCelsius,
      'use24HourClock': instance.use24HourClock,
    };

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  userId: json['userId'] as String,
  name: json['name'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  homeCity: json['homeCity'] as String?,
  timezone: json['timezone'] as String? ?? 'UTC',
  locale: json['locale'] as String? ?? 'en',
  currency: json['currency'] as String? ?? 'USD',
  units: json['units'] == null
      ? const UnitsPrefs()
      : UnitsPrefs.fromJson(json['units'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'homeCity': instance.homeCity,
      'timezone': instance.timezone,
      'locale': instance.locale,
      'currency': instance.currency,
      'units': instance.units.toJson(),
    };

_TravelerPreset _$TravelerPresetFromJson(Map<String, dynamic> json) =>
    _TravelerPreset(
      id: json['id'] as String,
      name: json['name'] as String,
      adults: (json['adults'] as num?)?.toInt() ?? 2,
      childAges:
          (json['childAges'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$TravelerPresetToJson(_TravelerPreset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adults': instance.adults,
      'childAges': instance.childAges,
      'isDefault': instance.isDefault,
    };

_SearchDefaults _$SearchDefaultsFromJson(Map<String, dynamic> json) =>
    _SearchDefaults(
      transport: json['transport'] == null
          ? null
          : TransportDefaults.fromJson(
              json['transport'] as Map<String, dynamic>,
            ),
      accommodation: json['accommodation'] == null
          ? null
          : AccommodationDefaults.fromJson(
              json['accommodation'] as Map<String, dynamic>,
            ),
      food: json['food'] == null
          ? null
          : FoodDefaults.fromJson(json['food'] as Map<String, dynamic>),
      trails: json['trails'] == null
          ? null
          : TrailDefaults.fromJson(json['trails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchDefaultsToJson(_SearchDefaults instance) =>
    <String, dynamic>{
      'transport': instance.transport?.toJson(),
      'accommodation': instance.accommodation?.toJson(),
      'food': instance.food?.toJson(),
      'trails': instance.trails?.toJson(),
    };

_TransportDefaults _$TransportDefaultsFromJson(Map<String, dynamic> json) =>
    _TransportDefaults(
      preferredModes:
          (json['preferredModes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      directOnly: json['directOnly'] as bool? ?? false,
      cabinClass: json['cabinClass'] as String? ?? 'economy',
    );

Map<String, dynamic> _$TransportDefaultsToJson(_TransportDefaults instance) =>
    <String, dynamic>{
      'preferredModes': instance.preferredModes,
      'directOnly': instance.directOnly,
      'cabinClass': instance.cabinClass,
    };

_AccommodationDefaults _$AccommodationDefaultsFromJson(
  Map<String, dynamic> json,
) => _AccommodationDefaults(
  minReviewScore: (json['minReviewScore'] as num?)?.toDouble() ?? 3.5,
  requiredAmenities:
      (json['requiredAmenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  maxPricePerNight: (json['maxPricePerNight'] as num?)?.toInt(),
);

Map<String, dynamic> _$AccommodationDefaultsToJson(
  _AccommodationDefaults instance,
) => <String, dynamic>{
  'minReviewScore': instance.minReviewScore,
  'requiredAmenities': instance.requiredAmenities,
  'maxPricePerNight': instance.maxPricePerNight,
};

_FoodDefaults _$FoodDefaultsFromJson(Map<String, dynamic> json) =>
    _FoodDefaults(
      dietaryPreferences:
          (json['dietaryPreferences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cuisineTypes:
          (json['cuisineTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      minRating: (json['minRating'] as num?)?.toDouble() ?? 3.0,
    );

Map<String, dynamic> _$FoodDefaultsToJson(_FoodDefaults instance) =>
    <String, dynamic>{
      'dietaryPreferences': instance.dietaryPreferences,
      'cuisineTypes': instance.cuisineTypes,
      'minRating': instance.minRating,
    };

_TrailDefaults _$TrailDefaultsFromJson(Map<String, dynamic> json) =>
    _TrailDefaults(
      difficulties:
          (json['difficulties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      maxDurationMinutes: (json['maxDurationMinutes'] as num?)?.toInt(),
      maxDistanceKm: (json['maxDistanceKm'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TrailDefaultsToJson(_TrailDefaults instance) =>
    <String, dynamic>{
      'difficulties': instance.difficulties,
      'maxDurationMinutes': instance.maxDurationMinutes,
      'maxDistanceKm': instance.maxDistanceKm,
    };

_NotificationPrefs _$NotificationPrefsFromJson(Map<String, dynamic> json) =>
    _NotificationPrefs(
      channels: json['channels'] == null
          ? const NotificationChannels()
          : NotificationChannels.fromJson(
              json['channels'] as Map<String, dynamic>,
            ),
      categories: json['categories'] == null
          ? const NotificationCategories()
          : NotificationCategories.fromJson(
              json['categories'] as Map<String, dynamic>,
            ),
      quietHours: json['quietHours'] == null
          ? null
          : QuietHours.fromJson(json['quietHours'] as Map<String, dynamic>),
      tripOnlyMode: json['tripOnlyMode'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationPrefsToJson(_NotificationPrefs instance) =>
    <String, dynamic>{
      'channels': instance.channels.toJson(),
      'categories': instance.categories.toJson(),
      'quietHours': instance.quietHours?.toJson(),
      'tripOnlyMode': instance.tripOnlyMode,
    };

_NotificationChannels _$NotificationChannelsFromJson(
  Map<String, dynamic> json,
) => _NotificationChannels(
  push: json['push'] as bool? ?? true,
  email: json['email'] as bool? ?? true,
);

Map<String, dynamic> _$NotificationChannelsToJson(
  _NotificationChannels instance,
) => <String, dynamic>{'push': instance.push, 'email': instance.email};

_NotificationCategories _$NotificationCategoriesFromJson(
  Map<String, dynamic> json,
) => _NotificationCategories(
  bookingUpdates: json['bookingUpdates'] as bool? ?? true,
  saveSyncStatus: json['saveSyncStatus'] as bool? ?? true,
  plannerReminders: json['plannerReminders'] as bool? ?? true,
  leaveNow: json['leaveNow'] as bool? ?? true,
);

Map<String, dynamic> _$NotificationCategoriesToJson(
  _NotificationCategories instance,
) => <String, dynamic>{
  'bookingUpdates': instance.bookingUpdates,
  'saveSyncStatus': instance.saveSyncStatus,
  'plannerReminders': instance.plannerReminders,
  'leaveNow': instance.leaveNow,
};

_QuietHours _$QuietHoursFromJson(Map<String, dynamic> json) => _QuietHours(
  startHour: (json['startHour'] as num).toInt(),
  endHour: (json['endHour'] as num).toInt(),
);

Map<String, dynamic> _$QuietHoursToJson(_QuietHours instance) =>
    <String, dynamic>{
      'startHour': instance.startHour,
      'endHour': instance.endHour,
    };

_PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) =>
    _PrivacySettings(
      analyticsOptIn: json['analyticsOptIn'] as bool? ?? true,
      diagnosticsOptIn: json['diagnosticsOptIn'] as bool? ?? true,
      snapshotDefaults: json['snapshotDefaults'] == null
          ? const SnapshotDefaults()
          : SnapshotDefaults.fromJson(
              json['snapshotDefaults'] as Map<String, dynamic>,
            ),
      connectedIntegrations:
          (json['connectedIntegrations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PrivacySettingsToJson(_PrivacySettings instance) =>
    <String, dynamic>{
      'analyticsOptIn': instance.analyticsOptIn,
      'diagnosticsOptIn': instance.diagnosticsOptIn,
      'snapshotDefaults': instance.snapshotDefaults.toJson(),
      'connectedIntegrations': instance.connectedIntegrations,
    };

_SnapshotDefaults _$SnapshotDefaultsFromJson(Map<String, dynamic> json) =>
    _SnapshotDefaults(
      redactPII: json['redactPII'] as bool? ?? true,
      redactPrices: json['redactPrices'] as bool? ?? false,
      redactNotes: json['redactNotes'] as bool? ?? true,
      photoVisibility: json['photoVisibility'] as String? ?? 'visible',
    );

Map<String, dynamic> _$SnapshotDefaultsToJson(_SnapshotDefaults instance) =>
    <String, dynamic>{
      'redactPII': instance.redactPII,
      'redactPrices': instance.redactPrices,
      'redactNotes': instance.redactNotes,
      'photoVisibility': instance.photoVisibility,
    };

_SecurityMeta _$SecurityMetaFromJson(Map<String, dynamic> json) =>
    _SecurityMeta(
      twoFactorEnabled: json['twoFactorEnabled'] as bool? ?? false,
      twoFactorMethod: json['twoFactorMethod'] as String?,
      activeSessions:
          (json['activeSessions'] as List<dynamic>?)
              ?.map((e) => DeviceSession.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastPasswordChange: json['lastPasswordChange'] == null
          ? null
          : DateTime.parse(json['lastPasswordChange'] as String),
    );

Map<String, dynamic> _$SecurityMetaToJson(_SecurityMeta instance) =>
    <String, dynamic>{
      'twoFactorEnabled': instance.twoFactorEnabled,
      'twoFactorMethod': instance.twoFactorMethod,
      'activeSessions': instance.activeSessions.map((e) => e.toJson()).toList(),
      'lastPasswordChange': instance.lastPasswordChange?.toIso8601String(),
    };

_DeviceSession _$DeviceSessionFromJson(Map<String, dynamic> json) =>
    _DeviceSession(
      sessionId: json['sessionId'] as String,
      deviceName: json['deviceName'] as String,
      deviceType: json['deviceType'] as String,
      lastActive: DateTime.parse(json['lastActive'] as String),
      isCurrent: json['isCurrent'] as bool? ?? false,
    );

Map<String, dynamic> _$DeviceSessionToJson(_DeviceSession instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'deviceName': instance.deviceName,
      'deviceType': instance.deviceType,
      'lastActive': instance.lastActive.toIso8601String(),
      'isCurrent': instance.isCurrent,
    };

_StorageEntry _$StorageEntryFromJson(Map<String, dynamic> json) =>
    _StorageEntry(
      itineraryId: json['itineraryId'] as String,
      itineraryName: json['itineraryName'] as String,
      sizeBytes: (json['sizeBytes'] as num).toInt(),
      downloadedAt: DateTime.parse(json['downloadedAt'] as String),
      lastSyncedAt: json['lastSyncedAt'] == null
          ? null
          : DateTime.parse(json['lastSyncedAt'] as String),
    );

Map<String, dynamic> _$StorageEntryToJson(_StorageEntry instance) =>
    <String, dynamic>{
      'itineraryId': instance.itineraryId,
      'itineraryName': instance.itineraryName,
      'sizeBytes': instance.sizeBytes,
      'downloadedAt': instance.downloadedAt.toIso8601String(),
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };
