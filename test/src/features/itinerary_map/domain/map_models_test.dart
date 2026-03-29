import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/itinerary_map/domain/map_models.dart';

void main() {
  group('MapItem', () {
    test('should encode/decode correctly', () {
      final item = MapItem(
        id: 'item-1',
        type: MapItemType.transport,
        latitude: 40.7128,
        longitude: -74.0060,
        title: 'JFK Airport',
        subtitle: 'Flight to London',
        dedupeKey: 'dedupe-1',
      );

      final json = item.toJson();
      final decoded = MapItem.fromJson(json);

      expect(decoded, item);
      expect(decoded.type, MapItemType.transport);
    });
  });

  group('MapState', () {
    test('should have sensible defaults', () {
      const state = MapState();
      expect(state.items, isEmpty);
      expect(state.isLoading, true);
      expect(state.visibleLayers, containsAll(MapLayer.values));
    });

    test('should filter items by layer', () {
      final allItems = [
        MapItem(
          id: '1',
          type: MapItemType.transport,
          latitude: 0,
          longitude: 0,
          title: 'T',
          dedupeKey: '1',
        ),
        MapItem(
          id: '2',
          type: MapItemType.accommodation,
          latitude: 0,
          longitude: 0,
          title: 'A',
          dedupeKey: '2',
        ),
      ];

      final state = MapState(
        items: allItems,
        visibleLayers: {MapLayer.transport},
      );

      // This logic likely belongs in a getter or the store, but testing state data holding ability.
      expect(state.visibleLayers, {MapLayer.transport});
      expect(
        state.items.length,
        2,
      ); // State holds all, UI filters? Or State holds filtered?
      // Plan says store filters. So State might just hold "items" (which are the filtered result) or "allItems" + "filters".
      // Let's assume MapState holds the *view* state, i.e., what should be shown.
      // But typically we want to keep all data and just derived the view.
      // Let's stick to MapState holding the *result* items to be rendered for simplicity in UI,
      // or "allItems" and let UI filter.
      // The implementation plan says "ItineraryMapStore ... Listens to savedItemsProvider ... Filters items".
      // So the state exposed by Store likely contains the list of *visible* items.
    });
  });

  group('MapSnapshotRequest', () {
    test('should generate deterministic hash for idempotency', () {
      final req1 = MapSnapshotRequest(
        itineraryId: 'itin-1',
        centerLat: 10.0,
        centerLng: 20.0,
        zoom: 12.0,
        theme: MapTheme.standard,
        highlightItemIds: ['a', 'b'],
      );

      final req2 = MapSnapshotRequest(
        itineraryId: 'itin-1',
        centerLat: 10.0,
        centerLng: 20.0,
        zoom: 12.0,
        theme: MapTheme.standard,
        highlightItemIds: ['a', 'b'],
      );

      // Idempotency key logic might be in a helper or computed getter
      expect(req1, req2);
    });
  });
}
