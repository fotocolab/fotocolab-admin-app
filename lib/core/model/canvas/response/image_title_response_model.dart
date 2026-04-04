// ignore_for_file: invalid_annotation_target

import 'package:file_picker/file_picker.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_title_response_model.freezed.dart';
part 'image_title_response_model.g.dart';

@freezed
class ImageTitleResponseModel with _$ImageTitleResponseModel {
  const factory ImageTitleResponseModel({
    @JsonKey(includeFromJson: false) PlatformFile? image,
    @Default('') String title,
    @Default(LanguageEnum.english) LanguageEnum language,
    @JsonKey(includeFromJson: false) PlatformFile? audio,
  }) = _ImageTitleResponseModel;

  factory ImageTitleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ImageTitleResponseModelFromJson(json);
}
