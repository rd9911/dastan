import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/core/presentation/widgets/active_itinerary_guard.dart';
import 'package:dastan/src/features/itinerary_map/application/itinerary_map_store.dart';
import 'package:dastan/src/features/itinerary_map/domain/map_models.dart';
import 'package:dastan/src/features/itinerary_map/presentation/map_list_pane.dart';
import 'package:dastan/src/features/itinerary_map/presentation/snapshot_wizard_screen.dart';

class ItineraryMapScreen extends ConsumerStatefulWidget {
  const ItineraryMapScreen({super.key});

  @override
  ConsumerState<ItineraryMapScreen> createState() => _ItineraryMapScreenState();
}

class _ItineraryMapScreenState extends ConsumerState<ItineraryMapScreen> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    // Basic implementation: Stack with Map + Floating Chips + Draggable List Sheet/Split View
    // For MVP, we'll use a simplified interactive viewer to simulate a map if we don't include google_maps_flutter yet,
    // but typically we would use google_maps_flutter or flutter_map.
    // Assuming google_maps_flutter is desired but maybe not added to pubspec yet.
    // I will implement a placeholder "Map" widget that draws points on a canvas for now,
    // or checks for package availability.
    // The prompt says "map-first", "clustered pins".

    // I'll stick to a "Mock Map" visualization for simplicity unless instructed to add a package.
    // Actually, `flutter_map` (OpenStreetMap) is often easier to setup without keys.
    // For now, I'll build the UI shell.

    final mapState = ref.watch(itineraryMapStoreProvider);

    return ActiveItineraryGuard(
      builder: (context, itinerary) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${itinerary.title} Map'),
            actions: [
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // Open snapshot wizard
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          SnapshotWizardScreen(mapState: mapState),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              // Map Layer
              Positioned.fill(child: _buildMapCanvas(mapState)),

              // Filter Chips
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: _buildLayerChips(),
              ),

              // Bottom List Pane (Parity)
              // We can use DraggableScrollableSheet
              DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.1,
                maxChildSize: 0.6,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withValues(alpha: 0.1),
                        ),
                      ],
                    ),
                    child: MapListPane(
                      items: mapState.items,
                      scrollController: scrollController,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMapCanvas(MapState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Placeholder for actual map widget
    return InteractiveViewer(
      transformationController: _transformationController,
      maxScale: 10.0,
      child: Container(
        color: Colors.blue[50],
        child: Stack(
          children: state.items.map((item) {
            // Simple projection for demo: clamp roughly
            // Real implementation would use GoogleMap or FlutterMap
            return Positioned(
              left: (item.longitude + 180) * 2, // Dummy projection
              top: (90 - item.latitude) * 2,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(item.title)));
                },
                child: Icon(Icons.location_on, color: _getColor(item.type)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildLayerChips() {
    final layers = ref.watch(mapLayersControllerProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: MapLayer.values.where((l) => l != MapLayer.photos).map((
          layer,
        ) {
          final isSelected = layers.contains(layer);
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(layer.name.toUpperCase()),
              selected: isSelected,
              onSelected: (_) =>
                  ref.read(mapLayersControllerProvider.notifier).toggle(layer),
              visualDensity: VisualDensity.compact,
            ),
          );
        }).toList(),
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
}
