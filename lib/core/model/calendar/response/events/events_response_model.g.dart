// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsResponseModelImpl _$$EventsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventsResponseModelImpl(
      eventName: json['eventName'] as String?,
      fromDate: json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$EventsResponseModelImplToJson(
        _$EventsResponseModelImpl instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'fromDate': instance.fromDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };
