import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart';

import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';
import 'package:dastan/src/features/accommodation/data/accommodation_repository.dart';

class SupabaseAccommodationRepository implements AccommodationRepository {
  final SupabaseSearchService _searchService;
  final SupabaseClient _supabaseClient;
  CancelToken? _cancelToken; // Add CancelToken field

  SupabaseAccommodationRepository(this._searchService, this._supabaseClient);

  @override
  Future<AccommodationSearchResult> search(
    AccommodationSearchRequest request, {
    String? cursor,
  }) async {
    // Recreate CancelToken if it was cancelled
    if (_cancelToken?.isCancelled ?? false) {
      _cancelToken = CancelToken();
    }
    _cancelToken ??= CancelToken(); // Initialize if null

    // 1. Convert request to generic params
    final params = request.toJson();

    // 2. Call SupabaseSearchService
    final response = await _searchService.search(
      vertical: SearchVertical.accommodation,
      params: params,
      cursor: cursor,
    );

    // 3. Map SearchResultItem -> PropertyItem
    final items = response.items.map((item) {
      if (_cancelToken?.isCancelled ?? false) {
        throw DioException(
          requestOptions: RequestOptions(path: 'search'),
          type: DioExceptionType.cancel,
          error: 'Search was cancelled by user.',
        );
      }
      if (item.details == null) {
        throw Exception('Accommodation item missing details: ${item.id}');
      }

      // Construct the JSON map expected by PropertyItem.fromJson
      // We start with the 'details' map which should contain the bulk of the data
      final propertyJson = Map<String, dynamic>.from(item.details!);

      // Ensure root-level fields from SearchResultItem are present or override details
      propertyJson['id'] = item.id;
      if (!propertyJson.containsKey('name')) {
        propertyJson['name'] = item.title;
      }
      if (!propertyJson.containsKey('latitude') && item.latitude != null) {
        propertyJson['latitude'] = item.latitude;
      }
      if (!propertyJson.containsKey('longitude') && item.longitude != null) {
        propertyJson['longitude'] = item.longitude;
      }
      if (!propertyJson.containsKey('reviewScore') && item.rating != null) {
        propertyJson['reviewScore'] = item.rating;
        // SearchResponse rating is usually 0-5 or 0-10, PropertyItem expects 0-10.
        // Assuming backend handles normalization or we pass raw.
      }
      if (!propertyJson.containsKey('reviewCount') &&
          item.reviewCount != null) {
        propertyJson['reviewCount'] = item.reviewCount;
      }
      if (!propertyJson.containsKey('thumbnailUrl') && item.imageUrl != null) {
        propertyJson['thumbnailUrl'] = item.imageUrl;
      }

      return PropertyItem.fromJson(propertyJson);
    }).toList();

    return AccommodationSearchResult(
      items: items,
      nextCursor: response.nextCursor,
      totalCount: response.totalItems,
    );
  }

  @override
  Future<PropertyItem> getPropertyDetail(
    String providerId,
    String externalId,
  ) async {
    // Recreate CancelToken if it was cancelled
    if (_cancelToken?.isCancelled ?? false) {
      _cancelToken = CancelToken();
    }
    _cancelToken ??= CancelToken(); // Initialize if null

    final response = await _supabaseClient.functions.invoke(
      'search',
      body: {
        'vertical': 'accommodation',
        'params': {
          'type': 'detail',
          'providerId': providerId,
          'externalId': externalId,
        },
      },
    );

    if (_cancelToken?.isCancelled ?? false) {
      throw DioException(
        requestOptions: RequestOptions(path: 'getPropertyDetail'),
        type: DioExceptionType.cancel,
        error: 'Request was cancelled by user.',
      );
    }

    if (response.status != 200) {
      throw Exception('Failed to get property details: ${response.status}');
    }

    final data = response.data as Map<String, dynamic>;
    return PropertyItem.fromJson(data);
  }

  @override
  void cancelSearch() {
    if (_cancelToken != null && !_cancelToken!.isCancelled) {
      _cancelToken!.cancel('Search was cancelled by user.');
      _cancelToken = CancelToken(); // Recreate a new token for future searches
    }
  }
}
