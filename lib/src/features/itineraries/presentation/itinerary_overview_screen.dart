import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'active_itinerary_controller.dart';
import '../../../core/application/save_item_service.dart';
import '../../../core/domain/saved_item.dart';
import '../../../core/presentation/save_button.dart';
import '../../map/presentation/itinerary_map_screen.dart';
import '../data/itinerary_repository.dart';
import '../../collab/presentation/manage_access_screen.dart';
import '../../collab/presentation/invite_dialog.dart';

import '../../planner/presentation/planner_screen.dart';

class ItineraryOverviewScreen extends ConsumerWidget {
  const ItineraryOverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeItineraryAsync = ref.watch(activeItineraryControllerProvider);

    return activeItineraryAsync.when(
      data: (activeItinerary) {
        if (activeItinerary == null) {
          return const Scaffold(
            body: Center(child: Text('No active itinerary')),
          );
        }

        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text(activeItinerary.title),
              actions: [
                // Collaboration button
                IconButton(
                  icon: const Icon(Icons.group),
                  tooltip: 'Manage Collaborators',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            ManageAccessScreen(itineraryId: activeItinerary.id),
                      ),
                    );
                  },
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      context.push('/create-itinerary', extra: activeItinerary);
                    } else if (value == 'delete') {
                      _showDeleteConfirmation(context, ref, activeItinerary.id);
                    } else if (value == 'invite') {
                      InviteDialog.show(context, activeItinerary.id);
                    } else if (value == 'manage_access') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ManageAccessScreen(
                            itineraryId: activeItinerary.id,
                          ),
                        ),
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'edit', child: Text('Edit')),
                    const PopupMenuItem(
                      value: 'invite',
                      child: ListTile(
                        leading: Icon(Icons.person_add),
                        title: Text('Invite'),
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'manage_access',
                      child: ListTile(
                        leading: Icon(Icons.group),
                        title: Text('Manage Access'),
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                ),
              ],
              bottom: const TabBar(
                isScrollable: false,
                labelStyle: TextStyle(fontSize: 13),
                tabs: [
                  Tab(text: 'Overview'),
                  Tab(text: 'Planner'),
                  Tab(text: 'Saved'),
                  Tab(text: 'Search'),
                ],
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _OverviewTab(),
                const PlannerScreen(),
                _SavedItemsTab(),
                _SearchTab(),
              ],
            ),
          ),
        );
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    String itineraryId,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Itinerary?'),
        content: const Text(
          'Are you sure you want to delete this itinerary? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await ref.read(itineraryRepositoryProvider).deleteItinerary(itineraryId);
      if (context.mounted) {
        // Clear active itinerary and go back or home
        ref
            .read(activeItineraryControllerProvider.notifier)
            .setActiveItinerary(null);
        Navigator.of(context).pop(); // Pop current screen
      }
    }
  }
}

class _OverviewTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Itinerary Map')),
                      body: const ItineraryMapScreen(),
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const IgnorePointer(child: ItineraryMapScreen()),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Tap to expand',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(child: Text('Overview Content')),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              // Demo: Save a test item
              await ref
                  .read(saveItemServiceProvider)
                  .saveItem(
                    section: ItinerarySection.transport,
                    dedupeKey:
                        'demo-flight-${DateTime.now().millisecondsSinceEpoch}',
                    title: 'Demo Flight',
                    details: {'price': 299.99},
                  );
            },
            child: const Text('Save Demo Item'),
          ),
        ],
      ),
    );
  }
}

class _SavedItemsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedItemsAsync = ref.watch(savedItemsProvider);

    return savedItemsAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('No saved items yet.'));
        }
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.title),
              subtitle: Text(
                '${item.section.name.toUpperCase()} - ${item.dedupeKey}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref.read(saveItemServiceProvider).unsaveItem(item.id);
                },
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

class _SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      children: [
        _SearchCard(
          title: 'Transport',
          icon: Icons.flight,
          section: ItinerarySection.transport,
        ),
        _SearchCard(
          title: 'Accommodation',
          icon: Icons.hotel,
          section: ItinerarySection.accommodation,
        ),
        _SearchCard(
          title: 'Entertainment',
          icon: Icons.theater_comedy,
          section: ItinerarySection.entertainment,
        ),
        _SearchCard(
          title: 'Gastronomy',
          icon: Icons.restaurant,
          section: ItinerarySection.gastronomy,
        ),
        _SearchCard(
          title: 'Events',
          icon: Icons.event,
          section: ItinerarySection.events,
        ),
        _SearchCard(
          title: 'Trails',
          icon: Icons.hiking,
          section: ItinerarySection.trails,
        ),
      ],
    );
  }
}

class _SearchCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final ItinerarySection section;

  const _SearchCard({
    required this.title,
    required this.icon,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          if (section == ItinerarySection.transport) {
            context.push('/search/transport');
          } else if (section == ItinerarySection.accommodation) {
            context.push('/search/accommodation');
          } else if (section == ItinerarySection.entertainment) {
            context.push('/search/entertainment');
          } else if (section == ItinerarySection.gastronomy) {
            context.push('/search/gastronomy');
          } else if (section == ItinerarySection.events) {
            context.push('/search/events');
          } else if (section == ItinerarySection.trails) {
            context.push('/search/trails');
          } else {
            // Fallback
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title search - Coming soon')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48),
              const SizedBox(height: 8),
              Text(title, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              // Demo save button for this category
              SaveButton(
                section: section,
                dedupeKey:
                    'demo-${section.name}-${DateTime.now().millisecondsSinceEpoch}',
                title: 'Demo $title Item',
                details: {
                  'type': section.name,
                  'added_at': DateTime.now().toIso8601String(),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
