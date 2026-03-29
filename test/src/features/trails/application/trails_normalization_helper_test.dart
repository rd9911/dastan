import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/trails/application/trails_normalization_helper.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';

void main() {
  group('TrailsNormalizationHelper', () {
    group('generateDedupeKey', () {
      test('should generate deterministic key', () {
        final card = TrailCard(
          id: 'trail-1',
          providerId: 'prov',
          externalId: 'ext-1',
          name: 'Scenic Trail ', // Trailing space
          thumbnail: '',
          durationMinutes: 120,
          difficulty: TrailDifficulty.moderate,
          lengthKm: 5.5,
          location: const TrailLocation(lat: 0, lng: 0, name: 'Park'),
          website: 'https://example.com ',
        );

        final key = TrailsNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-1',
          item: card,
        );

        expect(key, contains('trails-itin-1'));
        expect(key, contains('scenic trail'));
        expect(key, contains('120')); // duration
        expect(key, contains('moderate'));
      });
    });

    group('normalizeDifficulty', () {
      test('should normalize common strings', () {
        expect(
          TrailsNormalizationHelper.normalizeDifficulty('Easy'),
          TrailDifficulty.easy,
        );
        expect(
          TrailsNormalizationHelper.normalizeDifficulty('Moderate'),
          TrailDifficulty.moderate,
        );
        expect(
          TrailsNormalizationHelper.normalizeDifficulty('Hard'),
          TrailDifficulty.hard,
        );
      });
    });

    group('formatDuration', () {
      test('should format hours and minutes', () {
        expect(TrailsNormalizationHelper.formatDuration(90), '1h 30m');
        expect(TrailsNormalizationHelper.formatDuration(60), '1h');
      });
    });
  });
}
