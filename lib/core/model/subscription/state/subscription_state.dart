import 'package:fotocolab_admin/core/model/subscription/feature/subscription_feature_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_state.freezed.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default(false) bool isLoading,
    @Default([
      SubscriptionFeatureResponseModel(index: 0, feature: ''),
      SubscriptionFeatureResponseModel(index: 1, feature: ''),
    ])
    List<SubscriptionFeatureResponseModel> featuresList,
  }) = _SubscriptionState;
}
