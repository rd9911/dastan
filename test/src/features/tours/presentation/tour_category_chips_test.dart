import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/widgets/tour_category_chips.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

void main() {
  group('TourCategoryChips', () {
    testWidgets('renders all categories and handles selection', (tester) async {
      final mockCategories = [
        const TourCategory(id: 'c1', name: 'Landmarks', icon: '🏰'),
        const TourCategory(id: 'c2', name: 'History', icon: '🏛️'),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourCategoriesProvider.overrideWith((ref) => Future.value(mockCategories)),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: TourCategoryChips(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('All'), findsOneWidget);
      expect(find.text('Landmarks'), findsOneWidget);
      expect(find.text('History'), findsOneWidget);

      // Tap on Landmarks
      await tester.tap(find.text('Landmarks'));
      await tester.pumpAndSettle();

      // We could verify the provider state here using a mock or ProviderContainer if needed,
      // but testing the FilterChip updates is usually sufficient for UI tests:
      final landmarksChip = tester.widget<FilterChip>(find.byWidgetPredicate((w) => w is FilterChip && (w.label as Text).data == 'Landmarks'));
      expect(landmarksChip.selected, isTrue);

      // Tap on All resets
      await tester.tap(find.text('All'));
      await tester.pumpAndSettle();

      final allChip = tester.widget<FilterChip>(find.byWidgetPredicate((w) => w is FilterChip && (w.label as Text).data == 'All'));
      expect(allChip.selected, isTrue);
    });
  });
}
