import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_client.dart';

part 'supabase_auth_service.g.dart';

@riverpod
class SupabaseAuthService extends _$SupabaseAuthService {
  SupabaseClient get _client => ref.read(supabaseClientProvider);

  @override
  Stream<AuthState> build() {
    return _client.auth.onAuthStateChange;
  }

  /// Current user
  User? get currentUser => _client.auth.currentUser;

  /// Sign up with email
  Future<void> signUp({
    required String email,
    required String password,
    String? fullName,
  }) async {
    await _client.auth.signUp(
      email: email,
      password: password,
      data: fullName != null ? {'full_name': fullName} : null,
    );
  }

  /// Sign in with email
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }

  /// Sign in with Google
  Future<void> signInWithGoogle() async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.google,
      // For mobile, you'd typically handle the redirect or use native sign-in
      // This is a web/desktop friendly default.
      redirectTo: 'io.supabase.dastan://login-callback',
    );
  }

  /// Sign out
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }
}
