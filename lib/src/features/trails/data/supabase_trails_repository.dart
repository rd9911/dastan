import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';
import 'package:dastan/src/features/trails/data/trails_repository.dart';

class SupabaseTrailsRepository implements TrailsRepository {
  final SupabaseSearchService _searchService;
  final SupabaseClient _supabaseClient;

  SupabaseTrailsRepository(this._searchService, this._supabaseClient);

  @override
  Future<TrailsSearchResult> search(
    TrailsSearchRequest request, {
    String? cursor,
  }) async {
    // 1. Convert request to generic params
    final params = request.toJson();

    // 2. Call SupabaseSearchService
    final response = await _searchService.search(
      vertical: SearchVertical.trails,
      params: params,
      cursor: cursor,
    );

    // 3. Map SearchResultItem -> TrailCard
    final items = response.items.map((item) {
      if (item.details == null) {
        throw Exception('Trail item missing details: ${item.id}');
      }

      final details = item.details!;

      return TrailCard(
        id: item.id,
        providerId: details['providerId'] as String? ?? 'supabase',
        externalId: details['externalId'] as String? ?? item.id,
        name: item.title,
        thumbnail: item.imageUrl ?? '',
        durationMinutes: (details['durationMinutes'] as int?) ?? 0,
        difficulty: _parseDifficulty(details['difficulty']),
        lengthKm: (details['lengthKm'] as num?)?.toDouble() ?? 0.0,
        elevationGainM: (details['elevationGainM'] as num?)?.toDouble(),
        location: TrailLocation(
          lat: item.latitude ?? 0.0,
          lng: item.longitude ?? 0.0,
          name: details['locationName'] as String? ?? '',
          address: details['address'] as String?,
          distanceFromCenterKm: (details['distanceFromCenterKm'] as num?)
              ?.toDouble(),
        ),
        website: details['website'] as String?,
        isLoop: details['isLoop'] as bool?,
      );
    }).toList();

    return TrailsSearchResult(
      items: items,
      totalCount: response.totalItems,
      nextCursor: response.nextCursor,
      fromCache: response.meta.providers.any(
        (p) => p.cache == CacheStatus.edge || p.cache == CacheStatus.service,
      ),
    );
  }

  @override
  Future<TrailDetail> getDetail(String providerId, String externalId) async {
    final response = await _supabaseClient.functions.invoke(
      'search',
      body: {
        'vertical': 'trails',
        'params': {
          'type': 'detail',
          'providerId': providerId,
          'externalId': externalId,
        },
      },
    );

    if (response.status != 200) {
      throw Exception('Failed to get trail detail: ${response.status}');
    }

    final data = response.data as Map<String, dynamic>;
    return TrailDetail.fromJson(data);
  }

  @override
  void cancelSearch() {
    // Generic cancellation not supported yet
  }

  TrailDifficulty _parseDifficulty(dynamic value) {
    if (value is String) {
      return TrailDifficulty.values.firstWhere(
        (e) => e.name == value,
        orElse: () => TrailDifficulty.moderate,
      );
    }
    return TrailDifficulty.moderate;
  }
}
