import 'dart:async';
import 'dart:math';
import 'package:dastan/src/features/entertainment/data/entertainment_repository.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';

/// Mock implementation of [EntertainmentRepository] for development and testing.
///
/// Generates realistic entertainment data based on the search destination.
class MockEntertainmentRepository implements EntertainmentRepository {
  Completer<void>? _searchCompleter;
  bool _cancelled = false;

  @override
  Future<EntertainmentSearchResult> search(
    EntertainmentSearchRequest request, {
    String? cursor,
  }) async {
    _cancelled = false;
    _searchCompleter = Completer<void>();

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    if (_cancelled) {
      throw Exception('Search cancelled');
    }

    final page = cursor != null ? int.tryParse(cursor) ?? 0 : 0;
    final pageSize = 20;

    // Generate deterministic results based on place
    final placeHash = request.place.value.hashCode;
    final totalCount = 50 + (placeHash.abs() % 100); // 50-150 results

    final items = <EntertainmentResultCard>[];
    final startIndex = page * pageSize;
    final endIndex = min(startIndex + pageSize, totalCount);

    for (int i = startIndex; i < endIndex; i++) {
      items.add(_generateCard(request.place.value, i, request.tags));
    }

    // Apply tag filter if specified
    final filteredItems = request.tags.isEmpty
        ? items
        : items.where((item) => request.tags.contains(item.tag)).toList();

    final hasMore = endIndex < totalCount;

    _searchCompleter?.complete();
    _searchCompleter = null;

    return EntertainmentSearchResult(
      items: filteredItems.isEmpty && request.tags.isEmpty
          ? items
          : filteredItems,
      totalCount: totalCount,
      nextCursor: hasMore ? '${page + 1}' : null,
    );
  }

  @override
  Future<EntertainmentPlaceDetail> getDetail(
    String providerId,
    String externalId,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Generate deterministic detail based on externalId
    final hash = externalId.hashCode;
    final tag =
        EntertainmentTag.values[hash.abs() % EntertainmentTag.values.length];

    return EntertainmentPlaceDetail(
      id: 'detail-$externalId',
      providerId: providerId,
      externalId: externalId,
      name: _getAttractionName(tag, hash),
      tag: tag,
      location: 'City Center',
      latitude: 48.8566 + (hash % 100) / 10000,
      longitude: 2.3522 + (hash % 50) / 10000,
      description: _getFullDescription(tag),
      shortDescription: _getShortDescription(tag),
      photos: List.generate(
        5,
        (i) => 'https://picsum.photos/800/600?random=${hash + i}',
      ),
      openingHours: const OpeningHours(
        monday: '9:00 - 18:00',
        tuesday: '9:00 - 18:00',
        wednesday: '9:00 - 18:00',
        thursday: '9:00 - 21:00',
        friday: '9:00 - 18:00',
        saturday: '10:00 - 19:00',
        sunday: '10:00 - 17:00',
      ),
      rating: 3.5 + (hash % 15) / 10,
      reviewCount: 500 + (hash % 50000),
      website: 'https://example.com/venue/$externalId',
      phone: '+1 234 567 8900',
      address: '123 Main Street, City Center',
      priceLevel: 1 + (hash % 4),
      isFree: hash % 3 == 0,
      isKidFriendly: hash % 2 == 0,
      isAccessible: hash % 4 != 0,
      distanceFromCenter: 100 + (hash % 5000),
      allTags: [tag, ..._getRelatedTags(tag)],
      editorialSummary: 'A must-visit destination in the heart of the city.',
    );
  }

  @override
  void cancelSearch() {
    _cancelled = true;
    _searchCompleter?.complete();
  }

  EntertainmentResultCard _generateCard(
    String place,
    int index,
    List<EntertainmentTag> preferredTags,
  ) {
    final hash = place.hashCode + index;
    final tag = preferredTags.isNotEmpty && index % 3 == 0
        ? preferredTags[index % preferredTags.length]
        : EntertainmentTag.values[hash.abs() % EntertainmentTag.values.length];

    return EntertainmentResultCard(
      id: 'ent-$place-$index',
      providerId: 'mock',
      externalId: 'ext-$hash',
      name: _getAttractionName(tag, hash),
      thumbnail: 'https://picsum.photos/400/300?random=$hash',
      tag: tag,
      location: place,
      latitude: 48.8566 + (hash % 100) / 10000,
      longitude: 2.3522 + (hash % 50) / 10000,
      rating: 3.0 + (hash % 20) / 10,
      reviewCount: 100 + (hash % 10000),
      distance: 100 + (hash % 5000),
      website: hash % 3 == 0 ? 'https://example.com/venue/$hash' : null,
      isOpen: hash % 2 == 0,
      shortDescription: _getShortDescription(tag),
    );
  }

  String _getAttractionName(EntertainmentTag tag, int hash) {
    final names = _attractionNames[tag] ?? ['Historic Site'];
    return names[hash.abs() % names.length];
  }

