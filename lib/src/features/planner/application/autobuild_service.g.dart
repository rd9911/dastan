// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autobuild_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AutoBuildService)
const autoBuildServiceProvider = AutoBuildServiceProvider._();

final class AutoBuildServiceProvider
    extends $NotifierProvider<AutoBuildService, void> {
  const AutoBuildServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoBuildServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoBuildServiceHash();

  @$internal
  @override
  AutoBuildService create() => AutoBuildService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$autoBuildServiceHash() => r'fcfe4bce7bc036474d0cfc98d55a4e2f68be2e6c';

abstract class _$AutoBuildService extends $Notifier<void> {
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
