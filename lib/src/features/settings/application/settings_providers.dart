import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/features/settings/data/settings_repository.dart';
import 'package:dastan/src/features/settings/data/supabase_profile_service.dart';

part 'settings_providers.g.dart';

/// Provider for the local settings repository (Drift-based).
@riverpod
SettingsRepository settingsRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SettingsRepository(db);
}

/// Provider for the Supabase profile sync service.
@riverpod
SupabaseProfileService supabaseProfileService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseProfileService(client);
}
