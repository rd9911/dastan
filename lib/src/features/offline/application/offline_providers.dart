import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/features/offline/data/offline_repository.dart';
import 'package:dastan/src/features/offline/data/supabase_bundle_service.dart';

part 'offline_providers.g.dart';

/// Provider for the local offline repository (Drift-based).
@riverpod
OfflineRepository offlineRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return OfflineRepository(db);
}

/// Provider for the Supabase bundle metadata sync service.
@riverpod
SupabaseBundleService supabaseBundleService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseBundleService(client);
}
