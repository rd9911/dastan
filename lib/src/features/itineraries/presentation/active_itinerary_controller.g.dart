// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_itinerary_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveItineraryController)
const activeItineraryControllerProvider = ActiveItineraryControllerProvider._();

final class ActiveItineraryControllerProvider
    extends $AsyncNotifierProvider<ActiveItineraryController, Itinerary?> {
  const ActiveItineraryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeItineraryControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeItineraryControllerHash();

  @$internal
  @override
  ActiveItineraryController create() => ActiveItineraryController();
}

String _$activeItineraryControllerHash() =>
    r'afbc3d6345aeb96cfcc31a9a2dc57eb87b93ec46';

abstract class _$ActiveItineraryController extends $AsyncNotifier<Itinerary?> {
  FutureOr<Itinerary?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Itinerary?>, Itinerary?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Itinerary?>, Itinerary?>,
              AsyncValue<Itinerary?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
