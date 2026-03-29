import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';

void main() {
  group('AccommodationSearchRequest', () {
    test('should create with required fields', () {
      final request = AccommodationSearchRequest(
        itineraryId: 'itin-123',
        place: 'Paris, France',
        checkIn: DateTime(2024, 6, 15),
        checkOut: DateTime(2024, 6, 20),
      );

      expect(request.itineraryId, 'itin-123');
      expect(request.place, 'Paris, France');
      expect(request.checkIn, DateTime(2024, 6, 15));
      expect(request.checkOut, DateTime(2024, 6, 20));
      expect(request.guests, {
        0: [30, 30],
      }); // Default 2 adults
      expect(request.sort, AccommodationSort.recommended);
    });

    test('should serialize and deserialize correctly', () {
      final request = AccommodationSearchRequest(
        itineraryId: 'itin-456',
        place: 'London, UK',
        checkIn: DateTime(2024, 7, 1),
        checkOut: DateTime(2024, 7, 5),
        guests: {
          0: [35, 33],
          1: [8],
        },
        sort: AccommodationSort.priceLowToHigh,
        filters: const AccommodationFilters(
          minPrice: 50,
          maxPrice: 200,
          freeCancellation: true,
        ),
      );

      final json = request.toJson();
      final restored = AccommodationSearchRequest.fromJson(json);

      expect(restored.itineraryId, request.itineraryId);
      expect(restored.place, request.place);
      expect(restored.guests, request.guests);
      expect(restored.sort, request.sort);
      expect(restored.filters?.minPrice, 50);
      expect(restored.filters?.maxPrice, 200);
      expect(restored.filters?.freeCancellation, true);
    });

    test('should support different room configurations', () {
      // Single room, 1 adult
      final single = AccommodationSearchRequest(
        itineraryId: 'itin-1',
        place: 'Rome',
        checkIn: DateTime(2024, 8, 1),
        checkOut: DateTime(2024, 8, 3),
        guests: {
          0: [30],
        },
      );
      expect(single.guests[0]?.length, 1);

      // 2 rooms, families
      final family = AccommodationSearchRequest(
        itineraryId: 'itin-2',
        place: 'Barcelona',
        checkIn: DateTime(2024, 8, 1),
        checkOut: DateTime(2024, 8, 5),
        guests: {
          0: [35, 33, 10],
          1: [40, 38, 12, 8],
        },
      );
      expect(family.guests.length, 2);
      expect(family.guests[0]?.length, 3);
      expect(family.guests[1]?.length, 4);
    });
  });

  group('PropertyItem', () {
    test('should create with all fields', () {
      final property = PropertyItem(
        id: 'prop-1',
        providerId: 'booking',
        externalId: 'ext-123',
        name: 'Grand Hotel Paris',
        type: PropertyType.hotel,
        location: 'Paris, France',
        latitude: 48.8566,
        longitude: 2.3522,
        starRating: 4,
        reviewScore: 8.5,
        reviewCount: 150,
        thumbnailUrl: 'https://example.com/img.jpg',
        amenities: ['WiFi', 'Pool', 'Gym'],
        roomMatrix: [
          RoomOption(
            id: 'room-1',
            name: 'Standard Room',
            boardPlan: 'Room Only',
            maxOccupancy: 2,
            price: const PriceBreakdown(
              basePrice: 150,
              taxes: 18,
              fees: 10,
              total: 178,
              currency: 'EUR',
            ),
            refundable: true,
          ),
        ],
      );

      expect(property.name, 'Grand Hotel Paris');
      expect(property.type, PropertyType.hotel);
      expect(property.starRating, 4);
      expect(property.reviewScore, 8.5);
      expect(property.amenities.length, 3);
      expect(property.roomMatrix.length, 1);
      expect(property.roomMatrix.first.price.total, 178);
    });

    test('should serialize and deserialize with nested models', () {
      final property = PropertyItem(
        id: 'prop-2',
        providerId: 'expedia',
        externalId: 'ext-456',
        name: 'Beach Resort',
        type: PropertyType.resort,
        location: 'Maldives',
        latitude: 4.1755,
        longitude: 73.5093,
        policies: const Policies(
          cancellation: CancellationPolicy(
            freeCancellation: true,
            penaltyAmount: 100,
          ),
          payment: PaymentPolicy(prepay: false, payAtProperty: true),
          houseRules: HouseRules(
            checkInTime: '15:00',
            checkOutTime: '11:00',
            petsAllowed: false,
          ),
        ),
        roomMatrix: [
          RoomOption(
            id: 'room-dlx',
            name: 'Deluxe Suite',
            boardPlan: 'All Inclusive',
            maxOccupancy: 4,
            price: const PriceBreakdown(
              basePrice: 500,
              taxes: 60,
              fees: 40,
              total: 600,
              currency: 'USD',
            ),
          ),
        ],
      );

      final json = property.toJson();
      final restored = PropertyItem.fromJson(json);

      expect(restored.name, property.name);
      expect(restored.type, PropertyType.resort);
      expect(restored.policies?.cancellation?.freeCancellation, true);
      expect(restored.policies?.payment?.payAtProperty, true);
      expect(restored.policies?.houseRules?.checkInTime, '15:00');
      expect(restored.roomMatrix.first.boardPlan, 'All Inclusive');
    });
  });

  group('PriceBreakdown', () {
    test('should calculate total correctly', () {
      const price = PriceBreakdown(
        basePrice: 100,
        taxes: 12,
        fees: 8,
        total: 120,
        currency: 'USD',
      );

      expect(price.basePrice + price.taxes + price.fees, price.total);
    });

    test('should include per-night info when provided', () {
      const price = PriceBreakdown(
        basePrice: 300,
        taxes: 36,
        fees: 15,
        total: 351,
        currency: 'EUR',
        pricePerNight: 100,
        nights: 3,
      );

      expect(price.pricePerNight, 100);
      expect(price.nights, 3);
      expect(price.pricePerNight! * price.nights!, price.basePrice);
    });
  });

  group('AccommodationFilters', () {
    test('should support all filter types', () {
      const filters = AccommodationFilters(
        minPrice: 50,
        maxPrice: 300,
        propertyTypes: [PropertyType.hotel, PropertyType.resort],
        minStarRating: 4,
        minReviewScore: 8.0,
        maxDistanceToPoi: 2000,
        poiLat: 48.8584,
        poiLng: 2.2945,
        freeCancellation: true,
        payAtProperty: true,
        breakfastIncluded: true,
        wifi: true,
        parking: true,
        pool: true,
        petFriendly: false,
        accessible: true,
      );

      expect(filters.propertyTypes?.length, 2);
      expect(filters.minStarRating, 4);
      expect(filters.freeCancellation, true);
      expect(filters.petFriendly, false);
    });
  });
}
