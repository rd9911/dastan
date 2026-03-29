import 'dart:async';
import 'dart:math';
import 'package:dastan/src/features/events/data/events_repository.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';

/// Mock implementation of [EventsRepository] for development and testing.
///
/// Generates realistic event data based on the search destination and date window.
class MockEventsRepository implements EventsRepository {
  Completer<void>? _searchCompleter;
  bool _cancelled = false;

  @override
  Future<EventsSearchResult> search(
    EventsSearchRequest request, {
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
    final totalCount = 30 + (placeHash.abs() % 60); // 30-90 results

    final items = <EventCard>[];
    final startIndex = page * pageSize;
    final endIndex = min(startIndex + pageSize, totalCount);

    // Use date window or generate dates around current time
    final baseDate = request.dateWindow?.start ?? DateTime.now();

    for (int i = startIndex; i < endIndex; i++) {
      items.add(
        _generateCard(request.place.value, i, baseDate, request.filters),
      );
    }

    // Sort by date
    items.sort((a, b) => a.start.compareTo(b.start));

    final hasMore = endIndex < totalCount;

    _searchCompleter?.complete();
    _searchCompleter = null;

    return EventsSearchResult(
      items: items,
      totalCount: totalCount,
      nextCursor: hasMore ? '${page + 1}' : null,
    );
  }

  @override
  Future<EventDetail> getDetail(String providerId, String externalId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Generate deterministic detail based on externalId
    final hash = externalId.hashCode;
    final category =
        EventCategory.values[hash.abs() % EventCategory.values.length];

    return EventDetail(
      id: 'detail-$externalId',
      providerId: providerId,
      externalId: externalId,
      title: _getEventTitle(hash, category),
      category: category,
      start: DateTime.now().add(
        Duration(days: hash % 30, hours: 18 + hash % 6),
      ),
      end: DateTime.now().add(Duration(days: hash % 30, hours: 21 + hash % 3)),
      venue: EventVenue(
        name: _getVenueName(hash),
        latitude: 51.5073 + (hash % 100) / 10000,
        longitude: -0.1276 + (hash % 50) / 10000,
        address: '${100 + hash % 900} Main Street',
      ),
      photos: List.generate(
        5,
        (i) => 'https://picsum.photos/800/600?random=${hash + i}',
      ),
      descriptionShort: _getShortDescription(category),
      descriptionFull: _getFullDescription(category),
      website: 'https://example.com/event/$externalId',
      ticketUrl: 'https://tickets.example.com/buy/$externalId',
      price: hash % 3 == 0 ? null : '£${20 + hash % 80}',
      isFree: hash % 3 == 0,
      familyFriendly: hash % 2 == 0,
      organizer: 'Event Organizers Ltd.',
      attendeeCount: 100 + (hash % 5000),
    );
  }

  @override
  void cancelSearch() {
    _cancelled = true;
    _searchCompleter?.complete();
  }

  EventCard _generateCard(
    String place,
    int index,
    DateTime baseDate,
    EventsFilters? filters,
  ) {
    final hash = place.hashCode + index;
    final category = filters?.categories.isNotEmpty == true
        ? filters!.categories[hash.abs() % filters.categories.length]
        : EventCategory.values[hash.abs() % EventCategory.values.length];

    final eventDate = baseDate.add(
      Duration(days: hash % 14, hours: 18 + hash % 6),
    );

    return EventCard(
      id: 'event-$place-$index',
      providerId: 'mock',
      externalId: 'ext-$hash',
      title: _getEventTitle(hash, category),
      category: category,
      start: eventDate,
      end: eventDate.add(Duration(hours: 2 + hash % 4)),
      venue: EventVenue(
        name: _getVenueName(hash),
        latitude: 51.5073 + (hash % 100) / 10000,
        longitude: -0.1276 + (hash % 50) / 10000,
        address: '${100 + hash % 900} Event Street',
      ),
      leadImage: 'https://picsum.photos/400/300?random=$hash',
      distance: 100 + (hash % 5000),
      price: hash % 3 == 0 ? null : '£${20 + hash % 80}',
      isFree: hash % 3 == 0,
      familyFriendly: hash % 2 == 0,
      website: 'https://example.com/event/$hash',
      ticketUrl: hash % 2 == 0 ? 'https://tickets.example.com/$hash' : null,
      shortDescription: _getShortDescription(category),
    );
  }

  String _getEventTitle(int hash, EventCategory category) {
    final categoryTitles = {
      EventCategory.concert: [
        'Summer Sounds Festival',
        'Rock Night Live',
        'Jazz Evening',
        'Classical Masters',
        'Pop Stars Concert',
      ],
      EventCategory.theatre: [
        'The Great Play',
        'Shakespeare Revival',
        'Modern Drama',
        'Comedy Night',
        'Musical Spectacular',
      ],
      EventCategory.sports: [
        'Championship Finals',
        'Local Derby Match',
        'Athletic Competition',
        'Tournament Semifinals',
        'Exhibition Game',
      ],
      EventCategory.festival: [
        'City Festival',
        'Cultural Celebration',
        'Food & Music Fest',
        'Summer Carnival',
        'Street Festival',
      ],
      EventCategory.exhibition: [
        'Modern Art Show',
        'Photography Exhibition',
        'Historical Artifacts',
        'Science Discovery',
        'Design Showcase',
      ],
      EventCategory.conference: [
        'Tech Summit',
        'Business Forum',
        'Innovation Conference',
        'Leadership Workshop',
        'Industry Meetup',
      ],
    };

    final titles = categoryTitles[category] ?? ['Special Event'];
    return titles[hash.abs() % titles.length];
  }

  String _getVenueName(int hash) {
    final venues = [
      'City Arena',
      'Grand Theatre',
      'Convention Center',
      'Central Park',
      'Royal Hall',
      'Stadium Complex',
      'Arts Center',
      'Exhibition Hall',
      'Music Hall',
      'Community Center',
    ];
    return venues[hash.abs() % venues.length];
  }

  String _getShortDescription(EventCategory category) {
    switch (category) {
      case EventCategory.concert:
        return 'An unforgettable night of live music.';
      case EventCategory.theatre:
        return 'A captivating theatrical performance.';
      case EventCategory.sports:
        return 'Exciting sports action and competition.';
      case EventCategory.festival:
        return 'Celebrate with music, food, and fun.';
      case EventCategory.exhibition:
        return 'Explore incredible works and displays.';
      case EventCategory.conference:
        return 'Connect, learn, and network.';
      default:
        return 'A great event for everyone.';
    }
  }

  String _getFullDescription(EventCategory category) {
    switch (category) {
      case EventCategory.concert:
        return 'Join us for an unforgettable night of live music featuring some of the best artists. '
            'Experience amazing performances in a world-class venue with exceptional sound quality.';
      case EventCategory.theatre:
        return 'A captivating theatrical performance that will move and inspire you. '
            'Our talented cast brings this story to life with powerful acting and stunning visuals.';
      case EventCategory.sports:
        return 'Witness exciting sports action as the best teams compete for glory. '
            'Feel the energy of the crowd and be part of this thrilling experience.';
      case EventCategory.festival:
        return 'Celebrate with music, food, and fun at our annual festival. '
            'Multiple stages, dozens of performers, and endless entertainment await you.';
      case EventCategory.exhibition:
        return 'Explore incredible works and displays that showcase human creativity. '
            'Our curated collection features pieces from renowned artists and emerging talents.';
      case EventCategory.conference:
        return 'Connect with industry leaders, learn from experts, and expand your network. '
            'Inspiring talks, hands-on workshops, and valuable networking opportunities.';
      default:
        return 'A wonderful event that brings people together for a memorable experience.';
    }
  }
}
