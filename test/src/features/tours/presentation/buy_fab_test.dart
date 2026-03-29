import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/widgets/buy_fab.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

void main() {
  group('BuyFab', () {
    final baseTour = TourSummary(
      id: 't1',
      cityId: 'c1',
      type: TourType.single,
      name: 'Test',
      tagline: 'Test',
      mainImageUrl: 'img',
      durationMinutes: 60,
      priceUsd: 19.99,
      isFree: false,
      reviewCount: 0,
      categories: [],
    );

    testWidgets('shows Buy button with price', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            floatingActionButton: BuyFab(tour: baseTour, onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Buy for \$19.99'), findsOneWidget);
    });

    testWidgets('shows Get for Free for free tours', (tester) async {
      final freeTour = baseTour.copyWith(isFree: true, priceUsd: 0.0);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            floatingActionButton: BuyFab(tour: freeTour, onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Get for Free'), findsOneWidget);
    });

    testWidgets('handles tap', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            floatingActionButton: BuyFab(tour: baseTour, onPressed: () {
              tapped = true;
            }),
          ),
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));
      expect(tapped, isTrue);
    });
  });
}
