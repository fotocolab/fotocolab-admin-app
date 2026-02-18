// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_feature_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionFeatureResponseModelImpl
    _$$SubscriptionFeatureResponseModelImplFromJson(
            Map<String, dynamic> json) =>
        _$SubscriptionFeatureResponseModelImpl(
          index: (json['index'] as num?)?.toInt() ?? 0,
          feature: json['feature'] as String? ?? '',
        );

Map<String, dynamic> _$$SubscriptionFeatureResponseModelImplToJson(
        _$SubscriptionFeatureResponseModelImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'feature': instance.feature,
    };
