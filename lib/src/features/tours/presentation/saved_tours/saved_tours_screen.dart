import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

class SavedToursScreen extends ConsumerWidget {
  const SavedToursScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clustersAsync = ref.watch(savedTourClustersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Tours'),
      ),
      body: clustersAsync.when(
        loading: () => const Center(key: Key('saved_loading'), child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (clusters) {
          if (clusters.isEmpty) {
            return const Center(child: Text('No saved tours yet'));
          }
          return ListView.builder(
            itemCount: clusters.length,
            itemBuilder: (context, index) {
              return CityClusterTile(cluster: clusters[index]);
            },
          );
        },
      ),
    );
  }
}

class CityClusterTile extends StatelessWidget {
  final SavedTourCluster cluster;
  const CityClusterTile({super.key, required this.cluster});

  @override
  Widget build(BuildContext context) {
    final tourCount = cluster.tours.length;
    return ListTile(
      title: Text(cluster.city.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$tourCount tour${tourCount == 1 ? '' : 's'} saved'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        context.push('/tours/saved/${cluster.city.id}');
      },
    );
  }
}
