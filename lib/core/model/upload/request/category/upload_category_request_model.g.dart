// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_category_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadCategoryRequestModelImpl _$$UploadCategoryRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadCategoryRequestModelImpl(
      categoryName: json['categoryName'] as String?,
      dateRange: json['dateRange'] == null
          ? null
          : DateRage.fromJson(json['dateRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UploadCategoryRequestModelImplToJson(
        _$UploadCategoryRequestModelImpl instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'dateRange': instance.dateRange,
    };

_$DateRageImpl _$$DateRageImplFromJson(Map<String, dynamic> json) =>
    _$DateRageImpl(
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$$DateRageImplToJson(_$DateRageImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };
