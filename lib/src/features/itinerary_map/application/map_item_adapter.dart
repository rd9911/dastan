import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/itinerary_map/domain/map_models.dart';

part 'map_item_adapter.g.dart';

/// Adapts [SavedItem] to [MapItem].
class MapItemAdapter {
  MapItem adapt(SavedItem item) {
    // Default location (should hold, but if null use 0,0 or filter out)
    final lat = item.location?.lat ?? 0.0;
    final lng = item.location?.lng ?? 0.0;

    return MapItem(
      id: item.id,
      type: _mapSectionToType(item.section),
      latitude: lat,
      longitude: lng,
      title: item.title,
      subtitle: item.location?.name,
      dedupeKey: item.dedupeKey,
    );
  }

  MapItemType _mapSectionToType(ItinerarySection section) {
    switch (section) {
      case ItinerarySection.transport:
        return MapItemType.transport;
      case ItinerarySection.accommodation:
        return MapItemType.accommodation;
      case ItinerarySection.entertainment:
        return MapItemType.entertainment;
      case ItinerarySection.gastronomy:
        return MapItemType.gastronomy;
      case ItinerarySection.events:
        return MapItemType.events;
      case ItinerarySection.trails:
        return MapItemType.trails;
    }
  }
}

@riverpod
MapItemAdapter mapItemAdapter(Ref ref) {
  return MapItemAdapter();
}
