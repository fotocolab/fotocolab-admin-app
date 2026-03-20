// ignore_for_file: invalid_annotation_target

import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_image_request_model.freezed.dart';
part 'upload_image_request_model.g.dart';

@freezed
class UploadImageRequestModel with _$UploadImageRequestModel {
  const factory UploadImageRequestModel({
    @JsonKey(includeToJson: false, includeFromJson: false) PlatformFile? image,
    @Default('english') String langauge,
  }) = _UploadImageRequestModel;

  factory UploadImageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UploadImageRequestModelFromJson(json);
}
