import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({@Default(false) bool isLoading, User? user}) =
      _ProfileState;
}
