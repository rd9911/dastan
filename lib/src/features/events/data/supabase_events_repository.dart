import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';
import 'package:dastan/src/features/events/data/events_repository.dart';

class SupabaseEventsRepository implements EventsRepository {
  final SupabaseSearchService _searchService;
  final SupabaseClient _supabaseClient;

  SupabaseEventsRepository(this._searchService, this._supabaseClient);

  @override
  Future<EventsSearchResult> search(
    EventsSearchRequest request, {
    String? cursor,
  }) async {
    // 1. Convert request to generic params
    final params = request.toJson();

    // 2. Call SupabaseSearchService
    final response = await _searchService.search(
      vertical: SearchVertical.events,
      params: params,
      cursor: cursor,
    );

    // 3. Map SearchResultItem -> EventCard
    final items = response.items.map((item) {
      if (item.details == null) {
        throw Exception('Event item missing details: ${item.id}');
      }

      final details = item.details!;

      return EventCard(
        id: item.id,
        providerId: details['providerId'] as String? ?? 'supabase',
        externalId: details['externalId'] as String? ?? item.id,
        title: item.title,
        category: _parseCategory(details['category']),
        start: _parseDate(details['start']) ?? DateTime.now(),
        end: _parseDate(details['end']),
        venue: EventVenue(
          name: details['venueName'] as String? ?? '',
          latitude: item.latitude ?? 0.0,
          longitude: item.longitude ?? 0.0,
          address: details['address'] as String?,
          city: details['city'] as String?,
        ),
        leadImage: item.imageUrl ?? '',
        distance: details['distance'] as int?,
        price: details['price'] as String?,
        isFree: details['isFree'] as bool?,
        familyFriendly: details['familyFriendly'] as bool?,
        website: details['website'] as String?,
        ticketUrl: details['ticketUrl'] as String?,
        shortDescription: item.subtitle,
      );
    }).toList();

    return EventsSearchResult(
      items: items,
      totalCount: response.totalItems,
      nextCursor: response.nextCursor,
      fromCache: response.meta.providers.any(
        (p) => p.cache == CacheStatus.edge || p.cache == CacheStatus.service,
      ),
    );
  }

  @override
  Future<EventDetail> getDetail(String providerId, String externalId) async {
    final response = await _supabaseClient.functions.invoke(
      'search',
      body: {
        'vertical': 'events',
        'params': {
          'type': 'detail',
          'providerId': providerId,
          'externalId': externalId,
        },
      },
    );

    if (response.status != 200) {
      throw Exception('Failed to get event detail: ${response.status}');
    }

    final data = response.data as Map<String, dynamic>;
    return EventDetail.fromJson(data);
  }

  @override
  void cancelSearch() {
    // Cancellation not currently supported by generic service
  }

  EventCategory _parseCategory(dynamic value) {
    if (value is String) {
      return EventCategory.values.firstWhere(
        (e) => e.name == value,
        orElse: () => EventCategory.other,
      );
    }
    return EventCategory.other;
  }

  DateTime? _parseDate(dynamic value) {
    if (value is String) return DateTime.tryParse(value);
    return null;
  }
}
