import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';

void main() {
  group('TrailsSearchRequest', () {
    test('should create with required fields', () {
      final request = TrailsSearchRequest(
        itineraryId: 'itin-123',
        place: const TrailPlace(
          granularity: PlaceGranularity.city,
          value: 'Chamonix, France',
        ),
      );

      expect(request.itineraryId, 'itin-123');
      expect(request.place.value, 'Chamonix, France');
    });

    test('should serialize and deserialize correctly', () {
      final request = TrailsSearchRequest(
        itineraryId: 'itin-456',
        place: const TrailPlace(
          granularity: PlaceGranularity.city,
          value: 'Zermatt',
        ),
        filters: const TrailsFilters(
          difficulty: [TrailDifficulty.moderate, TrailDifficulty.hard],
          loopOnly: true,
          lengthMaxKm: 15.0,
        ),
        sort: TrailsSort.difficultyAsc,
      );

      final json = request.toJson();
      final restored = TrailsSearchRequest.fromJson(json);

      expect(restored.itineraryId, request.itineraryId);
      expect(restored.place.value, request.place.value);
      expect(restored.filters?.difficulty, contains(TrailDifficulty.moderate));
      expect(restored.filters?.loopOnly, true);
      expect(restored.sort, TrailsSort.difficultyAsc);
    });
  });

  group('TrailCard', () {
    test('should create with required fields', () {
      final card = TrailCard(
        id: 'trail-1',
        providerId: 'alltrails',
        externalId: 'at-123',
        name: 'Mont Blanc Loop',
        thumbnail: 'https://example.com/mb.jpg',
        durationMinutes: 180,
        difficulty: TrailDifficulty.hard,
        lengthKm: 12.5,
        location: const TrailLocation(
          lat: 45.9237,
          lng: 6.8694,
          name: 'Chamonix',
        ),
      );

      expect(card.id, 'trail-1');
      expect(card.name, 'Mont Blanc Loop');
      expect(card.difficulty, TrailDifficulty.hard);
    });

    test('should serialize and deserialize correctly', () {
      final card = TrailCard(
        id: 'trail-2',
        providerId: 'komoot',
        externalId: 'k-456',
        name: 'Easy Forest Walk',
        thumbnail: 'https://example.com/forest.jpg',
        durationMinutes: 60,
        difficulty: TrailDifficulty.easy,
        lengthKm: 3.2,
        elevationGainM: 50,
        location: const TrailLocation(
          lat: 48.8566,
          lng: 2.3522,
          name: 'Fontainebleau',
        ),
        website: 'https://komoot.com/tour/123',
      );

      final json = card.toJson();
      final restored = TrailCard.fromJson(json);

      expect(restored.name, card.name);
      expect(restored.elevationGainM, 50);
      expect(restored.website, isNotNull);
    });
  });

  group('TrailDetail', () {
    test('should create with full details', () {
      final detail = TrailDetail(
        id: 'detail-1',
        providerId: 'alltrails',
        externalId: 'at-789',
        name: 'Alpine Route',
        thumbnail: 'https://example.com/alpine.jpg',
        durationMinutes: 300,
        difficulty: TrailDifficulty.hard,
        lengthKm: 15.0,
        elevationGainM: 1200,
        location: const TrailLocation(lat: 46.0, lng: 7.0, name: 'Alps'),
        photos: ['https://example.com/p1.jpg', 'https://example.com/p2.jpg'],
        description: 'A challenging alpine route...',
        externalUrl: 'https://alltrails.com/trail/123',
      );

      expect(detail.photos, hasLength(2));
      expect(detail.description, isNotEmpty);
      expect(detail.elevationGainM, 1200);
    });
  });
}
