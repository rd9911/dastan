// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SupabaseAuthService)
const supabaseAuthServiceProvider = SupabaseAuthServiceProvider._();

final class SupabaseAuthServiceProvider
    extends $StreamNotifierProvider<SupabaseAuthService, AuthState> {
  const SupabaseAuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseAuthServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseAuthServiceHash();

  @$internal
  @override
  SupabaseAuthService create() => SupabaseAuthService();
}

String _$supabaseAuthServiceHash() =>
    r'09241aca43afeac32e42357a4894939dcb5cbbae';

abstract class _$SupabaseAuthService extends $StreamNotifier<AuthState> {
  Stream<AuthState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AuthState>, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthState>, AuthState>,
              AsyncValue<AuthState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
