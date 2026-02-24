// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_subscription_request_model.freezed.dart';
part 'create_subscription_request_model.g.dart';

@freezed
class CreateSubscriptionRequestModel with _$CreateSubscriptionRequestModel {
  const factory CreateSubscriptionRequestModel({
    @JsonKey(name: "planName") String? planName,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "duration") Duration? duration,
    @JsonKey(name: "tagLine") String? tagLine,
    Features? features,
  }) = _CreateSubscriptionRequestModel;

  factory CreateSubscriptionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionRequestModelFromJson(json);
}

@freezed
class Duration with _$Duration {
  const factory Duration({
    @JsonKey(name: "value") int? value,
    @JsonKey(name: "unit") String? unit,
  }) = _Duration;

  factory Duration.fromJson(Map<String, dynamic> json) =>
      _$DurationFromJson(json);
}

@freezed
class Features with _$Features {
  const factory Features({
    @Default(false) bool premiumFeeds,
    @Default(false) bool qualityDownload,
    @Default(false) bool noWatermark,
    @Default(false) bool unlimitedDownloads,
    @Default(1) int perDayDownloads,
    @Default(false) bool hideAds,
    @Default(false) bool fontAccesibility,
    @Default(false) bool updateLogo,
    @Default(false) bool updateSignature,
  }) = _Features;

  factory Features.fromJson(Map<String, dynamic> json) =>
      _$FeaturesFromJson(json);
}
