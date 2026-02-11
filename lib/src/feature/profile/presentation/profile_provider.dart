import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';
import 'package:fotocolab_admin/core/model/profile/state/profile_state.dart';
import 'package:fotocolab_admin/core/network/network_status.dart';
import 'package:fotocolab_admin/src/feature/profile/data/profile_remote_repo.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifierProvider, ProfileState>(
      (ref) => ProfileNotifierProvider(ref),
    );

class ProfileNotifierProvider extends StateNotifier<ProfileState> {
  ProfileNotifierProvider(this.ref) : super(const ProfileState());

  final Ref ref;
  User? get user => state.user;

  Future<void> getProfile() async {
    state = state.copyWith(isLoading: true);

    var result = await ref.read(profileRemoteRepoProvider).getProfile();

    if (result.status == ActionStatus.success.code) {
      state = state.copyWith(isLoading: false, user: result.data);
    } else {
      state = state.copyWith(isLoading: false, user: null);
    }
  }
}
