import 'package:dastan/src/features/transport/domain/transport_search_request.dart';

/// Abstract analytics service for logging events across the application.
///
/// Implementations can target different backends (console, Firebase, Amplitude, etc.)
abstract class AnalyticsService {
  /// Log a generic event with optional parameters.
  void logEvent(String name, [Map<String, dynamic>? params]);

  /// Log a transport search event.
  void logSearch(TransportSearchRequest request);

  /// Log a save/unsave action.
  void logSave({
    required String itemId,
    required String type,
    required bool isSave,
  });

  /// Log an error with optional stack trace.
  void logError(Object error, [StackTrace? stackTrace]);

  /// Log screen view for navigation tracking.
  void logScreenView(String screenName);

  /// Set user property for segmentation.
  void setUserProperty(String name, String value);
}
