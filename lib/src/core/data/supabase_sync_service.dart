import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/core/data/database_provider.dart';

import 'package:drift/drift.dart';

part 'supabase_sync_service.g.dart';

/// Service to handle synchronization between local Drift database and Supabase.
///
/// This is a basic implementation that can be expanded with conflict resolution.
@riverpod
class SupabaseSyncService extends _$SupabaseSyncService {
  SupabaseClient get _client => ref.read(supabaseClientProvider);
  AppDatabase get _db => ref.read(appDatabaseProvider);

  @override
  void build() {}

  /// Syncs itineraries from Supabase to local Drift
  Future<void> syncItinerariesFromRemote() async {
    final user = _client.auth.currentUser;
    if (user == null) return;

    try {
      final response = await _client
          .from('itineraries')
          .select()
          .or(
            'owner_id.eq.${user.id},id.in.(select itinerary_id from itinerary_members where user_id = ${user.id})',
          );

      final remoteItineraries = List<Map<String, dynamic>>.from(response);

      await _db.batch((batch) {
        for (final item in remoteItineraries) {
          batch.insert(
            _db.itineraries,
            ItineraryRow(
              id: item['id'],
              title: item['title'],
              destination: item['destination'],
              startDate: DateTime.tryParse(item['start_date'] ?? ''),
              endDate: DateTime.tryParse(item['end_date'] ?? ''),
              travelers: 1, // Default, not in basic schema yet
              createdAt: DateTime.parse(item['created_at']),
              updatedAt: DateTime.parse(item['updated_at']),
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    } catch (e) {
      // TODO: Handle sync errors properly
      debugPrint('Error syncing itineraries: $e');
      rethrow;
    }
  }

  /// Syncs saved items for a specific itinerary
  Future<void> syncSavedItemsForItinerary(String itineraryId) async {
    try {
      final response = await _client
          .from('saved_items')
          .select()
          .eq('itinerary_id', itineraryId);

      final remoteItems = List<Map<String, dynamic>>.from(response);

      await _db.batch((batch) {
        // First delete items for this itinerary that might strictly be stale?
        // For now, simpler upsert.
        for (final item in remoteItems) {
          batch.insert(
            _db.savedItems,
            SavedItemRow(
              id: item['id'],
              itineraryId: item['itinerary_id'],
              section: item['section'],
              dedupeKey: item['dedupe_key'],
              content: item['details'].toString(), // Storing JSON string
              createdAt: DateTime.parse(item['created_at']),
              updatedAt: DateTime.parse(item['updated_at']),
              isSynced: true,
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    } catch (e) {
      print('Error syncing saved items: $e');
      rethrow;
    }
  }

  /// Pushes local changes to Supabase
  Future<void> pushLocalChanges() async {
    final unsyncedItems = await (_db.select(
      _db.savedItems,
    )..where((tbl) => tbl.isSynced.equals(false))).get();

    if (unsyncedItems.isEmpty) return;

    for (final item in unsyncedItems) {
      try {
        final data = {
          'id': item.id,
          'itinerary_id': item.itineraryId,
          'section': item.section,
          'dedupe_key': item.dedupeKey,
          'details': jsonDecode(
            item.content,
          ), // Ensure it's passed as a JSON object, not string
          // Supabase client handles stringified JSON for JSONB columns automatically if correctly passed,
          // or we might need to jsonDecode(item.content) if the client converts Map -> JSONB.
          // Safer to decode if it's a string.
          'created_at': item.createdAt.toIso8601String(),
          'updated_at': item.updatedAt.toIso8601String(),
        };

        await _client.from('saved_items').upsert(data);

        // Mark as synced
        await (_db.update(_db.savedItems)
              ..where((tbl) => tbl.id.equals(item.id)))
            .write(SavedItemsCompanion(isSynced: Value(true)));
      } catch (e) {
        print('Error pushing item ${item.id}: $e');
        // Continue to next item even if one fails
      }
    }
  }

  /// Subscribe to real-time changes for a specific itinerary
  RealtimeChannel subscribeToItinerary(String itineraryId) {
    return _client
        .channel('itinerary:$itineraryId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'saved_items',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'itinerary_id',
            value: itineraryId,
          ),
          callback: (payload) {
            // Trigger a soft refresh
            syncSavedItemsForItinerary(itineraryId);
            print('Change received: ${payload.toString()}');
          },
        )
        .subscribe();
  }
}
