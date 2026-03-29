import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';
import 'package:dastan/src/features/settings/data/settings_repository.dart';
import 'package:dastan/src/core/data/database_provider.dart';

/// Provider for the settings repository.
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SettingsRepository(db);
});

/// Combined settings snapshot for the app.
class SettingsSnapshot {
  final UserProfile? profile;
  final List<TravelerPreset> travelerPresets;
  final SearchDefaults? searchDefaults;
  final NotificationPrefs? notificationPrefs;
  final PrivacySettings? privacySettings;
  final String? currentUserId;

  const SettingsSnapshot({
    this.profile,
    this.travelerPresets = const [],
    this.searchDefaults,
    this.notificationPrefs,
    this.privacySettings,
    this.currentUserId,
  });

  SettingsSnapshot copyWith({
    UserProfile? profile,
    List<TravelerPreset>? travelerPresets,
    SearchDefaults? searchDefaults,
    NotificationPrefs? notificationPrefs,
    PrivacySettings? privacySettings,
    String? currentUserId,
  }) {
    return SettingsSnapshot(
      profile: profile ?? this.profile,
      travelerPresets: travelerPresets ?? this.travelerPresets,
      searchDefaults: searchDefaults ?? this.searchDefaults,
      notificationPrefs: notificationPrefs ?? this.notificationPrefs,
      privacySettings: privacySettings ?? this.privacySettings,
      currentUserId: currentUserId ?? this.currentUserId,
    );
  }

  /// Get the default traveler preset.
  TravelerPreset? get defaultTravelerPreset =>
      travelerPresets.cast<TravelerPreset?>().firstWhere(
        (p) => p?.isDefault == true,
        orElse: () => travelerPresets.isNotEmpty ? travelerPresets.first : null,
      );

  /// Check if notifications are allowed based on quiet hours.
  bool isNotificationAllowed(DateTime now) {
    final quietHours = notificationPrefs?.quietHours;
    if (quietHours == null) return true;

    final hour = now.hour;
    if (quietHours.startHour < quietHours.endHour) {
      // Normal range: e.g. 09-17 (quiet during these hours)
      return !(hour >= quietHours.startHour && hour < quietHours.endHour);
    } else {
      // Wrap-around range: e.g. 22-07 (quiet from 22:00 to 07:00)
      // Hours 22, 23, 0, 1, 2, 3, 4, 5, 6 are quiet
      return !(hour >= quietHours.startHour || hour < quietHours.endHour);
    }
  }
}

/// Notifier that manages the reactive settings state.
/// Using standard class pattern for testability.
class SettingsStoreNotifier {
  final SettingsRepository _repository;
  SettingsSnapshot _state = const SettingsSnapshot();

  SettingsStoreNotifier(this._repository);

  SettingsSnapshot get state => _state;

  /// Load all settings for a user.
  Future<void> loadSettings(String userId) async {
    final profile = await _repository.getUserProfile(userId);
    final presets = await _repository.getTravelerPresets(userId);
    final searchDefaults = await _repository.getSearchDefaults(userId);
    final notifPrefs = await _repository.getNotificationPrefs(userId);
    final privacySettings = await _repository.getPrivacySettings(userId);

    _state = SettingsSnapshot(
      profile: profile,
      travelerPresets: presets,
      searchDefaults: searchDefaults,
      notificationPrefs: notifPrefs,
      privacySettings: privacySettings,
      currentUserId: userId,
    );
  }

  /// Update user profile.
  Future<void> updateProfile(UserProfile profile) async {
    await _repository.saveUserProfile(profile);
    _state = _state.copyWith(profile: profile);
  }

  /// Update traveler presets.
  Future<void> updateTravelerPresets(List<TravelerPreset> presets) async {
    if (_state.currentUserId == null) return;
    await _repository.saveTravelerPresets(_state.currentUserId!, presets);
    _state = _state.copyWith(travelerPresets: presets);
  }

  /// Update search defaults.
  Future<void> updateSearchDefaults(SearchDefaults defaults) async {
    if (_state.currentUserId == null) return;
    await _repository.saveSearchDefaults(_state.currentUserId!, defaults);
    _state = _state.copyWith(searchDefaults: defaults);
  }

  /// Update notification preferences.
  Future<void> updateNotificationPrefs(NotificationPrefs prefs) async {
    if (_state.currentUserId == null) return;
    await _repository.saveNotificationPrefs(_state.currentUserId!, prefs);
    _state = _state.copyWith(notificationPrefs: prefs);
  }

  /// Update privacy settings.
  Future<void> updatePrivacySettings(PrivacySettings settings) async {
    if (_state.currentUserId == null) return;
    await _repository.savePrivacySettings(_state.currentUserId!, settings);
    _state = _state.copyWith(privacySettings: settings);
  }
}

/// Provider for the settings store notifier.
/// For testing, this uses a simple Provider pattern.
final settingsStoreNotifierProvider = Provider<SettingsStoreNotifier>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return SettingsStoreNotifier(repository);
});

/// Provider for the current settings snapshot (for reactive UI).
/// In production, this would use a more reactive pattern.
final settingsSnapshotProvider = Provider<SettingsSnapshot>((ref) {
  return ref.watch(settingsStoreNotifierProvider).state;
});

// ============================================================================
// Selectors for prefill pipeline
// ============================================================================

/// Selector for transport search defaults.
final transportDefaultsProvider = Provider<TransportDefaults?>((ref) {
  return ref
      .watch(settingsStoreNotifierProvider)
      .state
      .searchDefaults
      ?.transport;
});

/// Selector for accommodation search defaults.
final accommodationDefaultsProvider = Provider<AccommodationDefaults?>((ref) {
  return ref
      .watch(settingsStoreNotifierProvider)
      .state
      .searchDefaults
      ?.accommodation;
});

/// Selector for food/gastronomy search defaults.
final foodDefaultsProvider = Provider<FoodDefaults?>((ref) {
  return ref.watch(settingsStoreNotifierProvider).state.searchDefaults?.food;
});

/// Selector for trails search defaults.
final trailDefaultsProvider = Provider<TrailDefaults?>((ref) {
  return ref.watch(settingsStoreNotifierProvider).state.searchDefaults?.trails;
});

/// Selector for default traveler preset.
final defaultTravelerPresetProvider = Provider<TravelerPreset?>((ref) {
  return ref.watch(settingsStoreNotifierProvider).state.defaultTravelerPreset;
});

/// Selector for current locale.
final currentLocaleProvider = Provider<String>((ref) {
  return ref.watch(settingsStoreNotifierProvider).state.profile?.locale ?? 'en';
});

/// Selector for current currency.
final currentCurrencyProvider = Provider<String>((ref) {
  return ref.watch(settingsStoreNotifierProvider).state.profile?.currency ??
      'USD';
});

/// Selector for units preferences.
final unitsPrefsProvider = Provider<UnitsPrefs>((ref) {
  return ref.watch(settingsStoreNotifierProvider).state.profile?.units ??
      const UnitsPrefs();
});
