// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eta_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EtaService)
const etaServiceProvider = EtaServiceProvider._();

final class EtaServiceProvider extends $NotifierProvider<EtaService, void> {
  const EtaServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'etaServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$etaServiceHash();

  @$internal
  @override
  EtaService create() => EtaService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$etaServiceHash() => r'17ad168de547afa1f9047729a1c5aa6ab54f8656';

abstract class _$EtaService extends $Notifier<void> {
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
