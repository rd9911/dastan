import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_auth_service.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // Initial state is idle
  }

  Future<bool> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.read(supabaseAuthServiceProvider.notifier).signInWithEmail(
              email: email,
              password: password,
            ));
    return !state.hasError;
  }

  Future<bool> signUp(String email, String password, String fullName) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.read(supabaseAuthServiceProvider.notifier).signUp(
              email: email,
              password: password,
              fullName: fullName,
            ));
    return !state.hasError;
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(supabaseAuthServiceProvider.notifier).signOut());
  }
}
