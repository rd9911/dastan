// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the local settings repository (Drift-based).

@ProviderFor(settingsRepository)
const settingsRepositoryProvider = SettingsRepositoryProvider._();

/// Provider for the local settings repository (Drift-based).

final class SettingsRepositoryProvider
    extends
        $FunctionalProvider<
          SettingsRepository,
          SettingsRepository,
          SettingsRepository
        >
    with $Provider<SettingsRepository> {
  /// Provider for the local settings repository (Drift-based).
  const SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepository>(value),
    );
  }
}

String _$settingsRepositoryHash() =>
    r'1ec7d37896e47fdc8cef3e6f1f06c816fd25df52';

/// Provider for the Supabase profile sync service.

@ProviderFor(supabaseProfileService)
const supabaseProfileServiceProvider = SupabaseProfileServiceProvider._();

/// Provider for the Supabase profile sync service.

final class SupabaseProfileServiceProvider
    extends
        $FunctionalProvider<
          SupabaseProfileService,
          SupabaseProfileService,
          SupabaseProfileService
        >
    with $Provider<SupabaseProfileService> {
  /// Provider for the Supabase profile sync service.
  const SupabaseProfileServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseProfileServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseProfileServiceHash();

  @$internal
  @override
  $ProviderElement<SupabaseProfileService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseProfileService create(Ref ref) {
    return supabaseProfileService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseProfileService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseProfileService>(value),
    );
  }
}

String _$supabaseProfileServiceHash() =>
    r'cd2e2bb7f65a62ccac85715f1ddfd555c04979e2';
