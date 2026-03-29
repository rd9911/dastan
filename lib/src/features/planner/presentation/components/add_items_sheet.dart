import 'package:flutter/material.dart';
import '../../../../core/domain/saved_item.dart';
import '../../domain/planner_models.dart';

class AddItemsSheet extends StatelessWidget {
  final List<SavedItem> allItems;
  final List<DayPlanEntry> currentPlanEntries;
  final ValueChanged<SavedItem> onAdd;

  const AddItemsSheet({
    super.key,
    required this.allItems,
    required this.currentPlanEntries,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    // Filter out items that are already in the plan
    final usedIds = currentPlanEntries
        .map((e) => e.savedItemId)
        .whereType<String>()
        .toSet();

    final availableItems = allItems
        .where((i) => !usedIds.contains(i.id))
        .toList();

    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            AppBar(
              title: const Text('Add to Plan'),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            if (availableItems.isEmpty)
              const Expanded(
                child: Center(child: Text('No more items to add!')),
              )
            else
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: availableItems.length,
                  itemBuilder: (context, index) {
                    final item = availableItems[index];
                    return ListTile(
                      leading: _getIconForSection(item.section),
                      title: Text(item.title),
                      subtitle: Text(item.section.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => onAdd(item),
                      ),
                      onTap: () => onAdd(item),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }

  Icon _getIconForSection(ItinerarySection section) {
    switch (section) {
      case ItinerarySection.transport:
        return const Icon(Icons.flight);
      case ItinerarySection.accommodation:
        return const Icon(Icons.hotel);
      case ItinerarySection.entertainment:
        return const Icon(Icons.theater_comedy);
      case ItinerarySection.gastronomy:
        return const Icon(Icons.restaurant);
      case ItinerarySection.events:
        return const Icon(Icons.event);
      case ItinerarySection.trails:
        return const Icon(Icons.hiking);
    }
  }
}
