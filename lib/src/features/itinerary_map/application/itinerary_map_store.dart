import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/features/itineraries/presentation/active_itinerary_controller.dart';
import 'package:dastan/src/core/application/save_item_service.dart';
import 'package:dastan/src/features/itinerary_map/application/map_item_adapter.dart';
import 'package:dastan/src/features/itinerary_map/domain/map_models.dart';

part 'itinerary_map_store.g.dart';

@riverpod
class MapLayersController extends _$MapLayersController {
  @override
  Set<MapLayer> build() {
    return {
      MapLayer.transport,
      MapLayer.accommodation,
      MapLayer.entertainment,
      MapLayer.gastronomy,
      MapLayer.events,
      MapLayer.trails,
      MapLayer.photos,
    };
  }

  void toggle(MapLayer layer) {
    if (state.contains(layer)) {
      state = Set.from(state)..remove(layer);
    } else {
      state = Set.from(state)..add(layer);
    }
  }
}

@riverpod
class ItineraryMapStore extends _$ItineraryMapStore {
  @override
  MapState build() {
    final layers = ref.watch(mapLayersControllerProvider);
    final activeAsync = ref.watch(activeItineraryControllerProvider);

    // Default state
    var items = <MapItem>[];
    var isLoading = true;

    if (activeAsync.asData?.value != null) {
      final savedItemsAsync = ref.watch(savedItemsProvider);
      savedItemsAsync.whenData((saved) {
        final adapter = ref.read(mapItemAdapterProvider);
        final all = saved.map((i) => adapter.adapt(i)).toList();
        items = all
            .where((item) => layers.contains(_typeToLayer(item.type)))
            .toList();
        isLoading = false;
      });
      if (savedItemsAsync.isLoading) isLoading = true;
    } else {
      isLoading = false;
    }

    return MapState(items: items, visibleLayers: layers, isLoading: isLoading);
  }

  MapLayer _typeToLayer(MapItemType type) {
    switch (type) {
      case MapItemType.transport:
        return MapLayer.transport;
      case MapItemType.accommodation:
        return MapLayer.accommodation;
      case MapItemType.entertainment:
        return MapLayer.entertainment;
      case MapItemType.gastronomy:
        return MapLayer.gastronomy;
      case MapItemType.events:
        return MapLayer.events;
      case MapItemType.trails:
        return MapLayer.trails;
      case MapItemType.custom:
        return MapLayer.transport;
    }
  }
}
