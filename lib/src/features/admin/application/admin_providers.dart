import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/features/admin/data/admin_repository.dart';
import 'package:dastan/src/features/admin/data/supabase_admin_repository.dart';

part 'admin_providers.g.dart';

/// Provider for the admin repository using Supabase backend.
@riverpod
AdminRepository adminRepository(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseAdminRepository(client);
}
