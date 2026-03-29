import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/trails/data/trails_repository.dart';
import 'package:dastan/src/features/trails/data/caching_trails_repository.dart';
import 'package:dastan/src/features/trails/data/supabase_trails_repository.dart';
import 'package:dastan/src/features/trails/application/trails_prefill_service.dart';

part 'trails_providers.g.dart';

@riverpod
AppDatabase trailsDatabase(Ref ref) {
  return ref.watch(appDatabaseProvider);
}

/// Provider for the trails repository.
/// Integrates with the unified Search Platform.
@riverpod
TrailsRepository trailsRepository(Ref ref) {
  final db = ref.watch(trailsDatabaseProvider);

  // Use Supabase backend
  final searchService = ref.watch(supabaseSearchServiceProvider.notifier);
  final supabaseClient = ref.watch(supabaseClientProvider);

  final realRepo = SupabaseTrailsRepository(searchService, supabaseClient);

  return CachingTrailsRepository(delegate: realRepo, db: db);
}

@riverpod
TrailsPrefillService trailsPrefillService(Ref ref) {
  return TrailsPrefillService();
}
