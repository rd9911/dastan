// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the local offline repository (Drift-based).

@ProviderFor(offlineRepository)
const offlineRepositoryProvider = OfflineRepositoryProvider._();

/// Provider for the local offline repository (Drift-based).

final class OfflineRepositoryProvider
    extends
        $FunctionalProvider<
          OfflineRepository,
          OfflineRepository,
          OfflineRepository
        >
    with $Provider<OfflineRepository> {
  /// Provider for the local offline repository (Drift-based).
  const OfflineRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'offlineRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$offlineRepositoryHash();

  @$internal
  @override
  $ProviderElement<OfflineRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OfflineRepository create(Ref ref) {
    return offlineRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OfflineRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OfflineRepository>(value),
    );
  }
}

String _$offlineRepositoryHash() => r'08a8f9c1107127a28a676b1768cccd51617b1ffe';

/// Provider for the Supabase bundle metadata sync service.

@ProviderFor(supabaseBundleService)
const supabaseBundleServiceProvider = SupabaseBundleServiceProvider._();

/// Provider for the Supabase bundle metadata sync service.

final class SupabaseBundleServiceProvider
    extends
        $FunctionalProvider<
          SupabaseBundleService,
          SupabaseBundleService,
          SupabaseBundleService
        >
    with $Provider<SupabaseBundleService> {
  /// Provider for the Supabase bundle metadata sync service.
  const SupabaseBundleServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseBundleServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseBundleServiceHash();

  @$internal
  @override
  $ProviderElement<SupabaseBundleService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseBundleService create(Ref ref) {
    return supabaseBundleService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseBundleService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseBundleService>(value),
    );
  }
}

String _$supabaseBundleServiceHash() =>
    r'34a75d9069aa7c09b279fd9008e5bea4039d7a79';
