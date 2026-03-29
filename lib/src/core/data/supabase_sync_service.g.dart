// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_sync_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Service to handle synchronization between local Drift database and Supabase.
///
/// This is a basic implementation that can be expanded with conflict resolution.

@ProviderFor(SupabaseSyncService)
const supabaseSyncServiceProvider = SupabaseSyncServiceProvider._();

/// Service to handle synchronization between local Drift database and Supabase.
///
/// This is a basic implementation that can be expanded with conflict resolution.
final class SupabaseSyncServiceProvider
    extends $NotifierProvider<SupabaseSyncService, void> {
  /// Service to handle synchronization between local Drift database and Supabase.
  ///
  /// This is a basic implementation that can be expanded with conflict resolution.
  const SupabaseSyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseSyncServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseSyncServiceHash();

  @$internal
  @override
  SupabaseSyncService create() => SupabaseSyncService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$supabaseSyncServiceHash() =>
    r'4a97707d9a7f585b9f9973cce15d3f03f915db31';

/// Service to handle synchronization between local Drift database and Supabase.
///
/// This is a basic implementation that can be expanded with conflict resolution.

abstract class _$SupabaseSyncService extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
