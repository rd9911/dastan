import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/events/data/events_repository.dart';
import 'package:dastan/src/features/events/data/caching_events_repository.dart';
import 'package:dastan/src/features/events/data/supabase_events_repository.dart';
import 'package:dastan/src/features/events/application/events_prefill_service.dart';
import 'package:dastan/src/features/events/application/calendar_conflict_service.dart';

part 'events_providers.g.dart';

/// Provider for the events database DAO.
@riverpod
AppDatabase eventsDatabase(Ref ref) {
  return ref.watch(appDatabaseProvider);
}

/// Provider for the events repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.
@riverpod
EventsRepository eventsRepository(Ref ref) {
  final db = ref.watch(eventsDatabaseProvider);

  // Use Supabase backend
  final searchService = ref.watch(supabaseSearchServiceProvider.notifier);
  final supabaseClient = ref.watch(supabaseClientProvider);

  final realRepo = SupabaseEventsRepository(searchService, supabaseClient);

  return CachingEventsRepository(delegate: realRepo, db: db);
}

/// Provider for the events prefill service.
@riverpod
EventsPrefillService eventsPrefillService(Ref ref) {
  return EventsPrefillService();
}

/// Provider for the calendar conflict service.
@riverpod
CalendarConflictService calendarConflictService(Ref ref) {
  return CalendarConflictService();
}
