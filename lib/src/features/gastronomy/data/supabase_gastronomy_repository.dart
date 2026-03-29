import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';
import 'package:dastan/src/features/gastronomy/data/gastronomy_repository.dart';

class SupabaseGastronomyRepository implements GastronomyRepository {
  final SupabaseSearchService _searchService;
  final SupabaseClient _supabaseClient;

  SupabaseGastronomyRepository(this._searchService, this._supabaseClient);

  @override
  Future<GastronomySearchResult> search(
    GastronomySearchRequest request, {
    String? cursor,
  }) async {
    // 1. Convert request to generic params
    final params = request.toJson();

    // 2. Call SupabaseSearchService
    final response = await _searchService.search(
      vertical: SearchVertical.gastronomy,
      params: params,
      cursor: cursor,
    );

    // 3. Map SearchResultItem -> GastronomyResultCard
    final items = response.items.map((item) {
      if (item.details == null) {
        throw Exception('Gastronomy item missing details: ${item.id}');
      }

      final details = item.details!;

      // Parse enums and models from JSON details maps
      // Assuming 'priceBand' string in JSON matches enum names or index
      // Using helper to parse string/int index safely

      return GastronomyResultCard(
        id: item.id,
        providerId: details['providerId'] as String? ?? 'supabase',
        externalId: details['externalId'] as String? ?? item.id,
        name: item.title,
        thumbnail: item.imageUrl ?? '',
        priceBand: _parsePriceBand(details['priceBand']),
        location: details['location'] as String? ?? '',
        latitude: item.latitude ?? 0.0,
        longitude: item.longitude ?? 0.0,
        rating: item.rating,
        reviewCount: item.reviewCount,
        cuisines:
            (details['cuisines'] as List?)
                ?.map((e) => _parseCuisine(e))
                .toList() ??
            [],
        dietary:
            (details['dietary'] as List?)
                ?.map((e) => _parseDietary(e))
                .toList() ??
            [],
        photos: (details['photos'] as List?)?.cast<String>() ?? [],
        distance: details['distance'] as int?,
        website: details['website'] as String?,
        address: details['address'] as String?,
        shortDescription: item.subtitle,
        isOpen: details['isOpen'] as bool?,
        kidFriendly: details['kidFriendly'] as bool?,
        dogFriendly: details['dogFriendly'] as bool?,
        noiseLevel: _parseNoiseLevel(details['noiseLevel']),
      );
    }).toList();

    return GastronomySearchResult(
      items: items,
      totalCount: response.totalItems,
      nextCursor: response.nextCursor,
      fromCache: response.meta.providers.any(
        (p) => p.cache == CacheStatus.edge || p.cache == CacheStatus.service,
      ),
    );
  }

  @override
  Future<GastronomyPlaceDetail> getDetail(
    String providerId,
    String externalId,
  ) async {
    final response = await _supabaseClient.functions.invoke(
      'search',
      body: {
        'vertical': 'gastronomy',
        'params': {
          'type': 'detail',
          'providerId': providerId,
          'externalId': externalId,
        },
      },
    );

    if (response.status != 200) {
      throw Exception('Failed to get gastronomy detail: ${response.status}');
    }

    // Direct JSON mapping for full details
    final data = response.data as Map<String, dynamic>;
    return GastronomyPlaceDetail.fromJson(data);
  }

  @override
  void cancelSearch() {
    // Not implemented for generic service call
  }

  // Helpers for parsing - falling back to defaults if parsing fails
  PriceBand _parsePriceBand(dynamic value) {
    if (value is String) {
      return PriceBand.values.firstWhere(
        (e) => e.name == value,
        orElse: () => PriceBand.moderate,
      );
    }
    if (value is int && value >= 0 && value < PriceBand.values.length) {
      return PriceBand.values[value];
    }
    return PriceBand.moderate;
  }

  CuisineType _parseCuisine(dynamic value) {
    if (value is String) {
      return CuisineType.values.firstWhere(
        (e) => e.name == value,
        orElse: () => CuisineType.other,
      );
    }
    return CuisineType.other;
  }

  DietaryOption _parseDietary(dynamic value) {
    if (value is String) {
      return DietaryOption.values.firstWhere(
        (e) => e.name == value,
        orElse: () => DietaryOption.vegetarian,
      );
    }
    return DietaryOption.vegetarian;
  }

  NoiseLevel? _parseNoiseLevel(dynamic value) {
    if (value is String) {
      return NoiseLevel.values.firstWhere(
        (e) => e.name == value,
        orElse: () => NoiseLevel.moderate,
      );
    }
    return null;
  }
}
