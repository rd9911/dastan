import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/tours/presentation/country_browse/widgets/city_cards_row.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

void main() {
  group('CityCard', () {
    testWidgets('renders city details and handles tap', (tester) async {
      const city = City(
        id: 'c1',
        countryId: '1',
        name: 'Kyoto',
        description: 'Historic city',
        heroImageUrl: 'kyoto.jpg',
        sortOrder: 1,
      );

      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CityCard(
              city: city,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      expect(find.text('Kyoto'), findsOneWidget);
      expect(find.text('Explore tours'), findsOneWidget);

      await tester.tap(find.byType(CityCard));
      expect(tapped, isTrue);
    });
  });
}
