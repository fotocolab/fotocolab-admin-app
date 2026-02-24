// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_feature_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionFeatureResponseModelImpl
    _$$SubscriptionFeatureResponseModelImplFromJson(
            Map<String, dynamic> json) =>
        _$SubscriptionFeatureResponseModelImpl(
          id: (json['id'] as num).toInt(),
          key: json['key'] as String,
          displayValue: json['displayValue'] as String,
          value: json['value'] as bool? ?? false,
        );

Map<String, dynamic> _$$SubscriptionFeatureResponseModelImplToJson(
        _$SubscriptionFeatureResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'displayValue': instance.displayValue,
      'value': instance.value,
    };
