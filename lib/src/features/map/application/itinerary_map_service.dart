import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/application/save_item_service.dart';
import '../../../core/domain/saved_item.dart';
import '../domain/map_item.dart';

part 'itinerary_map_service.g.dart';

@riverpod
class ItineraryMapService extends _$ItineraryMapService {
  @override
  Future<List<MapItem>> build() async {
    final savedItems = await ref.watch(savedItemsProvider.future);
    return _convertItemsToMapItems(savedItems);
  }

  List<MapItem> _convertItemsToMapItems(List<SavedItem> items) {
    return items.map((item) {
      final locationDescription = _extractLocationDescription(item);
      final coords = _getCoordinates(item, locationDescription);

      return MapItem(
        id: item.id,
        latitude: coords.$1,
        longitude: coords.$2,
        title: item.title,
        type: item.section,
        description: locationDescription,
      );
    }).toList();
  }

  String _extractLocationDescription(SavedItem item) {
    if (item.location != null && item.location!.name.isNotEmpty) {
      return item.location!.name;
    }
    final details = item.details;
    if (details.containsKey('location')) {
      return details['location'] as String;
    }
    if (details.containsKey('destination')) {
      return details['destination'] as String;
    }
    if (details.containsKey('origin')) {
      return details['origin'] as String; // Fallback for transport
    }
    return 'Unknown Location';
  }

  (double, double) _getCoordinates(SavedItem item, String locationDescription) {
    if (item.location != null &&
        (item.location!.lat != 0 || item.location!.lng != 0)) {
      return (item.location!.lat, item.location!.lng);
    }
    return _geocodeLocation(locationDescription);
  }

  // Mock geocoding for MVP
  (double, double) _geocodeLocation(String location) {
    final lowerLoc = location.toLowerCase();
    if (lowerLoc.contains('paris')) {
      return (48.8566, 2.3522);
    }
    if (lowerLoc.contains('london')) {
      return (51.5074, -0.1278);
    }
    if (lowerLoc.contains('new york') || lowerLoc.contains('nyc')) {
      return (40.7128, -74.0060);
    }
    if (lowerLoc.contains('los angeles') || lowerLoc.contains('lax')) {
      return (34.0522, -118.2437);
    }
    if (lowerLoc.contains('tokyo')) {
      return (35.6762, 139.6503);
    }
    if (lowerLoc.contains('dubai')) {
      return (25.2048, 55.2708);
    }
    if (lowerLoc.contains('singapore')) {
      return (1.3521, 103.8198);
    }

    // Default fallback (Null Islandish)
    return (0.0, 0.0);
  }
}
