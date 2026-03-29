import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/city_tours_screen.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';

class MockTourRepository extends Mock implements TourRepository {}

void main() {
  group('CityToursScreen', () {
    late MockTourRepository mockRepo;

    final mockCountry = Country(
      id: '1',
      name: 'France',
      description: 'A beautiful country.',
      heroImageUrl: 'fr.jpg',
      sortOrder: 1,
      flagEmoji: '🇫🇷',
      cities: [
        City(id: 'c1', countryId: '1', name: 'Paris', description: 'desc', heroImageUrl: 'img', sortOrder: 1),
      ],
    );

    final List<TourSummary> mockTours = [
      TourSummary(
        id: 't1',
        cityId: 'c1',
        type: TourType.single,
        name: 'Eiffel Tower Audio Guide',
        tagline: 'See the iconic tower',
        mainImageUrl: 'img.jpg',
        durationMinutes: 120,
        priceUsd: 9.99,
        isFree: false,
        averageRating: 4.8,
        reviewCount: 150,
        categories: [const TourCategory(id: 'cat1', name: 'landmarks')],
      ),
    ];

    setUp(() {
      mockRepo = MockTourRepository();
    });

    testWidgets('shows loading state initially', (tester) async {
      final completer = Completer<List<TourSummary>>();
      when(() => mockRepo.getToursByCity('c1')).thenAnswer((_) => completer.future);
      when(() => mockRepo.getCountries()).thenAnswer((_) async => [mockCountry]);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: CityToursScreen(cityId: 'c1')),
        ),
      );

      // We expect a _CityToursSkeleton or a CircularProgressIndicator
      expect(find.byKey(const Key('city_tours_skeleton')), findsOneWidget);
    });

    testWidgets('displays tour list correctly', (tester) async {
      when(() => mockRepo.getToursByCity('c1')).thenAnswer((_) async => mockTours);
      when(() => mockRepo.getCountries()).thenAnswer((_) async => [mockCountry]);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: CityToursScreen(cityId: 'c1')),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Paris tours'), findsOneWidget);
      expect(find.text('Eiffel Tower Audio Guide'), findsOneWidget);
    });

    testWidgets('empty state when no tours', (tester) async {
      when(() => mockRepo.getToursByCity('c1')).thenAnswer((_) async => <TourSummary>[]);
      when(() => mockRepo.getCountries()).thenAnswer((_) async => [mockCountry]);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: CityToursScreen(cityId: 'c1')),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('No tours available for this city yet.'), findsOneWidget);
    });
  });
}
