// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlansResponseModelImpl _$$PlansResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlansResponseModelImpl(
      id: json['_id'] as String?,
      planId: json['planId'] as String?,
      createdBy: json['createdBy'] as String?,
      planName: json['planName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      tagLine: json['tagLine'] as String?,
      features: json['features'] == null
          ? null
          : Features.fromJson(json['features'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : Duration.fromJson(json['duration'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      deletedBy: json['deletedBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PlansResponseModelImplToJson(
        _$PlansResponseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'planId': instance.planId,
      'createdBy': instance.createdBy,
      'planName': instance.planName,
      'price': instance.price,
      'tagLine': instance.tagLine,
      'features': instance.features,
      'duration': instance.duration,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'deletedBy': instance.deletedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
