// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the analytics service.
///
/// Returns [ConsoleAnalyticsService] by default.
/// Override in tests or production to use a different implementation.

@ProviderFor(analyticsService)
const analyticsServiceProvider = AnalyticsServiceProvider._();

/// Provider for the analytics service.
///
/// Returns [ConsoleAnalyticsService] by default.
/// Override in tests or production to use a different implementation.

final class AnalyticsServiceProvider
    extends
        $FunctionalProvider<
          AnalyticsService,
          AnalyticsService,
          AnalyticsService
        >
    with $Provider<AnalyticsService> {
  /// Provider for the analytics service.
  ///
  /// Returns [ConsoleAnalyticsService] by default.
  /// Override in tests or production to use a different implementation.
  const AnalyticsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsServiceHash();

  @$internal
  @override
  $ProviderElement<AnalyticsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AnalyticsService create(Ref ref) {
    return analyticsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsService>(value),
    );
  }
}

String _$analyticsServiceHash() => r'4b5900784b6235695d708ee9da75105a566acdd8';
