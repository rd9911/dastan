import 'dart:math';
import 'package:dastan/src/features/accommodation/data/accommodation_repository.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';

/// Mock implementation of AccommodationRepository for development and testing.
class MockAccommodationRepository implements AccommodationRepository {
  final _random = Random();
  bool _cancelled = false;

  @override
  Future<AccommodationSearchResult> search(
    AccommodationSearchRequest request, {
    String? cursor,
  }) async {
    _cancelled = false;

    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 500 + _random.nextInt(500)));

    if (_cancelled) {
      throw Exception('Search cancelled');
    }

    // Generate mock properties
    final pageSize = 10;
    final startIdx = cursor != null ? int.tryParse(cursor) ?? 0 : 0;
    final totalCount = 25 + (request.place.hashCode.abs() % 20);

    final items = <PropertyItem>[];
    for (var i = startIdx; i < startIdx + pageSize && i < totalCount; i++) {
      items.add(_generateProperty(request, i));
    }

    final hasMore = startIdx + pageSize < totalCount;

    return AccommodationSearchResult(
      items: items,
      nextCursor: hasMore ? '${startIdx + pageSize}' : null,
      totalCount: totalCount,
    );
  }

  @override
  Future<PropertyItem> getPropertyDetail(
    String providerId,
    String externalId,
  ) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 300 + _random.nextInt(300)));

    // Generate a detailed property
    return _generateDetailedProperty(providerId, externalId);
  }

  @override
  void cancelSearch() {
    _cancelled = true;
  }

  PropertyItem _generateProperty(
    AccommodationSearchRequest request,
    int index,
  ) {
    final types = PropertyType.values;
    final type = types[index % types.length];
    final names = [
      'Grand',
      'Central',
      'Sunset',
      'Downtown',
      'Plaza',
      'Royal',
      'Park',
      'Ocean',
    ];
    final name = '${type.name.toUpperCase()} ${names[index % names.length]}';

    final nights = request.checkOut.difference(request.checkIn).inDays;
    final basePrice = 80.0 + (index * 15) + _random.nextDouble() * 50;
    final taxes = basePrice * nights * 0.12;
    final fees = 25.0 + _random.nextDouble() * 30;
    final total = (basePrice * nights) + taxes + fees;

    return PropertyItem(
      id: 'prop-$index',
      providerId: 'mock',
      externalId: 'ext-$index-${request.place.hashCode.abs()}',
      name: name,
      type: type,
      location: request.place,
      latitude: 40.7128 + (_random.nextDouble() - 0.5) * 0.1,
      longitude: -74.0060 + (_random.nextDouble() - 0.5) * 0.1,
      starRating: 2 + (index % 4),
      reviewScore: 6.0 + _random.nextDouble() * 4,
      reviewCount: 50 + _random.nextInt(500),
      thumbnailUrl: 'https://picsum.photos/seed/$index/400/300',
      amenities: _generateAmenities(index),
      roomMatrix: [
        RoomOption(
          id: 'room-$index-0',
          name: 'Standard Room',
          boardPlan: 'Room Only',
          maxOccupancy: 2,
          bedConfig: '1 Queen Bed',
          price: PriceBreakdown(
            basePrice: basePrice,
            taxes: taxes,
            fees: fees,
            total: total,
            currency: 'USD',
            pricePerNight: basePrice,
            nights: nights,
          ),
          availability: 3 + _random.nextInt(5),
          refundable: index % 2 == 0,
          cancellationDeadline: index % 2 == 0
              ? request.checkIn.subtract(const Duration(days: 2))
              : null,
        ),
      ],
      distanceToPoi: request.filters?.poiLat != null
          ? 500 + _random.nextInt(3000)
          : null,
      etaToPoi: request.filters?.poiLat != null
          ? 5 + _random.nextInt(25)
          : null,
      vendorUrl: 'https://example.com/book/$index',
    );
  }

  PropertyItem _generateDetailedProperty(String providerId, String externalId) {
    final index = externalId.hashCode.abs() % 100;
    final types = PropertyType.values;
    final type = types[index % types.length];

    final nights = 3; // Default for detail view
    final basePrice = 100.0 + _random.nextDouble() * 150;
    final taxes = basePrice * nights * 0.12;
    final fees = 30.0;

    return PropertyItem(
      id: 'prop-$index',
      providerId: providerId,
      externalId: externalId,
      name: 'Grand ${type.name.toUpperCase()} Hotel',
      type: type,
      location: 'New York, NY',
      latitude: 40.7128,
      longitude: -74.0060,
      starRating: 4,
      reviewScore: 8.5,
      reviewCount: 234,
      thumbnailUrl: 'https://picsum.photos/seed/$index/400/300',
      imageUrls: List.generate(
        6,
        (i) => 'https://picsum.photos/seed/${index + i}/800/600',
      ),
      amenities: _generateAmenities(index),
      roomMatrix: _generateRoomMatrix(basePrice, taxes, fees, nights),
      policies: Policies(
        cancellation: CancellationPolicy(
          freeCancellation: true,
          deadline: DateTime.now().add(const Duration(days: 5)),
          penaltyAmount: basePrice,
          description: 'Free cancellation until 48 hours before check-in',
        ),
        payment: const PaymentPolicy(
          prepay: false,
          payAtProperty: true,
          acceptedMethods: ['Credit Card', 'Debit Card'],
        ),
        houseRules: const HouseRules(
          checkInTime: '15:00',
          checkOutTime: '11:00',
          petsAllowed: false,
          smokingAllowed: false,
          partiesAllowed: false,
          additionalRules: ['No loud music after 10 PM'],
        ),
      ),
      vendorUrl: 'https://example.com/book/$externalId',
    );
  }

  List<String> _generateAmenities(int seed) {
    final allAmenities = [
      'WiFi',
      'Parking',
      'Pool',
      'Gym',
      'Restaurant',
      'Bar',
      'Spa',
      'Room Service',
      'Air Conditioning',
      'Pet Friendly',
      'Business Center',
      'Concierge',
    ];
    final count = 4 + (seed % 5);
    return allAmenities.take(count).toList();
  }

  List<RoomOption> _generateRoomMatrix(
    double basePrice,
    double taxes,
    double fees,
    int nights,
  ) {
    return [
      RoomOption(
        id: 'room-std',
        name: 'Standard Room',
        boardPlan: 'Room Only',
        maxOccupancy: 2,
        bedConfig: '1 Queen Bed',
        price: PriceBreakdown(
          basePrice: basePrice,
          taxes: taxes,
          fees: fees,
          total: (basePrice * nights) + taxes + fees,
          currency: 'USD',
          pricePerNight: basePrice,
          nights: nights,
        ),
        availability: 5,
        refundable: true,
        cancellationDeadline: DateTime.now().add(const Duration(days: 5)),
      ),
      RoomOption(
        id: 'room-dlx',
        name: 'Deluxe Room',
        boardPlan: 'Breakfast Included',
        maxOccupancy: 2,
        bedConfig: '1 King Bed',
        price: PriceBreakdown(
          basePrice: basePrice * 1.3,
          taxes: taxes * 1.3,
          fees: fees,
          total: (basePrice * 1.3 * nights) + (taxes * 1.3) + fees,
          currency: 'USD',
          pricePerNight: basePrice * 1.3,
          nights: nights,
        ),
        availability: 3,
        refundable: true,
        cancellationDeadline: DateTime.now().add(const Duration(days: 5)),
      ),
      RoomOption(
        id: 'room-suite',
        name: 'Executive Suite',
        boardPlan: 'Half Board',
        maxOccupancy: 4,
        bedConfig: '1 King Bed + Sofa Bed',
        price: PriceBreakdown(
          basePrice: basePrice * 2.0,
          taxes: taxes * 2.0,
          fees: fees,
          total: (basePrice * 2.0 * nights) + (taxes * 2.0) + fees,
          currency: 'USD',
          pricePerNight: basePrice * 2.0,
          nights: nights,
        ),
        availability: 1,
        refundable: false,
      ),
    ];
  }
}
