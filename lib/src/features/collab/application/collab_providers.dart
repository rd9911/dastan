import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/features/collab/data/collab_repository.dart';
import 'package:dastan/src/features/collab/data/supabase_collab_repository.dart';

part 'collab_providers.g.dart';

/// Provider for the collab repository using Supabase backend.
@riverpod
CollabRepository collabRepository(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseCollabRepository(client);
}
