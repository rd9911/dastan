import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Accessibility helpers for the settings UI.
class SettingsA11y {
  /// Semantic labels for settings tabs.
  static const Map<String, String> tabLabels = {
    'profile':
        'Profile settings tab. Edit your name, location, and display preferences.',
    'travelers': 'Travelers tab. Manage party presets for quick trip setup.',
    'preferences':
        'Preferences tab. Set search defaults for transport, accommodation, food, and trails.',
    'notifications':
        'Notifications tab. Configure push, email, quiet hours, and trip-only alerts.',
    'privacy':
        'Privacy and data tab. Manage analytics, sharing defaults, and export your data.',
    'security':
        'Security tab. Enable two-factor authentication and manage active sessions.',
    'storage': 'Storage tab. View and manage offline bundles and cached data.',
  };

  /// Get semantic label for a tab.
  static String getTabLabel(String tabId) {
    return tabLabels[tabId] ?? 'Settings tab';
  }

  /// Announce a change to screen readers.
  static void announceChange(BuildContext context, String message) {
    // ignore: deprecated_member_use
    SemanticsService.announce(message, TextDirection.ltr);
  }

  /// Standard button semantics.
  static String getSaveButtonLabel(bool hasChanges) {
    return hasChanges
        ? 'Save changes. Double tap to save current settings.'
        : 'No changes to save.';
  }

  static String getResetButtonLabel() {
    return 'Reset changes. Double tap to discard unsaved changes.';
  }

  /// Toggle semantics.
  static String getToggleLabel(String setting, bool currentValue) {
    return '$setting. Currently ${currentValue ? 'enabled' : 'disabled'}. Double tap to toggle.';
  }

  /// Slider semantics.
  static String getSliderLabel(String setting, double value, String unit) {
    return '$setting. Current value: ${value.toStringAsFixed(1)} $unit. Swipe up or down to adjust.';
  }

  /// List item semantics for traveler presets.
  static String getPresetLabel(
    String name,
    int adults,
    int children,
    bool isDefault,
  ) {
    final childText = children > 0
        ? ' and $children ${children == 1 ? 'child' : 'children'}'
        : '';
    final defaultText = isDefault ? '. This is your default preset.' : '';
    return '$name. $adults ${adults == 1 ? 'adult' : 'adults'}$childText$defaultText';
  }

  /// Storage indicator semantics.
  static String getStorageLabel(String category, int bytes) {
    final size = _formatBytes(bytes);
    return '$category storage. Using $size.';
  }

  /// Session list semantics.
  static String getSessionLabel(
    String device,
    bool isCurrent,
    String lastActive,
  ) {
    return isCurrent
        ? '$device. This is your current session.'
        : '$device. Last active $lastActive. Double tap for options.';
  }

  static String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes bytes';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

/// Common accessible widget wrappers.
extension SettingsA11yWidgets on Widget {
  /// Wrap with semantics for a setting toggle.
  Widget withSettingSemantics({
    required String label,
    required bool value,
    VoidCallback? onTap,
  }) {
    return Semantics(
      label: SettingsA11y.getToggleLabel(label, value),
      toggled: value,
      onTap: onTap,
      child: this,
    );
  }

  /// Wrap with semantics for a button.
  Widget withButtonSemantics({required String label, bool enabled = true}) {
    return Semantics(label: label, button: true, enabled: enabled, child: this);
  }
}
