import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import '../application/itinerary_map_service.dart';
import '../domain/map_item.dart';
import '../../../core/domain/saved_item.dart';

class ItineraryMapScreen extends ConsumerWidget {
  const ItineraryMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapItemsAsync = ref.watch(itineraryMapServiceProvider);

    return mapItemsAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('No saved items to display on map.'));
        }

        // Calculate bounds to fit all markers
        final points = items
            .map((i) => LatLng(i.latitude, i.longitude))
            .toList();
        // Simple centering for MVP if only one point or close points
        final center = points.isNotEmpty
            ? points.first
            : const LatLng(48.8566, 2.3522);

        return FlutterMap(
          options: MapOptions(initialCenter: center, initialZoom: 10),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.dastan',
            ),
            MarkerLayer(
              markers: items
                  .map((item) => _buildMarker(context, item))
                  .toList(),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error loading map: $err')),
    );
  }

  Marker _buildMarker(BuildContext context, MapItem item) {
    return Marker(
      point: LatLng(item.latitude, item.longitude),
      width: 40,
      height: 40,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => _MapItemDetailSheet(item: item),
          );
        },
        child: Icon(
          Icons.location_on,
          color: _getColorForSection(item.type),
          size: 40,
        ),
      ),
    );
  }

  Color _getColorForSection(ItinerarySection section) {
    switch (section) {
      case ItinerarySection.transport:
        return Colors.blue;
      case ItinerarySection.accommodation:
        return Colors.purple;
      case ItinerarySection.entertainment:
        return Colors.red;
      case ItinerarySection.gastronomy:
        return Colors.orange;
      case ItinerarySection.events:
        return Colors.green;
      case ItinerarySection.trails:
        return Colors.brown;
    }
  }
}

class _MapItemDetailSheet extends StatelessWidget {
  final MapItem item;

  const _MapItemDetailSheet({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            item.type.name.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 8),
          if (item.description != null) Text(item.description!),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}
