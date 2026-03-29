/// Telemetry events for settings feature.
/// These events help track user preferences and feature usage.
class SettingsTelemetry {
  /// Log when a user views the settings screen.
  static Map<String, dynamic> settingsOpened({required String tab}) {
    return {
      'event': 'settings_opened',
      'tab': tab,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log when a setting is changed.
  static Map<String, dynamic> settingChanged({
    required String category,
    required String field,
    String? oldValue,
    String? newValue,
  }) {
    return {
      'event': 'setting_changed',
      'category': category,
      'field': field,
      'old_value': oldValue,
      'new_value': newValue,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log when a traveler preset is created/modified.
  static Map<String, dynamic> travelerPresetUpdated({
    required String action, // 'created', 'modified', 'deleted', 'set_default'
    required int totalPresets,
  }) {
    return {
      'event': 'traveler_preset_updated',
      'action': action,
      'total_presets': totalPresets,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log 2FA enrollment/unenrollment.
  static Map<String, dynamic> twoFactorChanged({
    required bool enabled,
    String? method,
  }) {
    return {
      'event': 'two_factor_changed',
      'enabled': enabled,
      'method': method,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log data export request.
  static Map<String, dynamic> dataExported({required int sizeBytes}) {
    return {
      'event': 'data_exported',
      'size_bytes': sizeBytes,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log account deletion initiation.
  static Map<String, dynamic> deletionInitiated({
    required int gracePeriodDays,
  }) {
    return {
      'event': 'deletion_initiated',
      'grace_period_days': gracePeriodDays,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log offline bundle management actions.
  static Map<String, dynamic> offlineBundleAction({
    required String action, // 'refreshed', 'deleted', 'cache_cleared'
    int? sizeBytes,
  }) {
    return {
      'event': 'offline_bundle_action',
      'action': action,
      'size_bytes': sizeBytes,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log quiet hours configuration.
  static Map<String, dynamic> quietHoursConfigured({
    required bool enabled,
    int? startHour,
    int? endHour,
  }) {
    return {
      'event': 'quiet_hours_configured',
      'enabled': enabled,
      'start_hour': startHour,
      'end_hour': endHour,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log privacy setting changes.
  static Map<String, dynamic> privacySettingChanged({
    required String setting,
    required bool value,
  }) {
    return {
      'event': 'privacy_setting_changed',
      'setting': setting,
      'value': value,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
