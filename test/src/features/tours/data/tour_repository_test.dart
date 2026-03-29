import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/data/tour_remote_data_source.dart';
import 'package:dastan/src/features/tours/data/tour_local_data_source.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

class MockTourRemoteDataSource extends Mock implements TourRemoteDataSource {}
class MockTourLocalDataSource extends Mock implements TourLocalDataSource {}

void main() {
  // ─────────────────────────────────────────────────────────
  // Task 16.3 — Unit tests for TourRepository
  // ─────────────────────────────────────────────────────────

  late MockTourRemoteDataSource mockRemote;
  late MockTourLocalDataSource mockLocal;
  late TourRepository repository;

  final mockTour = TourSummary(
    id: 't1',
    cityId: 'c1',
    type: TourType.single,
    name: 'Eiffel Tower Guide',
    tagline: 'Iconic views',
    mainImageUrl: 'img.jpg',
    durationMinutes: 90,
    priceUsd: 9.99,
    isFree: false,
    averageRating: 4.8,
    reviewCount: 150,
    categories: [],
  );

  setUp(() {
    mockRemote = MockTourRemoteDataSource();
    mockLocal = MockTourLocalDataSource();
    repository = TourRepository(mockRemote, mockLocal);
  });

  group('TourRepository.getToursByCity', () {
    test('online path: calls remote then caches locally', () async {
      when(() => mockRemote.getToursByCity('c1')).thenAnswer((_) async => [mockTour]);
      when(() => mockLocal.cacheTours([mockTour])).thenAnswer((_) async {});

      final result = await repository.getToursByCity('c1');

      expect(result, [mockTour]);
      verify(() => mockRemote.getToursByCity('c1')).called(1);
      verify(() => mockLocal.cacheTours([mockTour])).called(1);
    });

    test('offline path: when remote throws, returns cached data', () async {
      when(() => mockRemote.getToursByCity('c1')).thenThrow(Exception('Network error'));
      when(() => mockLocal.getCachedTours('c1')).thenAnswer((_) async => [mockTour]);

      final result = await repository.getToursByCity('c1');

      expect(result, [mockTour]);
      verify(() => mockLocal.getCachedTours('c1')).called(1);
    });

    test('offline path: returns empty list if no cache exists', () async {
      when(() => mockRemote.getToursByCity('c1')).thenThrow(Exception('Network error'));
      when(() => mockLocal.getCachedTours('c1')).thenAnswer((_) async => []);

      final result = await repository.getToursByCity('c1');

      expect(result, isEmpty);
    });
  });

  group('TourRepository.saveTour', () {
    test('delegates to remote data source', () async {
      when(() => mockRemote.saveTour('u1', 't1')).thenAnswer((_) async {});

      await repository.saveTour('u1', 't1');

      verify(() => mockRemote.saveTour('u1', 't1')).called(1);
    });
  });

  group('TourRepository.getPlaybackProgress', () {
    final now = DateTime(2026, 3, 27, 10, 0);
    final progress = PlaybackProgress(
      tourId: 't1',
      userId: 'u1',
      audioPositionMs: 45000,
      currentSection: 1,
      completed: false,
      lastUpdatedAt: now,
    );

    test('returns remote progress and caches it locally on success', () async {
      when(() => mockRemote.getPlaybackProgress('u1', 't1')).thenAnswer((_) async => progress);
      when(() => mockLocal.updateProgressLocal(progress)).thenAnswer((_) async {});

      final result = await repository.getPlaybackProgress('u1', 't1');

      expect(result, progress);
      verify(() => mockLocal.updateProgressLocal(progress)).called(1);
    });

    test('falls back to local progress when remote throws', () async {
      when(() => mockRemote.getPlaybackProgress('u1', 't1')).thenThrow(Exception('offline'));
      when(() => mockLocal.getProgressLocal('u1', 't1')).thenAnswer((_) async => progress);

      final result = await repository.getPlaybackProgress('u1', 't1');

      expect(result, progress);
      verify(() => mockLocal.getProgressLocal('u1', 't1')).called(1);
    });

    test('returns null when both remote and local have no progress', () async {
      when(() => mockRemote.getPlaybackProgress('u1', 't1')).thenThrow(Exception('offline'));
      when(() => mockLocal.getProgressLocal('u1', 't1')).thenAnswer((_) async => null);

      final result = await repository.getPlaybackProgress('u1', 't1');

      expect(result, isNull);
    });
  });

  group('TourRepository.updatePlaybackProgress', () {
    final now = DateTime(2026, 3, 27, 10, 0);
    final progress = PlaybackProgress(
      tourId: 't1',
      userId: 'u1',
      audioPositionMs: 120000,
      currentSection: 2,
      completed: false,
      lastUpdatedAt: now,
    );

    test('persists locally and syncs to remote', () async {
      when(() => mockLocal.updateProgressLocal(progress)).thenAnswer((_) async {});
      when(() => mockRemote.updatePlaybackProgress(progress)).thenAnswer((_) async {});

      await repository.updatePlaybackProgress(progress);

      verify(() => mockLocal.updateProgressLocal(progress)).called(1);
      verify(() => mockRemote.updatePlaybackProgress(progress)).called(1);
    });
  });
}
