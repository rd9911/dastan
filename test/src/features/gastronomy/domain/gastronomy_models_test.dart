import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';

void main() {
  group('GastronomySearchRequest', () {
    test('should create with required fields', () {
      final request = GastronomySearchRequest(
        itineraryId: 'itin-123',
        place: const GastronomyPlace(
          granularity: PlaceGranularity.city,
          value: 'Rome, Italy',
        ),
      );

      expect(request.itineraryId, 'itin-123');
      expect(request.place.granularity, PlaceGranularity.city);
      expect(request.place.value, 'Rome, Italy');
    });

    test('should serialize and deserialize correctly', () {
      final request = GastronomySearchRequest(
        itineraryId: 'itin-456',
        place: const GastronomyPlace(
          granularity: PlaceGranularity.neighborhood,
          value: 'Trastevere',
        ),
        filters: const GastronomyFilters(
          dietary: [DietaryOption.vegetarian],
          priceBand: PriceBand.moderate,
          openNow: true,
        ),
        sort: GastronomySort.rating,
      );

      final json = request.toJson();
      final restored = GastronomySearchRequest.fromJson(json);

      expect(restored.itineraryId, request.itineraryId);
      expect(restored.place.value, request.place.value);
      expect(restored.filters?.dietary, contains(DietaryOption.vegetarian));
      expect(restored.filters?.priceBand, PriceBand.moderate);
      expect(restored.sort, GastronomySort.rating);
    });

    test('should support all filter options', () {
      final request = GastronomySearchRequest(
        itineraryId: 'itin-789',
        place: const GastronomyPlace(
          granularity: PlaceGranularity.city,
          value: 'Paris',
        ),
        filters: const GastronomyFilters(
          dietary: [DietaryOption.vegan, DietaryOption.glutenFree],
          cuisine: [CuisineType.italian, CuisineType.french],
          priceBand: PriceBand.upscale,
          minRating: 4.0,
          openNow: true,
          kidFriendly: true,
          dogFriendly: false,
          noiseLevel: NoiseLevel.quiet,
        ),
      );

      expect(request.filters?.dietary, hasLength(2));
      expect(request.filters?.cuisine, hasLength(2));
      expect(request.filters?.noiseLevel, NoiseLevel.quiet);
    });
  });

  group('GastronomyResultCard', () {
    test('should create with required fields', () {
      const card = GastronomyResultCard(
        id: 'rest-1',
        providerId: 'google',
        externalId: 'place_123',
        name: 'Trattoria Roma',
        thumbnail: 'https://example.com/trattoria.jpg',
        priceBand: PriceBand.moderate,
        location: 'Rome, Italy',
        latitude: 41.9028,
        longitude: 12.4964,
      );

      expect(card.id, 'rest-1');
      expect(card.name, 'Trattoria Roma');
      expect(card.priceBand, PriceBand.moderate);
    });

    test('should serialize and deserialize correctly', () {
      const card = GastronomyResultCard(
        id: 'rest-2',
        providerId: 'tripadvisor',
        externalId: 'rest_456',
        name: 'Le Petit Bistro',
        thumbnail: 'https://example.com/bistro.jpg',
        priceBand: PriceBand.upscale,
        location: 'Paris, France',
        latitude: 48.8566,
        longitude: 2.3522,
        rating: 4.7,
        reviewCount: 1250,
        cuisines: [CuisineType.french],
        dietary: [DietaryOption.vegetarian],
        isOpen: true,
        distance: 800,
        photos: [
          'https://example.com/photo1.jpg',
          'https://example.com/photo2.jpg',
        ],
      );

      final json = card.toJson();
      final restored = GastronomyResultCard.fromJson(json);

      expect(restored.name, card.name);
      expect(restored.rating, 4.7);
      expect(restored.cuisines, contains(CuisineType.french));
      expect(restored.photos, hasLength(2));
    });

    test('should support facility badges', () {
      const card = GastronomyResultCard(
        id: 'rest-3',
        providerId: 'local',
        externalId: 'local_123',
        name: 'Family Café',
        thumbnail: 'https://example.com/cafe.jpg',
        priceBand: PriceBand.budget,
        location: 'Barcelona',
        latitude: 41.3851,
        longitude: 2.1734,
        kidFriendly: true,
        dogFriendly: true,
        noiseLevel: NoiseLevel.moderate,
      );

      expect(card.kidFriendly, true);
      expect(card.dogFriendly, true);
      expect(card.noiseLevel, NoiseLevel.moderate);
    });
  });

  group('GastronomyPlaceDetail', () {
    test('should create with full details', () {
      final detail = GastronomyPlaceDetail(
        id: 'detail-1',
        providerId: 'google',
        externalId: 'place_789',
        name: 'Ristorante Italiano',
        location: 'Rome, Italy',
        latitude: 41.9028,
        longitude: 12.4964,
        priceBand: PriceBand.upscale,
        description: 'Authentic Italian cuisine in the heart of Rome.',
        photos: [
          'https://example.com/photo1.jpg',
          'https://example.com/photo2.jpg',
        ],
        menu: [
          const MenuItem(
            name: 'Spaghetti Carbonara',
            description: 'Traditional Roman pasta',
            price: 16.00,
            currency: 'EUR',
          ),
          const MenuItem(
            name: 'Tiramisu',
            description: 'Classic Italian dessert',
            price: 8.00,
            currency: 'EUR',
            dietary: [DietaryOption.vegetarian],
          ),
        ],
        openingHours: const GastronomyOpeningHours(
          monday: '12:00 - 23:00',
          tuesday: '12:00 - 23:00',
          wednesday: '12:00 - 23:00',
          thursday: '12:00 - 23:00',
          friday: '12:00 - 00:00',
          saturday: '12:00 - 00:00',
          sunday: 'Closed',
        ),
        rating: 4.8,
        reviewCount: 5000,
        website: 'https://ristorante-italiano.com',
        phone: '+39 06 1234567',
        address: 'Via Roma 123, 00100 Rome, Italy',
        kidFriendly: true,
        dogFriendly: false,
        noiseLevel: NoiseLevel.moderate,
        cuisines: [CuisineType.italian],
      );

      expect(detail.name, 'Ristorante Italiano');
      expect(detail.menu, hasLength(2));
      expect(detail.openingHours?.sunday, 'Closed');
      expect(detail.cuisines, contains(CuisineType.italian));
    });

    test('should serialize and deserialize correctly', () {
      final detail = GastronomyPlaceDetail(
        id: 'detail-2',
        providerId: 'yelp',
        externalId: 'yelp_abc',
        name: 'Vegan Paradise',
        location: 'Berlin, Germany',
        latitude: 52.5200,
        longitude: 13.4050,
        priceBand: PriceBand.moderate,
        photos: ['https://example.com/vegan.jpg'],
        rating: 4.5,
        dietary: [DietaryOption.vegan, DietaryOption.glutenFree],
      );

      final json = detail.toJson();
      final restored = GastronomyPlaceDetail.fromJson(json);

      expect(restored.name, detail.name);
      expect(restored.dietary, contains(DietaryOption.vegan));
    });
  });

  group('GastronomyFilters', () {
    test('should support all dietary options', () {
      const filters = GastronomyFilters(
        dietary: [
          DietaryOption.vegan,
          DietaryOption.vegetarian,
          DietaryOption.halal,
          DietaryOption.kosher,
          DietaryOption.glutenFree,
        ],
      );

      expect(filters.dietary, hasLength(5));
    });

    test('should support all cuisine types', () {
      final allCuisines = CuisineType.values;
      expect(allCuisines, contains(CuisineType.italian));
      expect(allCuisines, contains(CuisineType.french));
      expect(allCuisines, contains(CuisineType.asian));
      expect(allCuisines, contains(CuisineType.mexican));
      expect(allCuisines, contains(CuisineType.indian));
    });

    test('should support all price bands', () {
      expect(PriceBand.values, hasLength(4));
      expect(PriceBand.values, contains(PriceBand.budget));
      expect(PriceBand.values, contains(PriceBand.moderate));
      expect(PriceBand.values, contains(PriceBand.upscale));
      expect(PriceBand.values, contains(PriceBand.fine));
    });
  });

  group('MenuItem', () {
    test('should serialize and deserialize', () {
      const item = MenuItem(
        name: 'Caesar Salad',
        description: 'Fresh romaine with house dressing',
        price: 12.50,
        currency: 'USD',
        dietary: [DietaryOption.vegetarian],
      );

      final json = item.toJson();
      final restored = MenuItem.fromJson(json);

      expect(restored.name, item.name);
      expect(restored.price, 12.50);
      expect(restored.dietary, contains(DietaryOption.vegetarian));
    });
  });

  group('GastronomyOpeningHours', () {
    test('should serialize and deserialize', () {
      const hours = GastronomyOpeningHours(
        monday: '11:00 - 22:00',
        tuesday: '11:00 - 22:00',
        wednesday: '11:00 - 22:00',
        thursday: '11:00 - 22:00',
        friday: '11:00 - 23:00',
        saturday: '12:00 - 23:00',
        sunday: 'Closed',
      );

      final json = hours.toJson();
      final restored = GastronomyOpeningHours.fromJson(json);

      expect(restored.monday, '11:00 - 22:00');
      expect(restored.sunday, 'Closed');
    });
  });
}
