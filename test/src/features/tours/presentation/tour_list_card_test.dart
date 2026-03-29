import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/widgets/tour_list_card.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

void main() {
  group('TourListCard', () {
    final mockTour = TourSummary(
      id: 't1',
      cityId: 'c1',
      type: TourType.single,
      name: 'Colosseum Audio Guide',
      tagline: 'Step back in time',
      mainImageUrl: 'https://example.com/tour.jpg',
      durationMinutes: 90,
      priceUsd: 14.50,
      isFree: false,
      averageRating: 4.9,
      reviewCount: 300,
      categories: [const TourCategory(id: 'cat1', name: 'Landmarks')],
    );

    testWidgets('renders tour details correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TourListCard(tour: mockTour),
          ),
        ),
      );

      expect(find.text('Colosseum Audio Guide'), findsOneWidget);
      expect(find.text('Step back in time'), findsOneWidget);
      expect(find.text('1h 30m'), findsOneWidget); // 90 min = 1h 30m
      expect(find.text('\$14.50'), findsOneWidget);
      expect(find.text('4.9'), findsOneWidget);
      expect(find.text('(300)'), findsOneWidget);
    });

    testWidgets('formats free tour price correctly', (tester) async {
      final freeTour = mockTour.copyWith(isFree: true, priceUsd: 0.0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TourListCard(tour: freeTour),
          ),
        ),
      );

      expect(find.text('Free'), findsOneWidget);
    });

    testWidgets('formats short duration correctly', (tester) async {
      final shortTour = mockTour.copyWith(durationMinutes: 45);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TourListCard(tour: shortTour),
          ),
        ),
      );

      expect(find.text('45m'), findsOneWidget);
    });
  });
}
