// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 16/10/2025

import 'package:file_picker/file_picker.dart';
import 'package:fotocolab_admin/core/model/upload/response/category/upload_category_response_model.dart';
import 'package:fotocolab_admin/util/enum/upload_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_state.freezed.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState({
    @Default(UploadEnum.free) UploadEnum selectedUploadType,
    @Default([]) List<PlatformFile> selectedFiles,
    @Default([]) List<UploadCategoryResponseModel> uploadCategory,
    UploadCategoryResponseModel? selectedUploadCategory,
    @Default(false) bool isCategoryLoading,
    @Default(false) bool isUploading,
    @Default(false) bool isCreateCategoryLoading,
    @Default([]) List<String> keywords,
    DateTime? selectedFromDate,
    DateTime? selectedToDate,
  }) = _UploadState;
}
