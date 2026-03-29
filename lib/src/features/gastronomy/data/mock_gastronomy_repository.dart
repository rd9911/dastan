import 'dart:async';
import 'dart:math';
import 'package:dastan/src/features/gastronomy/data/gastronomy_repository.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';

/// Mock implementation of [GastronomyRepository] for development and testing.
///
/// Integrates with the unified Search Platform while preserving rich gastronomy-specific logic.
class MockGastronomyRepository implements GastronomyRepository {
  final SearchOrchestrator? _orchestrator;
  Completer<void>? _searchCompleter;
  bool _cancelled = false;

  MockGastronomyRepository({SearchOrchestrator? orchestrator})
    : _orchestrator = orchestrator;

  @override
  Future<GastronomySearchResult> search(
    GastronomySearchRequest request, {
    String? cursor,
  }) async {
    _cancelled = false;
    _searchCompleter = Completer<void>();

    // Use SearchOrchestrator if available
    if (_orchestrator != null) {
      final response = await _orchestrator.search(
        SearchQuery(
          vertical: SearchVertical.gastronomy,
          context: SearchContext(
            locale: 'en',
            currency: 'USD',
            userPrefs: SearchPrefs(
              dietaryFilters:
                  request.filters?.dietary.map((d) => d.name).toList() ?? [],
            ),
          ),
          params: {
            'location': request.place.value,
            'granularity': request.place.granularity.name,
            if (request.filters?.cuisine != null)
              'cuisines': request.filters!.cuisine!.map((c) => c.name).toList(),
            if (request.filters?.priceBand != null)
              'priceBand': request.filters!.priceBand!.name,
            if (request.filters?.openNow != null)
              'openNow': request.filters!.openNow,
            if (request.filters?.kidFriendly != null)
              'kidFriendly': request.filters!.kidFriendly,
            if (request.filters?.dogFriendly != null)
              'dogFriendly': request.filters!.dogFriendly,
          },
          page: cursor != null ? int.tryParse(cursor) ?? 0 : 0,
          pageSize: 20,
        ),
      );

      _searchCompleter?.complete();
      _searchCompleter = null;

      // Convert SearchResultItems to GastronomyResultCards
      final items = response.items
          .map((item) => _fromSearchResultItem(item, request))
          .toList();

      return GastronomySearchResult(
        items: items,
        totalCount: response.totalItems,
        nextCursor: response.nextCursor,
      );
    }

    // Fallback to local mock generation
    await Future.delayed(const Duration(milliseconds: 800));

    if (_cancelled) {
      throw Exception('Search cancelled');
    }

    final page = cursor != null ? int.tryParse(cursor) ?? 0 : 0;
    final pageSize = 20;

    final placeHash = request.place.value.hashCode;
    final totalCount = 40 + (placeHash.abs() % 80);

    final items = <GastronomyResultCard>[];
    final startIndex = page * pageSize;
    final endIndex = min(startIndex + pageSize, totalCount);

    for (int i = startIndex; i < endIndex; i++) {
      items.add(_generateCard(request.place.value, i, request.filters));
    }

    final hasMore = endIndex < totalCount;

    _searchCompleter?.complete();
    _searchCompleter = null;

    return GastronomySearchResult(
      items: items,
      totalCount: totalCount,
      nextCursor: hasMore ? '${page + 1}' : null,
    );
  }

  /// Convert SearchResultItem to GastronomyResultCard.
  GastronomyResultCard _fromSearchResultItem(
    SearchResultItem item,
    GastronomySearchRequest request,
  ) {
    final details = item.details ?? {};
    final hash = item.id.hashCode;

    return GastronomyResultCard(
      id: item.id,
      providerId: item.provenance.firstOrNull ?? 'search_platform',
      externalId: details['externalId'] ?? item.id,
      name: item.title,
      thumbnail: item.imageUrl ?? 'https://picsum.photos/400/300?random=$hash',
      priceBand: _parsePriceBand(details['priceBand']),
      location: details['location'] ?? request.place.value,
      latitude: item.latitude ?? 41.9028,
      longitude: item.longitude ?? 12.4964,
      rating: item.rating,
      reviewCount: item.reviewCount,
      cuisines: _parseCuisines(details['cuisines']),
      dietary: _parseDietary(details['dietary']),
      photos: [],
      distance: details['distance'],
      website: details['website'],
      address: details['address'],
      isOpen: details['isOpen'],
      kidFriendly: details['kidFriendly'],
      dogFriendly: details['dogFriendly'],
      noiseLevel: _parseNoiseLevel(details['noiseLevel']),
      shortDescription: item.subtitle,
    );
  }

