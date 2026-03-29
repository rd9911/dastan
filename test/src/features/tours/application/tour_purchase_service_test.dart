import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/tours/application/tour_services.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

class MockTourRepository extends Mock implements TourRepository {}

void main() {
  // ─────────────────────────────────────────────────────────
  // Task 16.4 — Unit tests for TourPurchaseService
  // ─────────────────────────────────────────────────────────

  late MockTourRepository mockRepository;
  late TourPurchaseService service;

  setUp(() {
    mockRepository = MockTourRepository();
    service = TourPurchaseService(mockRepository);
  });

  group('TourPurchaseService.purchaseTour', () {
    test('delegates to repository.saveTour with the correct userId and tourId', () async {
      when(() => mockRepository.saveTour('user-abc', 'tour-xyz'))
          .thenAnswer((_) async {});

      await service.purchaseTour('user-abc', 'tour-xyz');

      verify(() => mockRepository.saveTour('user-abc', 'tour-xyz')).called(1);
    });

    test('propagates exception from repository', () async {
      when(() => mockRepository.saveTour(any(), any()))
          .thenThrow(Exception('Network failure'));

      expect(
        () => service.purchaseTour('u1', 't1'),
        throwsException,
      );
    });
  });

  // ─────────────────────────────────────────────────────────
  // TourProgressService
  // ─────────────────────────────────────────────────────────

  group('TourProgressService', () {
    late TourProgressService progressService;

    final now = DateTime(2026, 3, 27, 10, 0);
    final progress = PlaybackProgress(
      tourId: 't1',
      userId: 'u1',
      audioPositionMs: 30000,
      currentSection: 0,
      completed: false,
      lastUpdatedAt: now,
    );

    setUp(() {
      mockRepository = MockTourRepository();
      progressService = TourProgressService(mockRepository);
    });

    test('getProgress delegates to repository', () async {
      when(() => mockRepository.getPlaybackProgress('u1', 't1'))
          .thenAnswer((_) async => progress);

      final result = await progressService.getProgress('u1', 't1');

      expect(result, progress);
      verify(() => mockRepository.getPlaybackProgress('u1', 't1')).called(1);
    });

    test('updateProgress delegates to repository.updatePlaybackProgress', () async {
      when(() => mockRepository.updatePlaybackProgress(progress))
          .thenAnswer((_) async {});

      await progressService.updateProgress(progress);

      verify(() => mockRepository.updatePlaybackProgress(progress)).called(1);
    });
  });
}
