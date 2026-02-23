import 'package:fotocolab_admin/core/model/subscription/create/create_subscription_request_model.dart';
import 'package:fotocolab_admin/core/model/subscription/response/plans_response_model.dart/plans_response_model.dart';
import 'package:fotocolab_admin/util/enum/subscription_duration_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_state.freezed.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default(false) bool isLoading,
    SubscriptionDurationEnum? selectedPlanDurationEnum,
    @Default(
      Features(
        fontAccesibility: false,
        hideAds: false,
        noWatermark: false,
        perDayDownloads: 1,
        premiumFeeds: false,
        qualityDownload: false,
        unLimitedDownloads: false,
        updateLogo: false,
        updateSignature: false,
      ),
    )
    Features features,
    @Default(false) bool isSelectAllFeatures,
    @Default([]) List<PlansResponseModel> plans,
    @Default(false) bool isDeletePlanLoading,
    @Default(false) bool isDeactivatePlanLoading,
    @Default(false) bool isUpdatePlanLoading,
  }) = _SubscriptionState;
}
