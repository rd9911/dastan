import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';

/// Service for syncing day plans with Supabase.
///
/// The Supabase `day_plans` table stores entries as JSONB array.
class SupabaseDayPlanService {
  final SupabaseClient _client;

  SupabaseDayPlanService(this._client);

  /// Fetches all day plans for an itinerary from Supabase.
  Future<List<DayPlan>> fetchDayPlansForItinerary(String itineraryId) async {
    try {
      final response = await _client
          .from('day_plans')
          .select()
          .eq('itinerary_id', itineraryId)
          .order('date');

      return (response as List).map((item) => _mapToDomain(item)).toList();
    } catch (e) {
      print('Error fetching day plans: $e');
      return [];
    }
  }

  /// Fetches a specific day plan from Supabase.
  Future<DayPlan?> fetchDayPlan(String itineraryId, DateTime date) async {
    try {
      final dateStr = date.toIso8601String().split('T').first;
      final response = await _client
          .from('day_plans')
          .select()
          .eq('itinerary_id', itineraryId)
          .eq('date', dateStr)
          .maybeSingle();

      if (response == null) return null;
      return _mapToDomain(response);
    } catch (e) {
      print('Error fetching day plan: $e');
      return null;
    }
  }

  /// Pushes a day plan to Supabase.
  Future<void> pushDayPlan(DayPlan plan) async {
    try {
      final dateStr = plan.date.toIso8601String().split('T').first;
      final entriesJson = plan.entries.map((e) => e.toJson()).toList();

      await _client.from('day_plans').upsert({
        'itinerary_id': plan.itineraryId,
        'date': dateStr,
        'entries': entriesJson,
        'updated_at': DateTime.now().toIso8601String(),
      }, onConflict: 'itinerary_id,date');
    } catch (e) {
      print('Error pushing day plan: $e');
      rethrow;
    }
  }

  /// Deletes a day plan from Supabase.
  Future<void> deleteDayPlan(String itineraryId, DateTime date) async {
    try {
      final dateStr = date.toIso8601String().split('T').first;
      await _client
          .from('day_plans')
          .delete()
          .eq('itinerary_id', itineraryId)
          .eq('date', dateStr);
    } catch (e) {
      print('Error deleting day plan: $e');
      rethrow;
    }
  }

  /// Subscribes to real-time changes for day plans in an itinerary.
  RealtimeChannel subscribeToDayPlans(
    String itineraryId,
    void Function(DayPlan) onUpdate,
    void Function(String, DateTime) onDelete,
  ) {
    return _client
        .channel('day_plans:$itineraryId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'day_plans',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'itinerary_id',
            value: itineraryId,
          ),
          callback: (payload) {
            if (payload.eventType == PostgresChangeEvent.delete) {
              final old = payload.oldRecord;
              if (old['itinerary_id'] != null && old['date'] != null) {
                onDelete(
                  old['itinerary_id'] as String,
                  DateTime.parse(old['date'] as String),
                );
              }
            } else {
              final newData = payload.newRecord;
              if (newData.isNotEmpty) {
                onUpdate(_mapToDomain(newData));
              }
            }
          },
        )
        .subscribe();
  }

  DayPlan _mapToDomain(Map<String, dynamic> data) {
    final entriesJson = data['entries'] as List? ?? [];
    final entries = entriesJson
        .map((e) => DayPlanEntry.fromJson(e as Map<String, dynamic>))
        .toList();

    return DayPlan(
      itineraryId: data['itinerary_id'],
      date: DateTime.parse(data['date']),
      entries: entries,
      version: 1, // Supabase schema doesn't have version, default to 1
      updatedAt: data['updated_at'] != null
          ? DateTime.tryParse(data['updated_at'])
          : null,
    );
  }
}
