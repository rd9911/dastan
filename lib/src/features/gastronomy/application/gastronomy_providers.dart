import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/gastronomy/data/gastronomy_repository.dart';
import 'package:dastan/src/features/gastronomy/data/caching_gastronomy_repository.dart';
import 'package:dastan/src/features/gastronomy/data/supabase_gastronomy_repository.dart';
import 'package:dastan/src/features/gastronomy/application/gastronomy_prefill_service.dart';

part 'gastronomy_providers.g.dart';

/// Provider for the gastronomy database DAO.
@riverpod
AppDatabase gastronomyDatabase(Ref ref) {
  return ref.watch(appDatabaseProvider);
}

/// Provider for the gastronomy repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.
@riverpod
GastronomyRepository gastronomyRepository(Ref ref) {
  final db = ref.watch(gastronomyDatabaseProvider);

  // Use Supabase backend
  final searchService = ref.watch(supabaseSearchServiceProvider.notifier);
  final supabaseClient = ref.watch(supabaseClientProvider);

  final realRepo = SupabaseGastronomyRepository(searchService, supabaseClient);

  // Wrap in Caching repository for offline/performance support
  return CachingGastronomyRepository(delegate: realRepo, db: db);
}

/// Provider for the gastronomy prefill service.
@riverpod
GastronomyPrefillService gastronomyPrefillService(Ref ref) {
  return GastronomyPrefillService();
}
