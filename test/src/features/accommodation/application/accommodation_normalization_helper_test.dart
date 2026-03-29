import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/accommodation/application/accommodation_normalization_helper.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';

void main() {
  group('AccommodationNormalizationHelper', () {
    group('generateDedupeKey', () {
      test('should generate deterministic key from property and dates', () {
        final property = PropertyItem(
          id: 'prop-1',
          providerId: 'booking',
          externalId: 'hotel-123',
          name: 'Test Hotel',
          type: PropertyType.hotel,
          location: 'Paris',
          latitude: 48.8566,
          longitude: 2.3522,
        );

        final key = AccommodationNormalizationHelper.generateDedupeKey(
          item: property,
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
        );

        expect(key, 'accommodation-booking-hotel-123-2024-06-15-2024-06-20');
      });

      test('should generate different keys for different dates', () {
        final property = PropertyItem(
          id: 'prop-1',
          providerId: 'expedia',
          externalId: 'resort-456',
          name: 'Beach Resort',
          type: PropertyType.resort,
          location: 'Maldives',
          latitude: 4.175,
          longitude: 73.509,
        );

        final key1 = AccommodationNormalizationHelper.generateDedupeKey(
          item: property,
          checkIn: DateTime(2024, 7, 1),
          checkOut: DateTime(2024, 7, 5),
        );

        final key2 = AccommodationNormalizationHelper.generateDedupeKey(
          item: property,
          checkIn: DateTime(2024, 7, 2),
          checkOut: DateTime(2024, 7, 6),
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should be deterministic for same inputs', () {
        final property = PropertyItem(
          id: 'prop-2',
          providerId: 'hotels',
          externalId: 'apt-789',
          name: 'City Apartment',
          type: PropertyType.apartment,
          location: 'Berlin',
          latitude: 52.52,
          longitude: 13.405,
        );

        final checkIn = DateTime(2024, 8, 10);
        final checkOut = DateTime(2024, 8, 15);

        final key1 = AccommodationNormalizationHelper.generateDedupeKey(
          item: property,
          checkIn: checkIn,
          checkOut: checkOut,
        );

        final key2 = AccommodationNormalizationHelper.generateDedupeKey(
          item: property,
          checkIn: checkIn,
          checkOut: checkOut,
        );

        expect(key1, equals(key2));
      });
    });

    group('generateSearchCacheKey', () {
      test('should generate deterministic cache key from request', () {
        final request = AccommodationSearchRequest(
          itineraryId: 'itin-123',
          place: 'Paris',
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
        );

        final key1 = AccommodationNormalizationHelper.generateSearchCacheKey(
          request,
        );
        final key2 = AccommodationNormalizationHelper.generateSearchCacheKey(
          request,
        );

        expect(key1, equals(key2));
        expect(key1.length, 64); // SHA-256 hex length
      });

      test('should generate different keys for different places', () {
        final request1 = AccommodationSearchRequest(
          itineraryId: 'itin-1',
          place: 'Paris',
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
        );

        final request2 = AccommodationSearchRequest(
          itineraryId: 'itin-1',
          place: 'London',
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
        );

        final key1 = AccommodationNormalizationHelper.generateSearchCacheKey(
          request1,
        );
        final key2 = AccommodationNormalizationHelper.generateSearchCacheKey(
          request2,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should include filters in cache key', () {
        final requestNoFilters = AccommodationSearchRequest(
          itineraryId: 'itin-1',
          place: 'Rome',
          checkIn: DateTime(2024, 7, 1),
          checkOut: DateTime(2024, 7, 5),
        );

        final requestWithFilters = AccommodationSearchRequest(
          itineraryId: 'itin-1',
          place: 'Rome',
          checkIn: DateTime(2024, 7, 1),
          checkOut: DateTime(2024, 7, 5),
          filters: const AccommodationFilters(freeCancellation: true),
        );

        final key1 = AccommodationNormalizationHelper.generateSearchCacheKey(
          requestNoFilters,
        );
        final key2 = AccommodationNormalizationHelper.generateSearchCacheKey(
          requestWithFilters,
        );

        expect(key1, isNot(equals(key2)));
      });
    });

    group('guest counting utilities', () {
      test('totalGuests should count all guests across rooms', () {
        const guests = {
          0: [30, 32],
          1: [8, 5],
        };

        expect(AccommodationNormalizationHelper.totalGuests(guests), 4);
      });

      test('totalAdults should count guests 18+', () {
        const guests = {
          0: [35, 33, 12],
          1: [40, 38, 8, 5],
        };

        expect(AccommodationNormalizationHelper.totalAdults(guests), 4);
      });

      test('totalChildren should count guests under 18', () {
        const guests = {
          0: [35, 33, 12],
          1: [40, 38, 8, 5],
        };

        expect(AccommodationNormalizationHelper.totalChildren(guests), 3);
      });

      test('roomCount should return number of rooms', () {
        const guests = {
          0: [30, 30],
          1: [30],
          2: [30, 30, 8],
        };

        expect(AccommodationNormalizationHelper.roomCount(guests), 3);
      });

      test('calculateNights should compute night count', () {
        final checkIn = DateTime(2024, 6, 15);
        final checkOut = DateTime(2024, 6, 20);

        expect(
          AccommodationNormalizationHelper.calculateNights(checkIn, checkOut),
          5,
        );
      });
    });
  });
}
