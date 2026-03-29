import 'package:flutter/material.dart';
import 'package:dastan/src/features/itinerary_map/domain/map_models.dart';

class MapListPane extends StatelessWidget {
  final List<MapItem> items;
  final ScrollController scrollController;

  const MapListPane({
    super.key,
    required this.items,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        children: const [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('No visible items'),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: items.length + 1, // +1 for header
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          );
        }

        final item = items[index - 1];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: _getColor(item.type).withValues(alpha: 0.1),
            child: Icon(
              _getIcon(item.type),
              color: _getColor(item.type),
              size: 16,
            ),
          ),
          title: Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Should highlight pin on map
          },
        );
      },
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
