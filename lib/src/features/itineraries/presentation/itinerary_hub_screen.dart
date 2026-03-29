import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/itinerary_service.dart';
import 'active_itinerary_controller.dart';

class ItineraryHubScreen extends ConsumerWidget {
  const ItineraryHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itinerariesAsync = ref.watch(itinerariesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Itinerary Hub')),
      body: itinerariesAsync.when(
        data: (itineraries) {
          if (itineraries.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No itineraries yet.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.push('/create-itinerary'),
                    child: const Text('Create Itinerary'),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: itineraries.length,
            itemBuilder: (context, index) {
              final itinerary = itineraries[index];
              return ListTile(
                title: Text(itinerary.title),
                subtitle: Text(itinerary.destination ?? 'No destination'),
                onTap: () {
                  ref
                      .read(activeItineraryControllerProvider.notifier)
                      .setActiveItinerary(itinerary);
                  context.go('/itinerary/${itinerary.id}');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create-itinerary'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
