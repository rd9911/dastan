import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../itineraries/presentation/active_itinerary_controller.dart';
import '../application/itinerary_map_service.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeItinerary = ref.watch(activeItineraryControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: activeItinerary.when(
        data: (itinerary) {
          if (itinerary == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.map, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'No Active Itinerary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Create or select an itinerary to view on map',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Itinerary tab (index 0)
                      context.go('/');
                    },
                    child: const Text('Go to Itineraries'),
                  ),
                ],
              ),
            );
          }
          return _MapView();
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _MapView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapItemsAsync = ref.watch(itineraryMapServiceProvider);

    return mapItemsAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_off, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                const Text(
                  'No saved items to display',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Add items from search to see them on the map',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        // Calculate center and zoom based on items
        final center = items.isNotEmpty
            ? LatLng(items.first.latitude, items.first.longitude)
            : LatLng(48.8566, 2.3522); // Default to Paris

        return FlutterMap(
          options: MapOptions(initialCenter: center, initialZoom: 12.0),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.dastan',
            ),
            MarkerLayer(
              markers: items.map((item) {
                return Marker(
                  point: LatLng(item.latitude, item.longitude),
                  width: 40,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              if (item.description != null)
                                Text(item.description!),
                              const SizedBox(height: 8),
                              Text(
                                'Type: ${item.type.name}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.location_pin,
                      color: _getColorForSection(item.type),
                      size: 40,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error loading map: $err')),
    );
  }

  Color _getColorForSection(section) {
    switch (section.toString().split('.').last) {
      case 'transport':
        return Colors.blue;
      case 'accommodation':
        return Colors.green;
      case 'entertainment':
        return Colors.purple;
      case 'gastronomy':
        return Colors.orange;
      case 'events':
        return Colors.red;
      case 'trails':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }
}
