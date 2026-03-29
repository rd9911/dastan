import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/widgets/tour_list_card.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';

class NearbyToursSection extends ConsumerStatefulWidget {
  final List<City> cities;
  const NearbyToursSection({super.key, required this.cities});

  @override
  ConsumerState<NearbyToursSection> createState() => _NearbyToursSectionState();
}

class _NearbyToursSectionState extends ConsumerState<NearbyToursSection> {
  List<TourSummary>? _nearbyTours;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNearby();
  }

  Future<void> _loadNearby() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }
      if (permission == LocationPermission.deniedForever) return;

      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      
      final sortedCities = List<City>.from(widget.cities);
      sortedCities.sort((a, b) {
        if (a.latitude == null || a.longitude == null) return 1;
        if (b.latitude == null || b.longitude == null) return -1;
        final distA = Geolocator.distanceBetween(position.latitude, position.longitude, a.latitude!, a.longitude!);
        final distB = Geolocator.distanceBetween(position.latitude, position.longitude, b.latitude!, b.longitude!);
        return distA.compareTo(distB);
      });

      final nearestCities = sortedCities.take(2).toList();
      final allTours = <TourSummary>[];
      
      for (final city in nearestCities) {
        final cityTours = await ref.read(toursForCityProvider(city.id).future);
        allTours.addAll(cityTours);
      }
      
      if (mounted) {
        setState(() {
          _nearbyTours = allTours.take(3).toList();
        });
      }
    } catch (e) {
      // Handle error natively if needed
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_nearbyTours == null || _nearbyTours!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Text('Tours Near You', style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: _nearbyTours!.length,
            itemBuilder: (context, index) {
              final tour = _nearbyTours![index];
              return SizedBox(
                width: 300,
                child: TourListCard(
                  tour: tour,
                  onTap: () => context.pushNamed(
                    'tourDetail',
                    pathParameters: {'cityId': tour.cityId, 'tourId': tour.id},
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
