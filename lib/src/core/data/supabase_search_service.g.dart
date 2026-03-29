// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_search_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SupabaseSearchService)
const supabaseSearchServiceProvider = SupabaseSearchServiceProvider._();

final class SupabaseSearchServiceProvider
    extends $NotifierProvider<SupabaseSearchService, void> {
  const SupabaseSearchServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseSearchServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseSearchServiceHash();

  @$internal
  @override
  SupabaseSearchService create() => SupabaseSearchService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$supabaseSearchServiceHash() =>
    r'609fbb52a4d54f0f914a18555e0fd78fc3cba2a1';

abstract class _$SupabaseSearchService extends $Notifier<void> {
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
