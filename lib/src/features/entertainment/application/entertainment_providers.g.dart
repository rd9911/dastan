// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entertainment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the entertainment repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.

@ProviderFor(entertainmentRepository)
const entertainmentRepositoryProvider = EntertainmentRepositoryProvider._();

/// Provider for the entertainment repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.

final class EntertainmentRepositoryProvider
    extends
        $FunctionalProvider<
          EntertainmentRepository,
          EntertainmentRepository,
          EntertainmentRepository
        >
    with $Provider<EntertainmentRepository> {
  /// Provider for the entertainment repository.
  ///
  /// Returns a caching repository wrapping the mock implementation.
  /// Integrates with the unified Search Platform.
  const EntertainmentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'entertainmentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$entertainmentRepositoryHash();

  @$internal
  @override
  $ProviderElement<EntertainmentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EntertainmentRepository create(Ref ref) {
    return entertainmentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntertainmentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntertainmentRepository>(value),
    );
  }
}

String _$entertainmentRepositoryHash() =>
    r'417d9a13c8894f9b42ab818629a99ff729b4be46';

/// Provider for the entertainment prefill service.

@ProviderFor(entertainmentPrefillService)
const entertainmentPrefillServiceProvider =
    EntertainmentPrefillServiceProvider._();

/// Provider for the entertainment prefill service.

final class EntertainmentPrefillServiceProvider
    extends
        $FunctionalProvider<
          EntertainmentPrefillService,
          EntertainmentPrefillService,
          EntertainmentPrefillService
        >
    with $Provider<EntertainmentPrefillService> {
  /// Provider for the entertainment prefill service.
  const EntertainmentPrefillServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'entertainmentPrefillServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$entertainmentPrefillServiceHash();

  @$internal
  @override
  $ProviderElement<EntertainmentPrefillService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EntertainmentPrefillService create(Ref ref) {
    return entertainmentPrefillService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntertainmentPrefillService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntertainmentPrefillService>(value),
    );
  }
}

String _$entertainmentPrefillServiceHash() =>
    r'7de99b402ce7220ca7c2ab19c187e8ddd534a780';
