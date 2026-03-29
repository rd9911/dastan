import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import '../application/transport_normalization_helper.dart';
import '../domain/transport_item.dart';
import '../domain/transport_search_request.dart';
import 'transport_repository.dart';

class CachingTransportRepository implements TransportRepository {
  final TransportRepository _inner;
  final AppDatabase _db;

  CachingTransportRepository(this._inner, this._db);

  @override
  Future<List<TransportItem>> search(TransportSearchRequest request) async {
    final key = TransportNormalizationHelper.generateSearchCacheKey(request);

    // 1. Try to read valid cache
    final now = DateTime.now();
    final cached = await (_db.select(
      _db.transportCache,
    )..where((t) => t.key.equals(key))).getSingleOrNull();

    if (cached != null && cached.expiresAt.isAfter(now)) {
      try {
        final List<dynamic> jsonList = jsonDecode(cached.data);
        return jsonList
            .map((e) => TransportItem.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (_) {
        // Fallback to fresh fetch if cache is corrupted
      }
    }

    // 2. Fetch fresh data
    final results = await _inner.search(request);

    // 3. Save to cache (default TTL: 1 hour)
    // Using a simple policy for now.
    final expiresAt = now.add(const Duration(hours: 1));
    final dataString = jsonEncode(results.map((e) => e.toJson()).toList());

    await _db
        .into(_db.transportCache)
        .insert(
          TransportCacheCompanion(
            key: Value(key),
            data: Value(dataString),
            createdAt: Value(now),
            expiresAt: Value(expiresAt),
          ),
          mode: InsertMode.insertOrReplace,
        );

    return results;
  }

  @override
  Future<Map<DateTime, double>> getCalendarMinPrices(
    String origin,
    String destination,
    DateTime month,
  ) async {
    // Calendar caching strategy
    final key = 'cal-$origin-$destination-${month.year}-${month.month}';
    final now = DateTime.now();

    final cached = await (_db.select(
      _db.calendarCache,
    )..where((t) => t.key.equals(key))).getSingleOrNull();

    if (cached != null && cached.expiresAt.isAfter(now)) {
      try {
        final Map<String, dynamic> jsonMap = jsonDecode(cached.data);
        return jsonMap.map(
          (k, v) => MapEntry(DateTime.tryParse(k)!, (v as num).toDouble()),
        );
      } catch (_) {}
    }

    final results = await _inner.getCalendarMinPrices(
      origin,
      destination,
      month,
    );

    // Cache for 1 week
    final expiresAt = now.add(const Duration(days: 7));
    // Keys in JSON must be strings. DateTime.toString() is consistent.
    final dataString = jsonEncode(
      results.map((k, v) => MapEntry(k.toString(), v)),
    );

    await _db
        .into(_db.calendarCache)
        .insert(
          CalendarCacheCompanion(
            key: Value(key),
            data: Value(dataString),
            expiresAt: Value(expiresAt),
          ),
          mode: InsertMode.insertOrReplace,
        );

    return results;
  }

  @override
  Future<List<RegionCity>> getRegionCheapest(String region) async {
    // For region data, we pass through to inner repo without caching
    // (region data changes less frequently, could add caching later)
    return _inner.getRegionCheapest(region);
  }

  @override
  Future<List<GroupDestination>> searchGroupDestinations(
    List<String> origins,
  ) async {
    return _inner.searchGroupDestinations(origins);
  }
}
