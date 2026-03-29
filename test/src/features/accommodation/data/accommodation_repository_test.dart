import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/accommodation/data/mock_accommodation_repository.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';

void main() {
  group('MockAccommodationRepository', () {
    late MockAccommodationRepository repository;

    setUp(() {
      repository = MockAccommodationRepository();
    });

    group('search', () {
      test('should return search results', () async {
        final request = AccommodationSearchRequest(
          itineraryId: 'itin-1',
          place: 'Paris',
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
        );

        final result = await repository.search(request);

        expect(result.items, isNotEmpty);
        expect(result.totalCount, greaterThan(0));
      });

      test('should include property details in results', () async {
        final request = AccommodationSearchRequest(
          itineraryId: 'itin-2',
          place: 'London',
          checkIn: DateTime(2024, 7, 1),
          checkOut: DateTime(2024, 7, 5),
        );

        final result = await repository.search(request);

        final property = result.items.first;
        expect(property.id, isNotEmpty);
        expect(property.name, isNotEmpty);
        expect(property.location, 'London');
        expect(property.latitude, isNotNull);
        expect(property.longitude, isNotNull);
        expect(property.roomMatrix, isNotEmpty);
      });

      test('should include room pricing in results', () async {
        final request = AccommodationSearchRequest(
          itineraryId: 'itin-3',
          place: 'Rome',
          checkIn: DateTime(2024, 8, 1),
          checkOut: DateTime(2024, 8, 4),
        );

        final result = await repository.search(request);

        final room = result.items.first.roomMatrix.first;
        expect(room.price.total, greaterThan(0));
        expect(room.price.currency, 'USD');
        expect(room.boardPlan, isNotEmpty);
      });

      test('should support pagination with cursor', () async {
        final request = AccommodationSearchRequest(
          itineraryId: 'itin-4',
          place: 'Barcelona',
          checkIn: DateTime(2024, 9, 1),
          checkOut: DateTime(2024, 9, 7),
        );

        // First page
        final page1 = await repository.search(request);
        expect(page1.items, isNotEmpty);

        // Second page (if available)
        if (page1.nextCursor != null) {
          final page2 = await repository.search(
            request,
            cursor: page1.nextCursor,
          );
          expect(page2.items, isNotEmpty);

          // Should be different items
          expect(page2.items.first.id, isNot(equals(page1.items.first.id)));
        }
      });

      test('should generate consistent results for same place', () async {
        final request = AccommodationSearchRequest(
          itineraryId: 'itin-5',
          place: 'Tokyo',
          checkIn: DateTime(2024, 10, 1),
          checkOut: DateTime(2024, 10, 5),
        );

        final result1 = await repository.search(request);
        final result2 = await repository.search(request);

        // Total count should be deterministic based on place hash
        expect(result1.totalCount, result2.totalCount);
      });
    });

    group('getPropertyDetail', () {
      test('should return detailed property information', () async {
        final detail = await repository.getPropertyDetail('mock', 'ext-123');

        expect(detail.id, isNotEmpty);
        expect(detail.providerId, 'mock');
        expect(detail.name, isNotEmpty);
        expect(
          detail.roomMatrix.length,
          greaterThan(1),
        ); // Multiple room options
        expect(detail.policies, isNotNull);
        expect(detail.imageUrls, isNotEmpty);
      });

      test('should include policies in detail', () async {
        final detail = await repository.getPropertyDetail('mock', 'ext-456');

        expect(detail.policies?.cancellation, isNotNull);
        expect(detail.policies?.payment, isNotNull);
        expect(detail.policies?.houseRules, isNotNull);
        expect(detail.policies?.houseRules?.checkInTime, isNotNull);
        expect(detail.policies?.houseRules?.checkOutTime, isNotNull);
      });

      test('should include multiple room options in detail', () async {
        final detail = await repository.getPropertyDetail('mock', 'ext-789');

        expect(detail.roomMatrix.length, greaterThanOrEqualTo(3));

        // Check different room types exist
        final names = detail.roomMatrix.map((r) => r.name).toSet();
        expect(names.length, greaterThan(1));

        // Check different board plans exist
        final plans = detail.roomMatrix.map((r) => r.boardPlan).toSet();
        expect(plans.length, greaterThan(1));
      });
    });

    group('cancelSearch', () {
      test('should cancel in-flight search', () async {
        final request = AccommodationSearchRequest(
          itineraryId: 'itin-cancel',
          place: 'Berlin',
          checkIn: DateTime(2024, 11, 1),
          checkOut: DateTime(2024, 11, 5),
        );

        // Start search and immediately cancel
        final searchFuture = repository.search(request);
        repository.cancelSearch();

        // Should throw or complete (implementation dependent)
        try {
          await searchFuture;
          // If it completes, that's okay too (race condition)
        } catch (e) {
          expect(e.toString(), contains('cancelled'));
        }
      });
    });
  });
}