  PriceBand _parsePriceBand(dynamic value) {
    if (value == null) return PriceBand.moderate;
    if (value is PriceBand) return value;
    return PriceBand.values.firstWhere(
      (p) => p.name == value.toString(),
      orElse: () => PriceBand.moderate,
    );
  }

  List<CuisineType> _parseCuisines(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value
          .map(
            (v) => CuisineType.values.firstWhere(
              (c) => c.name == v.toString(),
              orElse: () => CuisineType.cafe,
            ),
          )
          .toList();
    }
    return [];
  }

  List<DietaryOption> _parseDietary(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value
          .map(
            (v) => DietaryOption.values.firstWhere(
              (d) => d.name == v.toString(),
              orElse: () => DietaryOption.vegetarian,
            ),
          )
          .toList();
    }
    return [];
  }

  NoiseLevel? _parseNoiseLevel(dynamic value) {
    if (value == null) return null;
    if (value is NoiseLevel) return value;
    return NoiseLevel.values.firstWhere(
      (n) => n.name == value.toString(),
      orElse: () => NoiseLevel.moderate,
    );
  }

  @override
  Future<GastronomyPlaceDetail> getDetail(
    String providerId,
    String externalId,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Generate deterministic detail based on externalId
    final hash = externalId.hashCode;
    final priceBand = PriceBand.values[hash.abs() % PriceBand.values.length];

    return GastronomyPlaceDetail(
      id: 'detail-$externalId',
      providerId: providerId,
      externalId: externalId,
      name: _getRestaurantName(hash),
      priceBand: priceBand,
      location: 'City Center',
      latitude: 41.9028 + (hash % 100) / 10000,
      longitude: 12.4964 + (hash % 50) / 10000,
      description: _getDescription(priceBand),
      photos: List.generate(
        5,
        (i) => 'https://picsum.photos/800/600?random=${hash + i}',
      ),
      menu: _generateMenu(hash),
      cuisines: [CuisineType.values[hash.abs() % CuisineType.values.length]],
      dietary: _getDietaryOptions(hash),
      openingHours: const GastronomyOpeningHours(
        monday: '12:00 - 22:00',
        tuesday: '12:00 - 22:00',
        wednesday: '12:00 - 22:00',
        thursday: '12:00 - 23:00',
        friday: '12:00 - 00:00',
        saturday: '12:00 - 00:00',
        sunday: '12:00 - 21:00',
      ),
      rating: 3.5 + (hash % 15) / 10,
      reviewCount: 100 + (hash % 5000),
      website: 'https://example.com/restaurant/$externalId',
      phone: '+1 234 567 8900',
      address: '${100 + hash % 900} Main Street, City Center',
      kidFriendly: hash % 2 == 0,
      dogFriendly: hash % 3 == 0,
      noiseLevel: NoiseLevel.values[hash.abs() % NoiseLevel.values.length],
      distanceFromCenter: 100 + (hash % 3000),
      editorialSummary: 'A popular local spot known for excellent cuisine.',
    );
  }

  @override
  void cancelSearch() {
    _cancelled = true;
    _searchCompleter?.complete();
  }

  GastronomyResultCard _generateCard(
    String place,
    int index,
    GastronomyFilters? filters,
  ) {
    final hash = place.hashCode + index;
    final priceBand =
        filters?.priceBand ??
        PriceBand.values[hash.abs() % PriceBand.values.length];
    final cuisineType =
        CuisineType.values[hash.abs() % CuisineType.values.length];

    return GastronomyResultCard(
      id: 'rest-$place-$index',
      providerId: 'mock',
      externalId: 'ext-$hash',
      name: _getRestaurantName(hash),
      thumbnail: 'https://picsum.photos/400/300?random=$hash',
      priceBand: priceBand,
      location: place,
      latitude: 41.9028 + (hash % 100) / 10000,
      longitude: 12.4964 + (hash % 50) / 10000,
      rating: 3.0 + (hash % 20) / 10,
      reviewCount: 50 + (hash % 2000),
      cuisines: [cuisineType],
      dietary: _getDietaryOptions(hash),
      photos: List.generate(
        3,
        (i) => 'https://picsum.photos/400/300?random=${hash + i}',
      ),
      distance: 100 + (hash % 3000),
      website: hash % 3 == 0 ? 'https://example.com/restaurant/$hash' : null,
      address: '${100 + hash % 900} Street Name',
      isOpen: hash % 2 == 0,
      kidFriendly: hash % 2 == 0,
      dogFriendly: hash % 3 == 0,
      noiseLevel: NoiseLevel.values[hash.abs() % NoiseLevel.values.length],
      shortDescription: _getShortDescription(cuisineType),
    );
  }

  String _getRestaurantName(int hash) {
    final names = [
      'Trattoria Bella',
      'Le Petit Café',
      'The Golden Fork',
      'Casa Nostra',
      'Sakura Sushi',
      'La Maison',
      'El Mariachi',
      'The Grill House',
      'Pasta Palace',
      'Spice Garden',
      'The Olive Tree',
      'Blue Ocean',
      'Red Dragon',
      'The Tavern',
      'Green Leaf',
      'Sunrise Bistro',
      'Moonlight Diner',
      'The Garden Café',
      'River View',
      'Mountain Peak',
    ];
    return names[hash.abs() % names.length];
  }

  String _getShortDescription(CuisineType cuisine) {
    switch (cuisine) {
      case CuisineType.italian:
        return 'Authentic Italian cuisine with homemade pasta.';
      case CuisineType.french:
        return 'Fine French dining with a modern twist.';
      case CuisineType.japanese:
        return 'Fresh sushi and traditional Japanese dishes.';
      case CuisineType.mexican:
        return 'Bold flavors and traditional Mexican recipes.';
      case CuisineType.indian:
        return 'Aromatic spices and rich curries.';
      case CuisineType.asian:
        return 'Pan-Asian flavors and fusion dishes.';
      case CuisineType.cafe:
        return 'Cozy café with fresh coffee and pastries.';
      case CuisineType.seafood:
        return 'Fresh catches and ocean delicacies.';
      default:
        return 'Delicious food in a welcoming atmosphere.';
    }
  }

  String _getDescription(PriceBand priceBand) {
    switch (priceBand) {
      case PriceBand.budget:
        return 'Affordable dining with generous portions. Perfect for a quick meal.';
      case PriceBand.moderate:
        return 'Quality ingredients and attentive service at reasonable prices.';
      case PriceBand.upscale:
        return 'Elevated dining experience with premium ingredients and expert preparation.';
      case PriceBand.fine:
        return 'Exceptional haute cuisine with impeccable service and art-worthy presentations.';
    }
  }

  List<DietaryOption> _getDietaryOptions(int hash) {
    final options = <DietaryOption>[];
    if (hash % 4 == 0) options.add(DietaryOption.vegetarian);
    if (hash % 5 == 0) options.add(DietaryOption.vegan);
    if (hash % 6 == 0) options.add(DietaryOption.glutenFree);
    return options;
  }

  List<MenuItem> _generateMenu(int hash) {
    return [
      MenuItem(
        name: 'Appetizer of the Day',
        description: 'Chef\'s special starter',
        price: 8.0 + (hash % 10),
        currency: 'EUR',
      ),
      MenuItem(
        name: 'House Salad',
        description: 'Fresh greens with house dressing',
        price: 12.0 + (hash % 8),
        currency: 'EUR',
        dietary: [DietaryOption.vegetarian, DietaryOption.glutenFree],
      ),
      MenuItem(
        name: 'Main Course Special',
        description: 'Today\'s featured main dish',
        price: 22.0 + (hash % 15),
        currency: 'EUR',
      ),
      MenuItem(
        name: 'Dessert Selection',
        description: 'Homemade dessert',
        price: 9.0 + (hash % 6),
        currency: 'EUR',
        dietary: [DietaryOption.vegetarian],
      ),
    ];
  }
}
