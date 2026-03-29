import 'package:dastan/src/features/tours/presentation/country_browse/country_browse_screen.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/city_tours_screen.dart';
import 'package:dastan/src/features/tours/presentation/saved_tours/saved_tours_screen.dart';
import 'package:dastan/src/features/tours/presentation/saved_tours/saved_city_tours_screen.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/tour_detail_screen.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/guided_tour_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

class MockTourRepository extends Mock implements TourRepository {}

const _mockSummary = TourSummary(
  id: 'tour-42',
  cityId: 'abc123',
  type: TourType.single,
  name: 'Test Tour',
  tagline: 'Tagline',
  mainImageUrl: '',
  durationMinutes: 30,
  priceUsd: 9.99,
  isFree: false,
  reviewCount: 0,
  categories: [],
);

const _mockAudioVersion = AudioVersion(
  id: 'av1',
  tourId: 'tour-42',
  languageCode: 'en',
  audioUrl: 'https://example.com/audio.mp3',
  status: AudioStatus.ready,
);

const _mockDetail = TourDetail(
  summary: _mockSummary,
  creatorId: 'c1',
  fullDescription: 'Desc',
  guideContent: GuideContent(tourId: 'tour-42', sections: [], version: 1),
  waypoints: [],
  audioVersions: [_mockAudioVersion],
);

// ---------------------------------------------------------------------------
// Helper: build an isolated GoRouter with only the tours routes so the tests
// do not depend on auth/DB providers required by the full app router.
// ---------------------------------------------------------------------------
GoRouter _buildToursRouter() {
  return GoRouter(
    initialLocation: '/tours',
    routes: [
      GoRoute(
        path: '/tours',
        name: 'countryBrowse',
        builder: (_, __) => const CountryBrowseScreen(),
        routes: [
          GoRoute(
            path: 'city/:cityId',
            name: 'cityTours',
            builder: (_, state) =>
                CityToursScreen(cityId: state.pathParameters['cityId']!),
            routes: [
              GoRoute(
                path: 'tour/:tourId',
                name: 'tourDetail',
                builder: (_, state) =>
                    TourDetailScreen(tourId: state.pathParameters['tourId']!),
                routes: [
                  GoRoute(
                    path: 'play',
                    name: 'guidedTour',
                    builder: (_, state) => GuidedTourScreen(
                        tourId: state.pathParameters['tourId']!),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'saved',
            name: 'savedTours',
            builder: (_, __) => const SavedToursScreen(),
            routes: [
              GoRoute(
                path: ':cityId',
                name: 'savedCityTours',
                builder: (_, state) => SavedCityToursScreen(
                    cityId: state.pathParameters['cityId']!),
                routes: [
                  GoRoute(
                    path: 'tour/:tourId',
                    name: 'savedTourDetail',
                    builder: (_, state) => TourDetailScreen(
                      tourId: state.pathParameters['tourId']!,
                      isSaved: true,
                    ),
                    routes: [
                      GoRoute(
                        path: 'play',
                        name: 'savedGuidedTour',
                        builder: (_, state) => GuidedTourScreen(
                            tourId: state.pathParameters['tourId']!),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget _app(GoRouter router) {
  final mockRepo = MockTourRepository();
  // We can return empty lists/null for everything to avoid exceptions
  when(() => mockRepo.getCountries()).thenAnswer((_) async => []);
  when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async => []);
  when(() => mockRepo.getToursByCity(any())).thenAnswer((_) async => []);
  when(() => mockRepo.getTourDetail(any())).thenAnswer((_) async => _mockDetail);
  when(() => mockRepo.getPlaybackProgress(any(), any())).thenAnswer((_) async => null);
  
  return ProviderScope(
    overrides: [
      tourRepositoryProvider.overrideWithValue(mockRepo),
    ],
    child: MaterialApp.router(routerConfig: router),
  );
}

void main() {
  group('Tour Routes', () {
    testWidgets('/tours resolves to CountryBrowseScreen', (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      expect(find.byType(CountryBrowseScreen), findsOneWidget);
    });

    testWidgets('/tours/city/:cityId resolves to CityToursScreen',
        (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      router.go('/tours/city/abc123');
      await tester.pumpAndSettle();

      expect(find.byType(CityToursScreen), findsOneWidget);
    });

    testWidgets('/tours/city/:cityId/tour/:tourId resolves to TourDetailScreen',
        (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      router.go('/tours/city/abc123/tour/tour-42');
      await tester.pumpAndSettle();

      expect(find.byType(TourDetailScreen), findsOneWidget);
    });

    testWidgets(
        '/tours/city/:cityId/tour/:tourId/play resolves to GuidedTourScreen',
        (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      router.go('/tours/city/abc123/tour/tour-42/play');
      await tester.pumpAndSettle();

      expect(find.byType(GuidedTourScreen), findsOneWidget);
    });

    testWidgets('/tours/saved resolves to SavedToursScreen', (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      router.go('/tours/saved');
      await tester.pumpAndSettle();

      expect(find.byType(SavedToursScreen), findsOneWidget);
      expect(find.text('Saved Tours'), findsOneWidget);
    });

    testWidgets('/tours/saved/:cityId resolves to SavedCityToursScreen',
        (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      router.go('/tours/saved/city-99');
      await tester.pumpAndSettle();

      expect(find.byType(SavedCityToursScreen), findsOneWidget);
    });

    testWidgets(
        '/tours/saved/:cityId/tour/:tourId resolves to TourDetailScreen with isSaved=true',
        (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      router.go('/tours/saved/city-99/tour/tour-88');
      await tester.pumpAndSettle();

      expect(find.byType(TourDetailScreen), findsOneWidget);
    });

    testWidgets('named route countryBrowse navigates to /tours', (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      router.goNamed('countryBrowse');
      await tester.pumpAndSettle();

      expect(find.byType(CountryBrowseScreen), findsOneWidget);
    });

    testWidgets('named route guidedTour navigates to play screen',
        (tester) async {
      final router = _buildToursRouter();
      await tester.pumpWidget(_app(router));
      await tester.pumpAndSettle();

      router.goNamed(
        'guidedTour',
        pathParameters: {
          'cityId': 'city-1',
          'tourId': 'tour-1',
        },
      );
      await tester.pumpAndSettle();

      expect(find.byType(GuidedTourScreen), findsOneWidget);
    });
  });
}
