import 'dart:convert';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';

/// Repository for persisting and retrieving user settings.
/// Uses Drift for local storage with JSON serialization for complex objects.
class SettingsRepository {
  final AppDatabase _db;

  SettingsRepository(this._db);

  /// Gets the user profile from local storage.
  Future<UserProfile?> getUserProfile(String userId) async {
    final row = await (_db.select(
      _db.keyValueStore,
    )..where((t) => t.key.equals('profile_$userId'))).getSingleOrNull();

    if (row == null) return null;
    return UserProfile.fromJson(jsonDecode(row.value) as Map<String, dynamic>);
  }

  /// Saves the user profile to local storage.
  Future<void> saveUserProfile(UserProfile profile) async {
    await _db
        .into(_db.keyValueStore)
        .insertOnConflictUpdate(
          KeyValueStoreCompanion.insert(
            key: 'profile_${profile.userId}',
            value: jsonEncode(profile.toJson()),
          ),
        );
  }

  /// Gets traveler presets for a user.
  Future<List<TravelerPreset>> getTravelerPresets(String userId) async {
    final row = await (_db.select(
      _db.keyValueStore,
    )..where((t) => t.key.equals('travelers_$userId'))).getSingleOrNull();

    if (row == null) return [];
    final list = jsonDecode(row.value) as List;
    return list
        .map((e) => TravelerPreset.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Saves traveler presets.
  Future<void> saveTravelerPresets(
    String userId,
    List<TravelerPreset> presets,
  ) async {
    await _db
        .into(_db.keyValueStore)
        .insertOnConflictUpdate(
          KeyValueStoreCompanion.insert(
            key: 'travelers_$userId',
            value: jsonEncode(presets.map((p) => p.toJson()).toList()),
          ),
        );
  }

  /// Gets search defaults.
  Future<SearchDefaults?> getSearchDefaults(String userId) async {
    final row = await (_db.select(
      _db.keyValueStore,
    )..where((t) => t.key.equals('search_defaults_$userId'))).getSingleOrNull();

    if (row == null) return null;
    return SearchDefaults.fromJson(
      jsonDecode(row.value) as Map<String, dynamic>,
    );
  }

  /// Saves search defaults.
  Future<void> saveSearchDefaults(
    String userId,
    SearchDefaults defaults,
  ) async {
    await _db
        .into(_db.keyValueStore)
        .insertOnConflictUpdate(
          KeyValueStoreCompanion.insert(
            key: 'search_defaults_$userId',
            value: jsonEncode(defaults.toJson()),
          ),
        );
  }

  /// Gets notification preferences.
  Future<NotificationPrefs?> getNotificationPrefs(String userId) async {
    final row = await (_db.select(
      _db.keyValueStore,
    )..where((t) => t.key.equals('notif_prefs_$userId'))).getSingleOrNull();

    if (row == null) return null;
    return NotificationPrefs.fromJson(
      jsonDecode(row.value) as Map<String, dynamic>,
    );
  }

  /// Saves notification preferences.
  Future<void> saveNotificationPrefs(
    String userId,
    NotificationPrefs prefs,
  ) async {
    await _db
        .into(_db.keyValueStore)
        .insertOnConflictUpdate(
          KeyValueStoreCompanion.insert(
            key: 'notif_prefs_$userId',
            value: jsonEncode(prefs.toJson()),
          ),
        );
  }

  /// Gets privacy settings.
  Future<PrivacySettings?> getPrivacySettings(String userId) async {
    final row = await (_db.select(
      _db.keyValueStore,
    )..where((t) => t.key.equals('privacy_$userId'))).getSingleOrNull();

    if (row == null) return null;
    return PrivacySettings.fromJson(
      jsonDecode(row.value) as Map<String, dynamic>,
    );
  }

  /// Saves privacy settings.
  Future<void> savePrivacySettings(
    String userId,
    PrivacySettings settings,
  ) async {
    await _db
        .into(_db.keyValueStore)
        .insertOnConflictUpdate(
          KeyValueStoreCompanion.insert(
            key: 'privacy_$userId',
            value: jsonEncode(settings.toJson()),
          ),
        );
  }
}
