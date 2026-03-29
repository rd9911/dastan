import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/supabase_search_service.dart';
import 'package:dastan/src/features/accommodation/data/accommodation_repository.dart';
import 'package:dastan/src/features/accommodation/data/caching_accommodation_repository.dart';
import 'package:dastan/src/features/accommodation/data/supabase_accommodation_repository.dart';

part 'accommodation_providers.g.dart';

/// Provider for the Drift database instance.
@riverpod
AppDatabase accommodationDatabase(Ref ref) {
  return ref.watch(appDatabaseProvider);
}

/// Provider for the accommodation repository.
///
/// Returns a [CachingAccommodationRepository] wrapping a [MockAccommodationRepository].
/// Override this in tests to provide a different implementation.
@riverpod
AccommodationRepository accommodationRepository(Ref ref) {
  final db = ref.watch(accommodationDatabaseProvider);

  // Use Supabase backend
  final searchService = ref.watch(supabaseSearchServiceProvider.notifier);
  final supabaseClient = ref.watch(supabaseClientProvider);

  final realRepo = SupabaseAccommodationRepository(
    searchService,
    supabaseClient,
  );

  // Wrap in Caching repository for offline/performance support
  return CachingAccommodationRepository(realRepo, db);
}
