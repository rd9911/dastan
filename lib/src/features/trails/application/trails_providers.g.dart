// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trails_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(trailsDatabase)
const trailsDatabaseProvider = TrailsDatabaseProvider._();

final class TrailsDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  const TrailsDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trailsDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trailsDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return trailsDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$trailsDatabaseHash() => r'08186956a979edc000a937c79353661fbe5c47c3';

/// Provider for the trails repository.
/// Integrates with the unified Search Platform.

@ProviderFor(trailsRepository)
const trailsRepositoryProvider = TrailsRepositoryProvider._();

/// Provider for the trails repository.
/// Integrates with the unified Search Platform.

final class TrailsRepositoryProvider
    extends
        $FunctionalProvider<
          TrailsRepository,
          TrailsRepository,
          TrailsRepository
        >
    with $Provider<TrailsRepository> {
  /// Provider for the trails repository.
  /// Integrates with the unified Search Platform.
  const TrailsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trailsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trailsRepositoryHash();

  @$internal
  @override
  $ProviderElement<TrailsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TrailsRepository create(Ref ref) {
    return trailsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrailsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrailsRepository>(value),
    );
  }
}

String _$trailsRepositoryHash() => r'719601578ce7074dcb6356f0f7065f6da03828d6';

@ProviderFor(trailsPrefillService)
const trailsPrefillServiceProvider = TrailsPrefillServiceProvider._();

final class TrailsPrefillServiceProvider
    extends
        $FunctionalProvider<
          TrailsPrefillService,
          TrailsPrefillService,
          TrailsPrefillService
        >
    with $Provider<TrailsPrefillService> {
  const TrailsPrefillServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trailsPrefillServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trailsPrefillServiceHash();

  @$internal
  @override
  $ProviderElement<TrailsPrefillService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrailsPrefillService create(Ref ref) {
    return trailsPrefillService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrailsPrefillService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrailsPrefillService>(value),
    );
  }
}

String _$trailsPrefillServiceHash() =>
    r'0cf1c3e664d876f1952ad469bf141c2e57f7cb9e';
