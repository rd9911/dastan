// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransportSearchController)
const transportSearchControllerProvider = TransportSearchControllerFamily._();

final class TransportSearchControllerProvider
    extends
        $NotifierProvider<
          TransportSearchController,
          AsyncValue<List<TransportResult>>
        > {
  const TransportSearchControllerProvider._({
    required TransportSearchControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'transportSearchControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transportSearchControllerHash();

  @override
  String toString() {
    return r'transportSearchControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TransportSearchController create() => TransportSearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<TransportResult>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<TransportResult>>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TransportSearchControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transportSearchControllerHash() =>
    r'cb4dc3a961240c1534d0ec0a9d5120bc2be8bee3';

final class TransportSearchControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          TransportSearchController,
          AsyncValue<List<TransportResult>>,
          AsyncValue<List<TransportResult>>,
          AsyncValue<List<TransportResult>>,
          int
        > {
  const TransportSearchControllerFamily._()
    : super(
        retry: null,
        name: r'transportSearchControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransportSearchControllerProvider call(int tabIndex) =>
      TransportSearchControllerProvider._(argument: tabIndex, from: this);

  @override
  String toString() => r'transportSearchControllerProvider';
}

abstract class _$TransportSearchController
    extends $Notifier<AsyncValue<List<TransportResult>>> {
  late final _$args = ref.$arg as int;
  int get tabIndex => _$args;

  AsyncValue<List<TransportResult>> build(int tabIndex);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<TransportResult>>,
              AsyncValue<List<TransportResult>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<TransportResult>>,
                AsyncValue<List<TransportResult>>
              >,
              AsyncValue<List<TransportResult>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
