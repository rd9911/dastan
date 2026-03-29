import 'package:flutter/material.dart';

/// Accessibility helpers for offline feature screens.
class OfflineA11y {
  /// Semantic label for offline bundle status.
  static String bundleStatusLabel(bool isDownloaded, int sizeMb) {
    if (isDownloaded) {
      return 'Offline bundle available, $sizeMb megabytes';
    }
    return 'Offline bundle not downloaded';
  }

  /// Semantic label for download progress.
  static String downloadProgressLabel(double progress) {
    final percent = (progress * 100).round();
    return 'Downloading, $percent percent complete';
  }

  /// Semantic label for share link status.
  static String shareLinkLabel(bool hasExpiry, DateTime? expiresAt) {
    if (!hasExpiry) {
      return 'Share link with no expiration';
    }
    final daysLeft = expiresAt!.difference(DateTime.now()).inDays;
    return 'Share link expires in $daysLeft days';
  }

  /// Wraps a widget with appropriate semantics for offline actions.
  static Widget offlineActionButton({
    required Widget child,
    required String label,
    required VoidCallback onTap,
  }) {
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(onTap: onTap, child: child),
    );
  }
}
