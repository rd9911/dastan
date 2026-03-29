import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/entertainment/data/entertainment_repository.dart';
import 'package:dastan/src/features/entertainment/data/caching_entertainment_repository.dart';
import 'package:dastan/src/features/entertainment/data/supabase_entertainment_repository.dart';
import 'package:dastan/src/features/entertainment/application/entertainment_prefill_service.dart';

part 'entertainment_providers.g.dart';

/// Provider for the entertainment repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.
@riverpod
EntertainmentRepository entertainmentRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);

  // Use Supabase backend
  final searchService = ref.watch(supabaseSearchServiceProvider.notifier);
  final supabaseClient = ref.watch(supabaseClientProvider);

  final realRepo = SupabaseEntertainmentRepository(
    searchService,
    supabaseClient,
  );

  return CachingEntertainmentRepository(delegate: realRepo, db: db);
}

/// Provider for the entertainment prefill service.
@riverpod
EntertainmentPrefillService entertainmentPrefillService(Ref ref) {
  return EntertainmentPrefillService();
}
