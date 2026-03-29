import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';

/// Service for syncing user profile data with Supabase.
///
/// This service handles bidirectional sync between local settings and Supabase profiles.
class SupabaseProfileService {
  final SupabaseClient _client;

  SupabaseProfileService(this._client);

  /// Fetches the user profile from Supabase.
  Future<UserProfile?> fetchRemoteProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    try {
      final response = await _client
          .from('profiles')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (response == null) return null;

      // Map Supabase profile fields to UserProfile model
      // The 'preferences' column stores extended settings as JSONB
      final prefs = response['preferences'] as Map<String, dynamic>? ?? {};

      return UserProfile(
        userId: user.id,
        name:
            response['display_name'] ?? user.email?.split('@').first ?? 'User',
        avatarUrl: response['avatar_url'],
        homeCity: prefs['home_city'] as String?,
        timezone: prefs['timezone'] as String? ?? 'UTC',
        locale: prefs['locale'] as String? ?? 'en',
        currency: prefs['currency'] as String? ?? 'USD',
        units: prefs['units'] != null
            ? UnitsPrefs.fromJson(prefs['units'] as Map<String, dynamic>)
            : const UnitsPrefs(),
      );
    } catch (e) {
      print('Error fetching remote profile: $e');
      return null;
    }
  }

  /// Pushes the user profile to Supabase.
  Future<void> pushProfile(UserProfile profile) async {
    final user = _client.auth.currentUser;
    if (user == null || user.id != profile.userId) return;

    try {
      final preferences = {
        'home_city': profile.homeCity,
        'timezone': profile.timezone,
        'locale': profile.locale,
        'currency': profile.currency,
        'units': profile.units.toJson(),
      };

      await _client
          .from('profiles')
          .update({
            'display_name': profile.name,
            'avatar_url': profile.avatarUrl,
            'preferences': preferences,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', user.id);
    } catch (e) {
      print('Error pushing profile: $e');
      rethrow;
    }
  }

  /// Fetches settings data (traveler presets, search defaults, etc.) from Supabase.
  Future<Map<String, dynamic>?> fetchRemoteSettings() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    try {
      final response = await _client
          .from('profiles')
          .select('preferences')
          .eq('id', user.id)
          .maybeSingle();

      if (response == null) return null;
      return response['preferences'] as Map<String, dynamic>?;
    } catch (e) {
      print('Error fetching remote settings: $e');
      return null;
    }
  }

  /// Pushes extended settings to Supabase preferences column.
  Future<void> pushSettings({
    List<TravelerPreset>? travelerPresets,
    SearchDefaults? searchDefaults,
    NotificationPrefs? notificationPrefs,
    PrivacySettings? privacySettings,
  }) async {
    final user = _client.auth.currentUser;
    if (user == null) return;

    try {
      // First fetch existing preferences to merge
      final existing = await fetchRemoteSettings() ?? {};

      final mergedPrefs = {
        ...existing,
        if (travelerPresets != null)
          'traveler_presets': travelerPresets.map((p) => p.toJson()).toList(),
        if (searchDefaults != null) 'search_defaults': searchDefaults.toJson(),
        if (notificationPrefs != null)
          'notification_prefs': notificationPrefs.toJson(),
        if (privacySettings != null)
          'privacy_settings': privacySettings.toJson(),
      };

      await _client
          .from('profiles')
          .update({
            'preferences': mergedPrefs,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', user.id);
    } catch (e) {
      print('Error pushing settings: $e');
      rethrow;
    }
  }

  /// Parses extended settings from remote preferences.
  SettingsBundle parseRemoteSettings(Map<String, dynamic> prefs) {
    return SettingsBundle(
      travelerPresets:
          (prefs['traveler_presets'] as List?)
              ?.map((e) => TravelerPreset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      searchDefaults: prefs['search_defaults'] != null
          ? SearchDefaults.fromJson(
              prefs['search_defaults'] as Map<String, dynamic>,
            )
          : null,
      notificationPrefs: prefs['notification_prefs'] != null
          ? NotificationPrefs.fromJson(
              prefs['notification_prefs'] as Map<String, dynamic>,
            )
          : null,
      privacySettings: prefs['privacy_settings'] != null
          ? PrivacySettings.fromJson(
              prefs['privacy_settings'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

/// Bundle of all synced settings.
class SettingsBundle {
  final List<TravelerPreset> travelerPresets;
  final SearchDefaults? searchDefaults;
  final NotificationPrefs? notificationPrefs;
  final PrivacySettings? privacySettings;

  SettingsBundle({
    this.travelerPresets = const [],
    this.searchDefaults,
    this.notificationPrefs,
    this.privacySettings,
  });
}
