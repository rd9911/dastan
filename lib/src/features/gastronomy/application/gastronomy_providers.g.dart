// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gastronomy_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the gastronomy database DAO.

@ProviderFor(gastronomyDatabase)
const gastronomyDatabaseProvider = GastronomyDatabaseProvider._();

/// Provider for the gastronomy database DAO.

final class GastronomyDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// Provider for the gastronomy database DAO.
  const GastronomyDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gastronomyDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gastronomyDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return gastronomyDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$gastronomyDatabaseHash() =>
    r'b26e4ed5f658656a02da5cb975e9c37f56b0d18b';

/// Provider for the gastronomy repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.

@ProviderFor(gastronomyRepository)
const gastronomyRepositoryProvider = GastronomyRepositoryProvider._();

/// Provider for the gastronomy repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.

final class GastronomyRepositoryProvider
    extends
        $FunctionalProvider<
          GastronomyRepository,
          GastronomyRepository,
          GastronomyRepository
        >
    with $Provider<GastronomyRepository> {
  /// Provider for the gastronomy repository.
  ///
  /// Returns a caching repository wrapping the mock implementation.
  /// Integrates with the unified Search Platform.
  const GastronomyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gastronomyRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gastronomyRepositoryHash();

  @$internal
  @override
  $ProviderElement<GastronomyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GastronomyRepository create(Ref ref) {
    return gastronomyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GastronomyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GastronomyRepository>(value),
    );
  }
}

String _$gastronomyRepositoryHash() =>
    r'0e3346d55091906b415c107829764e99d84e8d41';

/// Provider for the gastronomy prefill service.

@ProviderFor(gastronomyPrefillService)
const gastronomyPrefillServiceProvider = GastronomyPrefillServiceProvider._();

/// Provider for the gastronomy prefill service.

final class GastronomyPrefillServiceProvider
    extends
        $FunctionalProvider<
          GastronomyPrefillService,
          GastronomyPrefillService,
          GastronomyPrefillService
        >
    with $Provider<GastronomyPrefillService> {
  /// Provider for the gastronomy prefill service.
  const GastronomyPrefillServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gastronomyPrefillServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gastronomyPrefillServiceHash();

  @$internal
  @override
  $ProviderElement<GastronomyPrefillService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GastronomyPrefillService create(Ref ref) {
    return gastronomyPrefillService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GastronomyPrefillService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GastronomyPrefillService>(value),
    );
  }
}

String _$gastronomyPrefillServiceHash() =>
    r'c7d6d7ad3411650f54286f14c0d7d8f5370e1e78';
