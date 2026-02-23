// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_feature_response_model.freezed.dart';
part 'subscription_feature_response_model.g.dart';

@freezed
class SubscriptionFeatureResponseModel with _$SubscriptionFeatureResponseModel {
  const factory SubscriptionFeatureResponseModel({
    required int id,
    required String key,
    required String displayValue,
    @Default(false) bool value,
  }) = _SubscriptionFeatureResponseModel;

  factory SubscriptionFeatureResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$SubscriptionFeatureResponseModelFromJson(json);
}
