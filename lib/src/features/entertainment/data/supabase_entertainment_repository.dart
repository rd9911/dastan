import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';
import 'package:dastan/src/features/entertainment/data/entertainment_repository.dart';

class SupabaseEntertainmentRepository implements EntertainmentRepository {
  final SupabaseSearchService _searchService;
  final SupabaseClient _supabaseClient;

  SupabaseEntertainmentRepository(this._searchService, this._supabaseClient);

  @override
  Future<EntertainmentSearchResult> search(
    EntertainmentSearchRequest request, {
    String? cursor,
  }) async {
    // 1. Convert request to generic params
    final params = request.toJson();

    // 2. Call generic Supabase Search Service
    final response = await _searchService.search(
      vertical: SearchVertical.entertainment,
      params: params,
      cursor: cursor,
    );

    // 3. Map SearchResultItem -> EntertainmentResultCard
    final items = response.items.map((item) {
      if (item.details == null) {
        throw Exception('Entertainment item missing details: ${item.id}');
      }

      final details = item.details!;

      return EntertainmentResultCard(
        id: item.id,
        providerId: details['providerId'] as String? ?? 'supabase',
        externalId: details['externalId'] as String? ?? item.id,
        name: item.title,
        thumbnail: item.imageUrl ?? '',
        tag: _parseTag(details['tag']),
        location: details['location'] as String? ?? '',
        latitude: item.latitude ?? 0.0,
        longitude: item.longitude ?? 0.0,
        rating: item.rating,
        reviewCount: item.reviewCount,
        distance: details['distance'] as int?,
        website: details['website'] as String?,
        allTags:
            (details['allTags'] as List?)?.map((e) => _parseTag(e)).toList() ??
            [],
        isOpen: details['isOpen'] as bool?,
        shortDescription: item.subtitle,
      );
    }).toList();

    return EntertainmentSearchResult(
      items: items,
      totalCount: response.totalItems,
      nextCursor: response.nextCursor,
      fromCache: response.meta.providers.any(
        (p) => p.cache == CacheStatus.edge || p.cache == CacheStatus.service,
      ),
    );
  }

  @override
  Future<EntertainmentPlaceDetail> getDetail(
    String providerId,
    String externalId,
  ) async {
    final response = await _supabaseClient.functions.invoke(
      'search',
      body: {
        'vertical': 'entertainment',
        'params': {
          'type': 'detail',
          'providerId': providerId,
          'externalId': externalId,
        },
      },
    );

    if (response.status != 200) {
      throw Exception('Failed to get entertainment detail: ${response.status}');
    }

    final data = response.data as Map<String, dynamic>;
    return EntertainmentPlaceDetail.fromJson(data);
  }

  @override
  void cancelSearch() {
    // Generic cancellation not supported yet
  }

  EntertainmentTag _parseTag(dynamic value) {
    if (value is String) {
      return EntertainmentTag.values.firstWhere(
        (e) => e.name == value,
        orElse: () => EntertainmentTag.museum,
      );
    }
    return EntertainmentTag.museum;
  }
}
