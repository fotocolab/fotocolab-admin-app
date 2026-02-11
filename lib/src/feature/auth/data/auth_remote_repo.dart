import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/base/base_dynamic_response_model.dart';
import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';
import 'package:fotocolab_admin/core/network/endpoints/auth_endpoints.dart';
import 'package:fotocolab_admin/core/network/network.dart';
import 'package:fotocolab_admin/core/network/network_status.dart';
import 'package:fotocolab_admin/src/feature/auth/data/auth_repo.dart';

class AuthRemoteRepo implements AuthRepo {
  @override
  Future<BaseDynamicResponse<User?>> login({
    String? email,
    String? password,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: AuthEndPoints.login,
        body: {'email': email, 'password': password},
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);

        var result = BaseDynamicResponse<User?>.fromJson(
          body,
          (json) => User.fromJson(json as Map<String, dynamic>),
        );
        return result;
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }
}

final authRemoteRepoProvider = Provider<AuthRemoteRepo>(
  (ref) => AuthRemoteRepo(),
);
