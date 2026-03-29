import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dastan/src/core/application/analytics_service.dart';
import 'package:dastan/src/core/application/console_analytics.dart';

part 'analytics_providers.g.dart';

/// Provider for the analytics service.
///
/// Returns [ConsoleAnalyticsService] by default.
/// Override in tests or production to use a different implementation.
@riverpod
AnalyticsService analyticsService(Ref ref) {
  return const ConsoleAnalyticsService();
}
