import 'package:fotocolab_admin/core/model/base/base_dynamic_response_model.dart';
import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';
import 'package:fotocolab_admin/core/model/subscription/create/create_subscription_request_model.dart';
import 'package:fotocolab_admin/core/model/subscription/response/plans_response_model.dart/plans_response_model.dart';

abstract class SubscriptionRepo {
  Future<BaseDynamicResponse<User?>> createSubscription({
    required CreateSubscriptionRequestModel request,
  });

  Future<BaseDynamicResponse<List<PlansResponseModel>?>> getAllPlans();

  Future<BaseDynamicResponse<User?>> deletePlan({required String planId});

  Future<BaseDynamicResponse<User?>> deactivatePlan({required String planId});

  Future<BaseDynamicResponse<User?>> activatePlan({required String planId});

  Future<BaseDynamicResponse<User?>> updateSubscription({
    required PlansResponseModel request,
  });
}
