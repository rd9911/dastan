import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/widgets/tour_list_card.dart';

class SavedCityToursScreen extends ConsumerWidget {
  final String cityId;

  const SavedCityToursScreen({super.key, required this.cityId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clustersAsync = ref.watch(savedTourClustersProvider);

    return Scaffold(
      appBar: AppBar(title: Text(cityId)), // Ideally the real city name
      body: clustersAsync.when(
        loading: () => const Center(key: Key('saved_city_loading'), child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (clusters) {
          final cluster = clusters.where((c) => c.city.id == cityId).firstOrNull;

          if (cluster == null || cluster.tours.isEmpty) {
            return const Center(child: Text('No tours found for this city.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: cluster.tours.length,
            itemBuilder: (context, index) {
              final savedTour = cluster.tours[index];
              if (savedTour.tourSummary == null) return const SizedBox.shrink();

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TourListCard(
                  tour: savedTour.tourSummary!,
                  heroTagPrefix: 'saved',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
