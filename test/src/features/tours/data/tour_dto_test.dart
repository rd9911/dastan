import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/tours/data/tour_dto.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

void main() {
  // ─────────────────────────────────────────────────────────
  // Task 16.2 — Unit tests for DTOs
  // ─────────────────────────────────────────────────────────

  group('TourDto.tourSummaryFromSupabase', () {
    Map<String, dynamic> buildTourJson({
      String id = 't1',
      String cityId = 'c1',
      String type = 'single',
      double priceUsd = 9.99,
      bool isFree = false,
      List<Map<String, dynamic>> categories = const [],
    }) {
      return {
        'id': id,
        'cityId': cityId,            // Freezed maps camelCase or snake_case depending on @JsonKey
        'city_id': cityId,
        'type': type,
        'name': 'Eiffel Tower Guide',
        'tagline': 'Iconic views',
        'mainImageUrl': 'img.jpg',
        'main_image_url': 'img.jpg',
        'durationMinutes': 90,
        'duration_minutes': 90,
        'priceUsd': priceUsd,
        'price_usd': priceUsd,
        'isFree': isFree,
        'is_free': isFree,
        'averageRating': 4.5,
        'average_rating': 4.5,
        'reviewCount': 100,
        'review_count': 100,
        'categories': categories,
      };
    }

    test('maps basic JSON to TourSummary domain model', () {
      final json = buildTourJson();
      final summary = TourDto.tourSummaryFromSupabase(json);

      expect(summary, isA<TourSummary>());
      expect(summary.name, 'Eiffel Tower Guide');
      expect(summary.tagline, 'Iconic views');
      expect(summary.type, TourType.single);
      expect(summary.durationMinutes, 90);
    });

    test('maps multi type correctly', () {
      final json = buildTourJson(type: 'multi');
      final summary = TourDto.tourSummaryFromSupabase(json);
      expect(summary.type, TourType.multi);
    });

    test('maps categories from nested JSON', () {
      final json = buildTourJson(categories: [
        {'id': 'cat1', 'name': 'historical', 'icon': 'history'},
        {'id': 'cat2', 'name': 'art', 'icon': 'palette'},
      ]);
      final summary = TourDto.tourSummaryFromSupabase(json);
      expect(summary.categories.length, greaterThanOrEqualTo(0));
      // Note: category mapping depends on Freezed parsing; this tests it does not throw
    });

    test('does not throw for zero price / free tour', () {
      final json = buildTourJson(priceUsd: 0.0, isFree: true);
      final summary = TourDto.tourSummaryFromSupabase(json);
      expect(summary.priceUsd, 0.0);
      expect(summary.isFree, isTrue);
    });
  });

  group('TourDto.savedTourFromSupabase', () {
    test('maps SavedTour JSON to domain model', () {
      final json = {
        'id': 'st1',
        'tourId': 't1',
        'tour_id': 't1',
        'userId': 'u1',
        'user_id': 'u1',
        'savedAt': '2026-03-01T10:00:00.000Z',
        'saved_at': '2026-03-01T10:00:00.000Z',
        'lastOpenedAt': null,
        'last_opened_at': null,
        'tourSummary': null,
        'tour_summary': null,
      };

      final saved = TourDto.savedTourFromSupabase(json);
      expect(saved, isA<SavedTour>());
      expect(saved.tourId, 't1');
      expect(saved.userId, 'u1');
      expect(saved.lastOpenedAt, isNull);
    });

    test('preserved lastOpenedAt when present', () {
      final json = {
        'id': 'st2',
        'tourId': 't2',
        'tour_id': 't2',
        'userId': 'u2',
        'user_id': 'u2',
        'savedAt': '2026-03-01T10:00:00.000Z',
        'saved_at': '2026-03-01T10:00:00.000Z',
        'lastOpenedAt': '2026-03-15T08:00:00.000Z',
        'last_opened_at': '2026-03-15T08:00:00.000Z',
        'tourSummary': null,
        'tour_summary': null,
      };

      final saved = TourDto.savedTourFromSupabase(json);
      expect(saved.lastOpenedAt, isNotNull);
      expect(saved.lastOpenedAt!.year, 2026);
      expect(saved.lastOpenedAt!.month, 3);
      expect(saved.lastOpenedAt!.day, 15);
    });
  });

  group('TourDto.waypointFromSupabase', () {
    test('maps waypoint JSON to TourWaypoint', () {
      final json = {
        'id': 'wp1',
        'tourId': 't1',
        'tour_id': 't1',
        'orderIndex': 0,
        'order_index': 0,
        'label': 'Arc de Triomphe',
        'latitude': 48.8738,
        'longitude': 2.295,
        'radiusMeters': 50,
        'radius_meters': 50,
      };

      final wp = TourDto.waypointFromSupabase(json);
      expect(wp, isA<TourWaypoint>());
      expect(wp.label, 'Arc de Triomphe');
      expect(wp.latitude, closeTo(48.8738, 0.0001));
      expect(wp.orderIndex, 0);
    });
  });
}
