import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/auth/state/auth_state.dart';
import 'package:fotocolab_admin/core/network/network_status.dart';
import 'package:fotocolab_admin/src/feature/auth/data/auth_remote_repo.dart';

final authProvider = StateNotifierProvider<AuthNotifierProvider, AuthState>(
  (ref) => AuthNotifierProvider(ref),
);

class AuthNotifierProvider extends StateNotifier<AuthState> {
  AuthNotifierProvider(this.ref) : super(const AuthState());

  final Ref ref;

  bool get isLoading => state.isLoading;

  bool get passwordVisibility => state.passwordVisibility;

  Future<bool> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);

    var result = await ref
        .read(authRemoteRepoProvider)
        .login(email: email, password: password);

    state = state.copyWith(isLoading: false);

    if (result.status == ActionStatus.success.code) {
      return true;
    } else {
      return false;
    }
  }

  set setPasswordVisibility(bool value) {
    state = state.copyWith(passwordVisibility: value);
  }
}
