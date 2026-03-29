import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

void main() {
  // ─────────────────────────────────────────────────────────
  // Task 16.1 — Unit tests for domain models
  // ─────────────────────────────────────────────────────────

  group('Country serialization', () {
    test('fromJson / toJson round-trip preserves all fields', () {
      final original = Country(
        id: 'country-1',
        name: 'France',
        description: 'La belle France',
        heroImageUrl: 'https://example.com/france.jpg',
        flagEmoji: '🇫🇷',
        sortOrder: 1,
        cities: [
          const City(
            id: 'city-1',
            countryId: 'country-1',
            name: 'Paris',
            description: 'City of light',
            heroImageUrl: 'https://example.com/paris.jpg',
            sortOrder: 1,
          ),
        ],
      );

      final json = original.toJson();
      final restored = Country.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.name, original.name);
      expect(restored.description, original.description);
      expect(restored.heroImageUrl, original.heroImageUrl);
      expect(restored.flagEmoji, original.flagEmoji);
      expect(restored.sortOrder, original.sortOrder);
      expect(restored.cities.length, 1);
      expect(restored.cities.first.id, 'city-1');
      expect(restored.cities.first.name, 'Paris');
    });

    test('fromJson with null flagEmoji does not throw', () {
      final json = {
        'id': 'c1',
        'name': 'Germany',
        'description': 'desc',
        'heroImageUrl': 'url',
        'sortOrder': 2,
        'cities': <dynamic>[],
      };

      final country = Country.fromJson(json);
      expect(country.flagEmoji, isNull);
    });
  });

  // ─────────────────────────────────────────────────────────
  // GuideContent serialization
  // ─────────────────────────────────────────────────────────

  group('GuideContent fromJson / toJson round-trip', () {
    test('preserves all block types', () {
      const original = GuideContent(
        tourId: 'tour-1',
        version: 2,
        sections: [
          GuideSection(
            id: 's1',
            chapterTitle: 'Intro',
            blocks: [
              GuideBlock.text(content: 'Hello world'),
              GuideBlock.highlight(content: 'Important fact'),
              GuideBlock.image(imageUrl: 'https://img.com/a.jpg', caption: 'Caption', isLeading: true),
              GuideBlock.fact(label: 'Built', value: '1889'),
              GuideBlock.location(address: '5 Av. Anatole France', latitude: 48.8584, longitude: 2.2945),
              GuideBlock.yearBadge(label: 'Built in 1889'),
            ],
          ),
        ],
      );

      final json = original.toJson();
      final restored = GuideContent.fromJson(json);

      expect(restored.tourId, 'tour-1');
      expect(restored.version, 2);
      expect(restored.sections.length, 1);

      final section = restored.sections.first;
      expect(section.id, 's1');
      expect(section.chapterTitle, 'Intro');
      expect(section.blocks.length, 6);

      // text block
      expect(section.blocks[0], const GuideBlock.text(content: 'Hello world'));

      // highlight block
      expect(section.blocks[1], const GuideBlock.highlight(content: 'Important fact'));

      // image block
      final imageBlock = section.blocks[2] as GuideBlockImage;
      expect(imageBlock.imageUrl, 'https://img.com/a.jpg');
      expect(imageBlock.caption, 'Caption');
      expect(imageBlock.isLeading, isTrue);

      // fact block
      final factBlock = section.blocks[3] as GuideBlockFact;
      expect(factBlock.label, 'Built');
      expect(factBlock.value, '1889');

      // location block
      final locBlock = section.blocks[4] as GuideBlockLocation;
      expect(locBlock.address, '5 Av. Anatole France');
      expect(locBlock.latitude, closeTo(48.8584, 0.0001));
      expect(locBlock.longitude, closeTo(2.2945, 0.0001));

      // yearBadge block
      expect(section.blocks[5], const GuideBlock.yearBadge(label: 'Built in 1889'));
    });

    test('empty sections list round-trips correctly', () {
      const original = GuideContent(tourId: 't0', sections: [], version: 1);
      final restored = GuideContent.fromJson(original.toJson());
      expect(restored.sections, isEmpty);
    });
  });

  // ─────────────────────────────────────────────────────────
  // SavedTourCluster sorting
  // ─────────────────────────────────────────────────────────

  group('SavedTourCluster sorting', () {
    final now = DateTime(2026, 3, 27, 10, 0, 0);
    final earlier = DateTime(2026, 3, 26, 8, 0, 0);
    final latest = DateTime(2026, 3, 27, 12, 0, 0);

    SavedTour makeSavedTour(String id, String cityId, DateTime savedAt, DateTime? openedAt) {
      return SavedTour(
        id: id,
        tourId: id,
        userId: 'u1',
        savedAt: savedAt,
        lastOpenedAt: openedAt,
        tourSummary: TourSummary(
          id: id,
          cityId: cityId,
          type: TourType.single,
          name: 'Tour $id',
          tagline: 'Tagline',
          mainImageUrl: 'img',
          durationMinutes: 60,
          priceUsd: 0,
          isFree: true,
          reviewCount: 0,
          categories: [],
        ),
      );
    }

    test('clusters with more recent mostRecentOpenedAt sort first', () {
      final clusterA = SavedTourCluster(
        city: const City(id: 'c1', countryId: 'co1', name: 'Paris', description: '', heroImageUrl: '', sortOrder: 1),
        tours: [makeSavedTour('t1', 'c1', earlier, now)],
        mostRecentOpenedAt: now,
      );

      final clusterB = SavedTourCluster(
        city: const City(id: 'c2', countryId: 'co1', name: 'Lyon', description: '', heroImageUrl: '', sortOrder: 2),
        tours: [makeSavedTour('t2', 'c2', earlier, earlier)],
        mostRecentOpenedAt: earlier,
      );

      final clusters = [clusterB, clusterA]
        ..sort((a, b) => b.mostRecentOpenedAt.compareTo(a.mostRecentOpenedAt));

      expect(clusters.first.city.id, 'c1'); // Most recent first
      expect(clusters.last.city.id, 'c2');
    });

    test('clusters sort correctly with three entries', () {
      final clusters = [
        SavedTourCluster(
          city: const City(id: 'c3', countryId: 'x', name: 'Berlin', description: '', heroImageUrl: '', sortOrder: 3),
          tours: [],
          mostRecentOpenedAt: earlier,
        ),
        SavedTourCluster(
          city: const City(id: 'c1', countryId: 'x', name: 'Paris', description: '', heroImageUrl: '', sortOrder: 1),
          tours: [],
          mostRecentOpenedAt: now,
        ),
        SavedTourCluster(
          city: const City(id: 'c2', countryId: 'x', name: 'Lyon', description: '', heroImageUrl: '', sortOrder: 2),
          tours: [],
          mostRecentOpenedAt: latest,
        ),
      ]..sort((a, b) => b.mostRecentOpenedAt.compareTo(a.mostRecentOpenedAt));

      expect(clusters.map((c) => c.city.id).toList(), equals(['c2', 'c1', 'c3']));
    });
  });
}
