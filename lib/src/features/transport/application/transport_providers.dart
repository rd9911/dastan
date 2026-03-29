import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/supabase_search_service.dart';
import '../data/supabase_transport_repository.dart';
import '../data/caching_transport_repository.dart';
import '../data/transport_repository.dart';

part 'transport_providers.g.dart';

/// Provider for the Drift database instance.
@riverpod
AppDatabase transportDatabase(Ref ref) {
  return ref.watch(appDatabaseProvider);
}

/// Provider for the transport repository.
///
/// Returns a [CachingTransportRepository] wrapping a [MockTransportRepository].
/// In a real app, Mock would be replaced by RealTransportRepository based on flavor/env.
@riverpod
TransportRepository transportRepository(Ref ref) {
  final db = ref.watch(transportDatabaseProvider);

  // Use Supabase backend
  final searchService = ref.watch(supabaseSearchServiceProvider.notifier);
  final supabaseClient = ref.watch(supabaseClientProvider);

  final realRepo = SupabaseTransportRepository(searchService, supabaseClient);

  // Wrap in Caching repository for offline/performance support
  return CachingTransportRepository(realRepo, db);
}
