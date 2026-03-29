import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/transport/domain/transport_item.dart';
import 'package:dastan/src/features/transport/domain/transport_search_request.dart';
import 'package:dastan/src/features/transport/data/transport_repository.dart';

class SupabaseTransportRepository implements TransportRepository {
  final SupabaseSearchService _searchService;
  final SupabaseClient _supabaseClient;

  SupabaseTransportRepository(this._searchService, this._supabaseClient);

  @override
  Future<List<TransportItem>> search(TransportSearchRequest request) async {
    // 1. Convert TransportSearchRequest to generic params
    final params = request.toJson();

    // 2. Call SupabaseSearchService
    final response = await _searchService.search(
      vertical: SearchVertical.transport,
      params: params,
    );

    // 3. Map SearchResultItem -> TransportItem
    return response.items.map((item) {
      if (item.details == null) {
        throw Exception('Transport item missing details: ${item.id}');
      }

      // Construct the JSON map expected by TransportItem.fromJson
      final transportJson = Map<String, dynamic>.from(item.details!);

      // Add root-level fields from SearchResultItem if missing in details
      transportJson['id'] = item.id;
      if (!transportJson.containsKey('price')) {
        transportJson['price'] = {
          'amount': item.price ?? 0.0,
          'currency': item.priceCurrency ?? 'USD',
        };
      }

      return TransportItem.fromJson(transportJson);
    }).toList();
  }

  @override
  Future<Map<DateTime, double>> getCalendarMinPrices(
    String origin,
    String destination,
    DateTime month,
  ) async {
    final response = await _supabaseClient.functions.invoke(
      'search',
      body: {
        'vertical': 'transport',
        'params': {
          'type': 'calendar',
          'origin': origin,
          'destination': destination,
          'month': month.toIso8601String(),
        },
      },
    );

    if (response.status != 200) {
      throw Exception('Failed to get calendar prices: ${response.status}');
    }

    final data = response.data as Map<String, dynamic>;
    final prices = <DateTime, double>{};

    data.forEach((dateStr, price) {
      final date = DateTime.tryParse(dateStr);
      if (date != null && price is num) {
        prices[date] = price.toDouble();
      }
    });

    return prices;
  }

  @override
  Future<List<RegionCity>> getRegionCheapest(String region) async {
    final response = await _supabaseClient.functions.invoke(
      'search',
      body: {
        'vertical': 'transport',
        'params': {'type': 'region_cheapest', 'region': region},
      },
    );

    if (response.status != 200) {
      throw Exception('Failed to get region cheapest: ${response.status}');
    }

    final list = response.data as List<dynamic>;
    return list.map((json) {
      final map = json as Map<String, dynamic>;
      return RegionCity(
        name: map['name'] as String,
        country: map['country'] as String,
        minPrice: (map['minPrice'] as num).toDouble(),
        currency: map['currency'] as String,
      );
    }).toList();
  }

  @override
  Future<List<GroupDestination>> searchGroupDestinations(
    List<String> origins,
  ) async {
    final response = await _supabaseClient.functions.invoke(
      'search',
      body: {
        'vertical': 'transport',
        'params': {'type': 'group_destinations', 'origins': origins},
      },
    );

    if (response.status != 200) {
      throw Exception(
        'Failed to search group destinations: ${response.status}',
      );
    }

    final list = response.data as List<dynamic>;
    return list.map((json) {
      final map = json as Map<String, dynamic>;
      return GroupDestination(
        destination: map['destination'] as String,
        totalPrice: (map['totalPrice'] as num).toDouble(),
        pricePerOrigin: Map<String, double>.from(
          (map['pricePerOrigin'] as Map).map(
            (k, v) => MapEntry(k as String, (v as num).toDouble()),
          ),
        ),
        currency: map['currency'] as String,
      );
    }).toList();
  }
}
