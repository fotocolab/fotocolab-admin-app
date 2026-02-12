// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_category_response_model.freezed.dart';
part 'upload_category_response_model.g.dart';

@freezed
class UploadCategoryResponseModel with _$UploadCategoryResponseModel {
  const factory UploadCategoryResponseModel({
    String? categoryId,
    String? categoryName,
  }) = _UploadCategoryResponseModel;

  factory UploadCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadCategoryResponseModelFromJson(json);
}
