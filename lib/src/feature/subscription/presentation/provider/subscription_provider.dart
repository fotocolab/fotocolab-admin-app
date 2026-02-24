import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/subscription/create/create_subscription_request_model.dart';
import 'package:fotocolab_admin/core/model/subscription/response/plans_response_model.dart/plans_response_model.dart';
import 'package:fotocolab_admin/core/model/subscription/state/subscription_state.dart';
import 'package:fotocolab_admin/core/network/network_status.dart';
import 'package:fotocolab_admin/src/feature/subscription/data/subscription_remote_repo.dart';
import 'package:fotocolab_admin/util/enum/subscription_duration_enum.dart';

final subscriptionProvider =
    StateNotifierProvider<SubscriptionNotifierProvider, SubscriptionState>(
      (ref) => SubscriptionNotifierProvider(ref),
    );

class SubscriptionNotifierProvider extends StateNotifier<SubscriptionState> {
  SubscriptionNotifierProvider(this.ref) : super(const SubscriptionState());

  final Ref ref;

  SubscriptionDurationEnum? get selectedPlanDuration =>
      state.selectedPlanDurationEnum;

  bool get isSelectAllFeatures => state.isSelectAllFeatures;

  Features get features => state.features;

  List<PlansResponseModel> get plans => state.plans;

  bool get isDeletePlanLoading => state.isDeletePlanLoading;

  bool get isDeactivatePlanLoading => state.isDeactivatePlanLoading;

  bool get isUpdatePlanLoading => state.isUpdatePlanLoading;

  Future<void> getAllPlan() async {
    state = state.copyWith();

    var result = await ref.read(subscriptionRemoteRepoProvider).getAllPlans();
    if (result.status == ActionStatus.success.code) {
      state = state.copyWith(plans: result.data);
    } else {
      state = state.copyWith(plans: []);
    }
  }

  Future<bool> createSubscription({
    String? planName,
    String? price,
    String? tagline,
    String? perDayDownloads,
  }) async {
    var request = CreateSubscriptionRequestModel(
      duration: Duration(
        unit: selectedPlanDuration?.value,
        value: selectedPlanDuration?.duration,
      ),
      features: features.copyWith(
        perDayDownloads: int.tryParse(perDayDownloads.toString()) ?? 1,
      ),
      planName: planName,
      price: double.tryParse(price.toString()),
      tagLine: tagline,
    );
    var result = await ref
        .read(subscriptionRemoteRepoProvider)
        .createSubscription(request: request);

    if (result.status == ActionStatus.success.code) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deletePlan({String? planId}) async {
    if (planId == null) return false;
    state = state.copyWith(isDeletePlanLoading: true);
    var result = await ref
        .read(subscriptionRemoteRepoProvider)
        .deletePlan(planId: planId);
    state = state.copyWith(isDeletePlanLoading: false);

    if (result.status == ActionStatus.success.code) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deactivatePlan({String? planId}) async {
    if (planId == null) return false;

    state = state.copyWith(isDeactivatePlanLoading: true);

    var result = await ref
        .read(subscriptionRemoteRepoProvider)
        .deactivatePlan(planId: planId);

    state = state.copyWith(isDeactivatePlanLoading: false);

    if (result.status == ActionStatus.success.code) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> activatePlan({String? planId}) async {
    if (planId == null) return false;

    state = state.copyWith(isDeactivatePlanLoading: true);

    var result = await ref
        .read(subscriptionRemoteRepoProvider)
        .activatePlan(planId: planId);

    state = state.copyWith(isDeactivatePlanLoading: false);

    if (result.status == ActionStatus.success.code) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateSubscription({
    String? planName,
    String? price,
    String? tagline,
    String? perDayDownloads,
    String? planId,
  }) async {
    state = state.copyWith(isUpdatePlanLoading: true);
    var request = PlansResponseModel(
      planName: planName,
      tagLine: tagline,
      planId: planId,
      price: double.tryParse(price.toString()),
      duration: Duration(
        unit: selectedPlanDuration?.value,
        value: selectedPlanDuration?.duration,
      ),
      features: features.copyWith(
        perDayDownloads: int.tryParse(perDayDownloads.toString()) ?? 1,
      ),
    );
    var result = await ref
        .read(subscriptionRemoteRepoProvider)
        .updateSubscription(request: request);

    state = state.copyWith(isUpdatePlanLoading: false);

    if (result.status == ActionStatus.success.code) {
      return true;
    } else {
      return false;
    }
  }

  void updatedFeatures(String key) {
    var f = features.toJson();

    f[key] = !f[key];

    state = state.copyWith(features: Features.fromJson(f));
  }

  void selectAllFeatures() {
    var f = features;
    if (!isSelectAllFeatures) {
      f = f.copyWith(
        fontAccesibility: false,
        hideAds: false,
        noWatermark: false,
        perDayDownloads: 2,
        premiumFeeds: false,
        qualityDownload: false,
        unLimitedDownloads: false,
        updateLogo: false,
        updateSignature: false,
      );
    } else {
      f = f.copyWith(
        fontAccesibility: true,
        hideAds: true,
        noWatermark: true,
        perDayDownloads: 2,
        premiumFeeds: true,
        qualityDownload: true,
        unLimitedDownloads: true,
        updateLogo: true,
        updateSignature: true,
      );
    }

    state = state.copyWith(features: f);
  }

  set setselectedPlanDurationEnum(SubscriptionDurationEnum value) {
    state = state.copyWith(selectedPlanDurationEnum: value);
  }

  set setIsSelectAllFeatures(bool value) {
    state = state.copyWith(isSelectAllFeatures: value);
  }

  set setFeature(Features? value) {
    if (value == null) return;
    state = state.copyWith(features: value);
  }
}
