import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/domain/saved_item.dart';
import '../../itineraries/presentation/active_itinerary_controller.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeItinerary = ref.watch(activeItineraryControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: activeItinerary.when(
        data: (itinerary) {
          if (itinerary == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.luggage, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'No Active Itinerary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Create or select an itinerary to start searching',
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
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                'Search for ${itinerary.title}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              _SearchCard(
                icon: Icons.flight,
                title: 'Transport',
                subtitle: 'Flights, trains, buses',
                section: ItinerarySection.transport,
                onTap: () => context.push('/search/transport'),
              ),
              _SearchCard(
                icon: Icons.hotel,
                title: 'Accommodation',
                subtitle: 'Hotels, hostels, apartments',
                section: ItinerarySection.accommodation,
                onTap: () => context.push('/search/accommodation'),
              ),
              _SearchCard(
                icon: Icons.theater_comedy,
                title: 'Entertainment',
                subtitle: 'Museums, shows, attractions',
                section: ItinerarySection.entertainment,
                onTap: () => context.push('/search/entertainment'),
              ),
              _SearchCard(
                icon: Icons.restaurant,
                title: 'Gastronomy',
                subtitle: 'Restaurants, cafes, food tours',
                section: ItinerarySection.gastronomy,
                onTap: () => context.push('/search/gastronomy'),
              ),
              _SearchCard(
                icon: Icons.event,
                title: 'Events',
                subtitle: 'Concerts, festivals, sports',
                section: ItinerarySection.events,
                onTap: () => context.push('/search/events'),
              ),
              _SearchCard(
                icon: Icons.hiking,
                title: 'Trails',
                subtitle: 'Hiking, biking, walking routes',
                section: ItinerarySection.trails,
                onTap: () => context.push('/search/trails'),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _SearchCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final ItinerarySection section;
  final VoidCallback onTap;

  const _SearchCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.section,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
