// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_subscription_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSubscriptionRequestModelImpl
    _$$CreateSubscriptionRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$CreateSubscriptionRequestModelImpl(
          planName: json['planName'] as String?,
          price: (json['price'] as num?)?.toDouble(),
          duration: json['duration'] == null
              ? null
              : Duration.fromJson(json['duration'] as Map<String, dynamic>),
          tagLine: json['tagLine'] as String?,
          features: json['features'] == null
              ? null
              : Features.fromJson(json['features'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$CreateSubscriptionRequestModelImplToJson(
        _$CreateSubscriptionRequestModelImpl instance) =>
    <String, dynamic>{
      'planName': instance.planName,
      'price': instance.price,
      'duration': instance.duration,
      'tagLine': instance.tagLine,
      'features': instance.features,
    };

_$DurationImpl _$$DurationImplFromJson(Map<String, dynamic> json) =>
    _$DurationImpl(
      value: (json['value'] as num?)?.toInt(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$DurationImplToJson(_$DurationImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

_$FeaturesImpl _$$FeaturesImplFromJson(Map<String, dynamic> json) =>
    _$FeaturesImpl(
      premiumFeeds: json['premiumFeeds'] as bool? ?? false,
      qualityDownload: json['qualityDownload'] as bool? ?? false,
      noWatermark: json['noWatermark'] as bool? ?? false,
      unlimitedDownloads: json['unlimitedDownloads'] as bool? ?? false,
      perDayDownloads: (json['perDayDownloads'] as num?)?.toInt() ?? 1,
      hideAds: json['hideAds'] as bool? ?? false,
      fontAccesibility: json['fontAccesibility'] as bool? ?? false,
      updateLogo: json['updateLogo'] as bool? ?? false,
      updateSignature: json['updateSignature'] as bool? ?? false,
    );

Map<String, dynamic> _$$FeaturesImplToJson(_$FeaturesImpl instance) =>
    <String, dynamic>{
      'premiumFeeds': instance.premiumFeeds,
      'qualityDownload': instance.qualityDownload,
      'noWatermark': instance.noWatermark,
      'unlimitedDownloads': instance.unlimitedDownloads,
      'perDayDownloads': instance.perDayDownloads,
      'hideAds': instance.hideAds,
      'fontAccesibility': instance.fontAccesibility,
      'updateLogo': instance.updateLogo,
      'updateSignature': instance.updateSignature,
    };
