// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_map_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapLayersController)
const mapLayersControllerProvider = MapLayersControllerProvider._();

final class MapLayersControllerProvider
    extends $NotifierProvider<MapLayersController, Set<MapLayer>> {
  const MapLayersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapLayersControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapLayersControllerHash();

  @$internal
  @override
  MapLayersController create() => MapLayersController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<MapLayer> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<MapLayer>>(value),
    );
  }
}

String _$mapLayersControllerHash() =>
    r'5225ddc4a6627d93c03037f83254d458e3b60269';

abstract class _$MapLayersController extends $Notifier<Set<MapLayer>> {
  Set<MapLayer> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<MapLayer>, Set<MapLayer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<MapLayer>, Set<MapLayer>>,
              Set<MapLayer>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ItineraryMapStore)
const itineraryMapStoreProvider = ItineraryMapStoreProvider._();

final class ItineraryMapStoreProvider
    extends $NotifierProvider<ItineraryMapStore, MapState> {
  const ItineraryMapStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itineraryMapStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itineraryMapStoreHash();

  @$internal
  @override
  ItineraryMapStore create() => ItineraryMapStore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapState>(value),
    );
  }
}

String _$itineraryMapStoreHash() => r'dad182c91b74de257b8d65f5596b3101d92fbd00';

abstract class _$ItineraryMapStore extends $Notifier<MapState> {
  MapState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MapState, MapState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapState, MapState>,
              MapState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
