// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_category_request_model.freezed.dart';
part 'upload_category_request_model.g.dart';

@freezed
class UploadCategoryRequestModel with _$UploadCategoryRequestModel {
  const factory UploadCategoryRequestModel({
    String? categoryName,
    DateRage? dateRange,
  }) = _UploadCategoryRequestModel;

  factory UploadCategoryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UploadCategoryRequestModelFromJson(json);
}

@freezed
class DateRage with _$DateRage {
  const factory DateRage({String? from, String? to}) = _DateRage;

  factory DateRage.fromJson(Map<String, dynamic> json) =>
      _$DateRageFromJson(json);
}
