// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the Drift database instance.

@ProviderFor(transportDatabase)
const transportDatabaseProvider = TransportDatabaseProvider._();

/// Provider for the Drift database instance.

final class TransportDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// Provider for the Drift database instance.
  const TransportDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transportDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transportDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return transportDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$transportDatabaseHash() => r'9b9b3a7a2912b59c9e89496b45fe5ca57e3d9b8d';

/// Provider for the transport repository.
///
/// Returns a [CachingTransportRepository] wrapping a [MockTransportRepository].
/// In a real app, Mock would be replaced by RealTransportRepository based on flavor/env.

@ProviderFor(transportRepository)
const transportRepositoryProvider = TransportRepositoryProvider._();

/// Provider for the transport repository.
///
/// Returns a [CachingTransportRepository] wrapping a [MockTransportRepository].
/// In a real app, Mock would be replaced by RealTransportRepository based on flavor/env.

final class TransportRepositoryProvider
    extends
        $FunctionalProvider<
          TransportRepository,
          TransportRepository,
          TransportRepository
        >
    with $Provider<TransportRepository> {
  /// Provider for the transport repository.
  ///
  /// Returns a [CachingTransportRepository] wrapping a [MockTransportRepository].
  /// In a real app, Mock would be replaced by RealTransportRepository based on flavor/env.
  const TransportRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transportRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transportRepositoryHash();

  @$internal
  @override
  $ProviderElement<TransportRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransportRepository create(Ref ref) {
    return transportRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransportRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransportRepository>(value),
    );
  }
}

String _$transportRepositoryHash() =>
    r'564f508e71221af086b2dba29cfb96a91e7d5eb8';
