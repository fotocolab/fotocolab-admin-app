// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'events_response_model.freezed.dart';
part 'events_response_model.g.dart';

@freezed
class EventsResponseModel with _$EventsResponseModel {
  const factory EventsResponseModel({
    String? eventName,
    DateTime? fromDate,
    DateTime? endDate,
  }) = _EventsResponseModel;

  factory EventsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseModelFromJson(json);
}
