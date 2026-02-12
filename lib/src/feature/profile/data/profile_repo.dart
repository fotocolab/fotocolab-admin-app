import 'package:fotocolab_admin/core/model/base/base_dynamic_response_model.dart';
import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';

abstract class ProfileRepo {
  Future<BaseDynamicResponse<User?>> getProfile();
}
