import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/widgets/tour_category_chips.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/widgets/tour_list_card.dart';

class CityToursScreen extends ConsumerWidget {
  const CityToursScreen({
    super.key,
    required this.cityId,
  });

  final String cityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryAsync = ref.watch(countriesProvider);
    final toursAsync = ref.watch(filteredToursForCityProvider(cityId));

    String cityName = 'City';
    countryAsync.whenData((countries) {
      for (final country in countries) {
        for (final city in country.cities) {
          if (city.id == cityId) {
            cityName = city.name;
          }
        }
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('$cityName tours')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TourCategoryChips(),
          Expanded(
            child: toursAsync.when(
              loading: () => const Center(key: Key('city_tours_skeleton'), child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (tours) {
                if (tours.isEmpty) {
                  return const Center(child: Text('No tours available for this city yet.'));
                }
                return ListView.builder(
                  itemCount: tours.length,
                  itemBuilder: (context, index) {
                    final tour = tours[index];
                    return TourListCard(
                      tour: tour,
                      onTap: () {
                        context.push('/tours/city/$cityId/tour/${tour.id}');
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
