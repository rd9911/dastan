import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'supabase_client.g.dart';

/// Provider for the Supabase client.
///
/// Initialize in main() before use:
/// ```dart
/// await Supabase.initialize(
///   url: 'YOUR_SUPABASE_URL',
///   anonKey: 'YOUR_SUPABASE_ANON_KEY',
/// );
/// ```
@riverpod
SupabaseClient supabaseClient(Ref ref) {
  return Supabase.instance.client;
}

/// Helper to access Supabase from non-riverpod contexts if needed.
class SupabaseProvider {
  static SupabaseClient get client => Supabase.instance.client;
}
