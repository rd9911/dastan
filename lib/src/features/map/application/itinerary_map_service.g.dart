// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_map_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItineraryMapService)
const itineraryMapServiceProvider = ItineraryMapServiceProvider._();

final class ItineraryMapServiceProvider
    extends $AsyncNotifierProvider<ItineraryMapService, List<MapItem>> {
  const ItineraryMapServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itineraryMapServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itineraryMapServiceHash();

  @$internal
  @override
  ItineraryMapService create() => ItineraryMapService();
}

String _$itineraryMapServiceHash() =>
    r'555d634a5e9277ae9f81b8e9221a1970c2025122';

abstract class _$ItineraryMapService extends $AsyncNotifier<List<MapItem>> {
  FutureOr<List<MapItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<MapItem>>, List<MapItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MapItem>>, List<MapItem>>,
              AsyncValue<List<MapItem>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
