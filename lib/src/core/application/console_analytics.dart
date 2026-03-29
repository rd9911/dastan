import 'dart:developer' as developer;

import 'package:dastan/src/core/application/analytics_service.dart';
import 'package:dastan/src/features/transport/domain/transport_search_request.dart';
import 'package:flutter/foundation.dart';

/// Console-based analytics implementation for development/debugging.
///
/// Only logs in debug mode to avoid cluttering production logs.
class ConsoleAnalyticsService implements AnalyticsService {
  const ConsoleAnalyticsService();

  void _log(String message) {
    if (kDebugMode) {
      developer.log(message, name: 'Analytics');
    }
  }

  @override
  void logEvent(String name, [Map<String, dynamic>? params]) {
    _log('EVENT: $name${params != null ? ' | $params' : ''}');
  }

  @override
  void logSearch(TransportSearchRequest request) {
    final legs = request.legs;
    final origin = legs.isNotEmpty ? legs.first.origin : 'N/A';
    final destination = legs.isNotEmpty ? legs.first.destination : 'N/A';
    final passengers = request.passengers.values.fold<int>(0, (a, b) => a + b);
    final mode = legs.isNotEmpty ? legs.first.mode.name : 'any';

    _log(
      'SEARCH: $origin → $destination | '
      'legs=${legs.length} | passengers=$passengers | '
      'mode=$mode | cabin=${request.filters?.cabinClass ?? "any"}',
    );
  }

  @override
  void logSave({
    required String itemId,
    required String type,
    required bool isSave,
  }) {
    final action = isSave ? 'SAVE' : 'UNSAVE';
    _log('$action: $type | id=$itemId');
  }

  @override
  void logError(Object error, [StackTrace? stackTrace]) {
    _log('ERROR: $error');
    if (stackTrace != null && kDebugMode) {
      developer.log(stackTrace.toString(), name: 'Analytics');
    }
  }

  @override
  void logScreenView(String screenName) {
    _log('SCREEN: $screenName');
  }

  @override
  void setUserProperty(String name, String value) {
    _log('USER_PROPERTY: $name=$value');
  }
}
