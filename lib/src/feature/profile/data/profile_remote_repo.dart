import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/base/base_dynamic_response_model.dart';
import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';
import 'package:fotocolab_admin/core/network/endpoints/profile_endpoint.dart';
import 'package:fotocolab_admin/core/network/network.dart';
import 'package:fotocolab_admin/core/network/network_status.dart';
import 'package:fotocolab_admin/src/feature/profile/data/profile_repo.dart';

class ProfileRemoteRepo implements ProfileRepo {
  @override
  Future<BaseDynamicResponse<User?>> getProfile() async {
    try {
      var response = await NetworkClient.get(endPoint: ProfileEndPoint.profile);

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

final profileRemoteRepoProvider = Provider<ProfileRemoteRepo>(
  (ref) => ProfileRemoteRepo(),
);
