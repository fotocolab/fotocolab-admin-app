import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/base/base_dynamic_response_model.dart';
import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';
import 'package:fotocolab_admin/core/model/subscription/create/create_subscription_request_model.dart';
import 'package:fotocolab_admin/core/model/subscription/response/plans_response_model.dart/plans_response_model.dart';
import 'package:fotocolab_admin/core/network/endpoints/subscription_endpoint.dart';
import 'package:fotocolab_admin/core/network/network.dart';
import 'package:fotocolab_admin/core/network/network_status.dart';
import 'package:fotocolab_admin/src/feature/subscription/data/subscription_repo.dart';

class SubscriptionRemoteRepo implements SubscriptionRepo {
  @override
  Future<BaseDynamicResponse<User?>> createSubscription({
    required CreateSubscriptionRequestModel request,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: SubscriptionEndpoint.create,
        body: request.toJson(),
      );

      if (response?.statusCode == NetworkStatus.status201.statusCode) {
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

  @override
  Future<BaseDynamicResponse<List<PlansResponseModel>?>> getAllPlans() async {
    try {
      var response = await NetworkClient.get(
        endPoint: SubscriptionEndpoint.getAllPlans,
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);

        var result = BaseDynamicResponse<PlansResponseModel>.fromJson(
          body,
          (json) => PlansResponseModel.fromJson(json as Map<String, dynamic>),
        );
        return BaseDynamicResponse(
          data: result.data,
          status: result.status,
          message: result.message,
          statusCode: result.statusCode,
        );
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }

  @override
  Future<BaseDynamicResponse<User?>> deletePlan({
    required String planId,
  }) async {
    try {
      var response = await NetworkClient.delete(
        endPoint: '${SubscriptionEndpoint.deletePlan}$planId',
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

  @override
  Future<BaseDynamicResponse<User?>> deactivatePlan({
    required String planId,
  }) async {
    try {
      var response = await NetworkClient.put(
        endPoint: '${SubscriptionEndpoint.deactivatePlan}$planId',
        body: {},
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

  @override
  Future<BaseDynamicResponse<User?>> activatePlan({
    required String planId,
  }) async {
    try {
      var response = await NetworkClient.put(
        endPoint: '${SubscriptionEndpoint.activatePlan}$planId',
        body: {},
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

  @override
  Future<BaseDynamicResponse<User?>> updateSubscription({
    required PlansResponseModel request,
  }) async {
    try {
      var response = await NetworkClient.put(
        endPoint: SubscriptionEndpoint.updatePlan,
        body: request.toJson(),
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

final subscriptionRemoteRepoProvider = Provider<SubscriptionRemoteRepo>(
  (ref) => SubscriptionRemoteRepo(),
);
