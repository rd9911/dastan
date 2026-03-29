/// Telemetry events for offline feature analytics.
class OfflineTelemetry {
  /// Tracks when a user initiates an offline download.
  static void trackDownloadStarted(String itineraryId, int estimatedSizeMb) {
    // Stub: In production, send to analytics service
    // e.g., analytics.track('offline_download_started', {...});
  }

  /// Tracks successful offline download completion.
  static void trackDownloadCompleted(
    String itineraryId,
    int actualSizeMb,
    Duration duration,
  ) {
    // Stub: In production, send to analytics service
  }

  /// Tracks download failure.
  static void trackDownloadFailed(String itineraryId, String errorType) {
    // Stub: In production, send to analytics service
  }

  /// Tracks when user enters offline mode.
  static void trackOfflineModeEntered(String itineraryId) {
    // Stub: In production, send to analytics service
  }

  /// Tracks share link creation.
  static void trackShareCreated(
    String itineraryId,
    bool hasExpiry,
    bool reducedPrecision,
  ) {
    // Stub: In production, send to analytics service
  }

  /// Tracks share link revocation.
  static void trackShareRevoked(String shareId) {
    // Stub: In production, send to analytics service
  }
}