  String _getShortDescription(EntertainmentTag tag) {
    switch (tag) {
      case EntertainmentTag.museum:
        return 'Discover art and history in this world-renowned museum.';
      case EntertainmentTag.garden:
        return 'Beautiful gardens perfect for a relaxing stroll.';
      case EntertainmentTag.landmark:
        return 'An iconic landmark that defines the city skyline.';
      case EntertainmentTag.architecture:
        return 'Stunning architectural masterpiece showcasing design excellence.';
      case EntertainmentTag.viewpoint:
        return 'Breathtaking panoramic views of the city and beyond.';
      case EntertainmentTag.park:
        return 'Green oasis in the heart of the urban landscape.';
      case EntertainmentTag.historicSite:
        return 'Step back in time at this historic landmark.';
      case EntertainmentTag.artGallery:
        return 'Contemporary and classic art in intimate gallery spaces.';
      case EntertainmentTag.theater:
        return 'World-class performances in an elegant setting.';
      case EntertainmentTag.zoo:
        return 'Meet exotic animals from around the world.';
      case EntertainmentTag.aquarium:
        return 'Dive into the wonders of marine life.';
      case EntertainmentTag.themePark:
        return 'Thrilling rides and entertainment for all ages.';
      case EntertainmentTag.beach:
        return 'Sun, sand, and relaxation await.';
      case EntertainmentTag.natureReserve:
        return 'Pristine natural habitats and wildlife.';
      case EntertainmentTag.monument:
        return 'A tribute to history and heritage.';
    }
  }

  String _getFullDescription(EntertainmentTag tag) {
    final short = _getShortDescription(tag);
    return '''$short

This attraction offers a unique experience that combines cultural heritage with modern accessibility. Visitors can explore at their own pace, with guided tours available in multiple languages.

The venue features excellent facilities including restrooms, a gift shop, and a café serving local delicacies. Photography is permitted in most areas, though flash photography may be restricted in certain sections.

Whether you're a first-time visitor or returning for another experience, this destination promises to leave a lasting impression. Don't forget to check the seasonal events calendar for special exhibitions and performances.''';
  }

  List<EntertainmentTag> _getRelatedTags(EntertainmentTag primary) {
    switch (primary) {
      case EntertainmentTag.museum:
        return [EntertainmentTag.artGallery, EntertainmentTag.historicSite];
      case EntertainmentTag.garden:
        return [EntertainmentTag.park, EntertainmentTag.natureReserve];
      case EntertainmentTag.landmark:
        return [EntertainmentTag.monument, EntertainmentTag.architecture];
      case EntertainmentTag.architecture:
        return [EntertainmentTag.landmark, EntertainmentTag.historicSite];
      default:
        return [];
    }
  }

  static const Map<EntertainmentTag, List<String>> _attractionNames = {
    EntertainmentTag.museum: [
      'National Museum of Art',
      'Science Discovery Museum',
      'History Museum',
      'Natural History Museum',
      'Modern Art Museum',
      'Maritime Museum',
      'Aviation Museum',
    ],
    EntertainmentTag.garden: [
      'Royal Botanical Gardens',
      'Japanese Garden',
      'Rose Garden',
      'Sculpture Garden',
      'Secret Garden',
      'Memorial Garden',
    ],
    EntertainmentTag.landmark: [
      'Grand Tower',
      'Historic Bridge',
      'Central Square',
      'Victory Arch',
      'Clock Tower',
      'Old City Gate',
    ],
    EntertainmentTag.architecture: [
      'Gothic Cathedral',
      'Modern Concert Hall',
      'Art Deco Building',
      'Renaissance Palace',
      'Contemporary Arts Center',
    ],
    EntertainmentTag.viewpoint: [
      'Sky Observation Deck',
      'Hilltop Panorama',
      'River View Terrace',
      'Sunset Point',
    ],
    EntertainmentTag.park: [
      'Central Park',
      'Riverside Park',
      'Memorial Park',
      'City Gardens',
      'Forest Park',
    ],
    EntertainmentTag.historicSite: [
      'Ancient Ruins',
      'Medieval Castle',
      'Historic Quarter',
      'Colonial Fort',
      'Heritage House',
    ],
    EntertainmentTag.artGallery: [
      'Contemporary Art Gallery',
      'Photography Gallery',
      'Local Artists Gallery',
      'Sculpture Gallery',
    ],
    EntertainmentTag.theater: [
      'Grand Opera House',
      'National Theater',
      'Comedy Club',
      'Shakespeare Theater',
    ],
    EntertainmentTag.zoo: [
      'City Zoo',
      'Wildlife Safari Park',
      'Exotic Animal Sanctuary',
    ],
    EntertainmentTag.aquarium: [
      'Ocean World Aquarium',
      'Marine Life Center',
      'Tropical Fish Aquarium',
    ],
    EntertainmentTag.themePark: [
      'Adventure Land',
      'Fantasy World',
      'Thrill Zone',
    ],
    EntertainmentTag.beach: ['Sunny Beach', 'Crystal Cove', 'Palm Beach'],
    EntertainmentTag.natureReserve: [
      'Wildlife Preserve',
      'Bird Sanctuary',
      'Forest Reserve',
    ],
    EntertainmentTag.monument: [
      'War Memorial',
      'Founders Monument',
      'Liberty Statue',
    ],
  };
}
