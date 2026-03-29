import 'package:flutter/material.dart';
import 'package:dastan/src/features/itinerary_map/domain/map_models.dart';
import 'package:dastan/src/features/trails/application/external_map_launcher.dart';

class MapPinCard extends StatelessWidget {
  final MapItem item;
  final VoidCallback onDismiss;

  const MapPinCard({super.key, required this.item, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 8,
      child: ListTile(
        leading: Icon(_getIcon(item.type), color: _getColor(item.type)),
        title: Text(item.title),
        subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.directions),
              onPressed: () {
                ExternalMapLauncher.launchDirections(
                  lat: item.latitude,
                  lng: item.longitude,
                );
              },
            ),
            IconButton(icon: const Icon(Icons.close), onPressed: onDismiss),
          ],
        ),
      ),
    );
  }

  Color _getColor(MapItemType type) {
    switch (type) {
      case MapItemType.transport:
        return Colors.blue;
      case MapItemType.accommodation:
        return Colors.purple;
      case MapItemType.entertainment:
        return Colors.pink;
      case MapItemType.gastronomy:
        return Colors.orange;
      case MapItemType.events:
        return Colors.red;
      case MapItemType.trails:
        return Colors.green;
      case MapItemType.custom:
        return Colors.grey;
    }
  }

  IconData _getIcon(MapItemType type) {
    switch (type) {
      case MapItemType.transport:
        return Icons.flight;
      case MapItemType.accommodation:
        return Icons.hotel;
      case MapItemType.entertainment:
        return Icons.attractions;
      case MapItemType.gastronomy:
        return Icons.restaurant;
      case MapItemType.events:
        return Icons.event;
      case MapItemType.trails:
        return Icons.hiking;
      case MapItemType.custom:
        return Icons.place;
    }
  }
}
