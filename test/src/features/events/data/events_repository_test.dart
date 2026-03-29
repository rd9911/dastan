import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/events/data/events_repository.dart';
import 'package:dastan/src/features/events/data/mock_events_repository.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';

void main() {
  late EventsRepository repository;

  setUp(() {
    repository = MockEventsRepository();
  });

  group('MockEventsRepository', () {
    group('search', () {
      test('should return results for a valid request', () async {
        final request = EventsSearchRequest(
          itineraryId: 'itin-123',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'London',
          ),
        );

        final result = await repository.search(request);

        expect(result.items, isNotEmpty);
        expect(result.totalCount, greaterThan(0));
      });

      test('should return valid EventCards', () async {
        final request = EventsSearchRequest(
          itineraryId: 'itin-1',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'Paris',
          ),
        );

        final result = await repository.search(request);
        final card = result.items.first;

        expect(card.id, startsWith('event-'));
        expect(card.title, isNotEmpty);
        expect(card.venue.name, isNotEmpty);
        expect(card.start, isNotNull);
      });

      test('should filter by category', () async {
        final request = EventsSearchRequest(
          itineraryId: 'itin-cat',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'New York',
          ),
          filters: const EventsFilters(categories: [EventCategory.concert]),
        );

        final result = await repository.search(request);

        expect(result.items, isNotEmpty);
        expect(
          result.items.every((i) => i.category == EventCategory.concert),
          true,
        );
      });

      test('should paginate results', () async {
        final request = EventsSearchRequest(
          itineraryId: 'itin-page',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'Tokyo',
          ),
          dateWindow: EventDateWindow(
            start: DateTime.now(),
            end: DateTime.now().add(const Duration(days: 30)),
          ),
        );

        final page1 = await repository.search(request);
        expect(page1.items, isNotEmpty);
        expect(page1.nextCursor, isNotNull);

        final page2 = await repository.search(
          request,
          cursor: page1.nextCursor,
        );
        expect(page2.items, isNotEmpty);

        // Ensure different items are returned
        expect(page1.items.first.id, isNot(equals(page2.items.first.id)));
      });
    });

    group('getDetail', () {
      test('should return full detail for an event', () async {
        final detail = await repository.getDetail('mock', 'ext-12345');

        expect(detail.id, isNotEmpty);
        expect(detail.title, isNotEmpty);
        expect(detail.descriptionFull, isNotEmpty);
        expect(detail.venue.name, isNotEmpty);
        expect(detail.photos, isNotEmpty);
      });

      test('should match requested ID', () async {
        final detail = await repository.getDetail('mock', 'ext-unique');
        expect(detail.externalId, 'ext-unique');
      });

      test('should return consistent data for same ID', () async {
        final detail1 = await repository.getDetail('mock', 'ext-same');
        final detail2 = await repository.getDetail('mock', 'ext-same');

        expect(detail1.title, detail2.title);
        expect(detail1.venue.name, detail2.venue.name);
      });
    });

    group('cancelSearch', () {
      test('should not throw when cancelling', () {
        expect(() => repository.cancelSearch(), returnsNormally);
      });
    });
  });
}
