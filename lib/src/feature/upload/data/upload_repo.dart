import 'package:file_picker/file_picker.dart';
import 'package:fotocolab_admin/core/model/base/base_dynamic_response_model.dart';
import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';
import 'package:fotocolab_admin/core/model/upload/request/category/upload_category_request_model.dart';
import 'package:fotocolab_admin/core/model/upload/response/category/upload_category_response_model.dart';

abstract class UploadRepo {
  Future<BaseDynamicResponse<List<UploadCategoryResponseModel?>>> getCategory();

  Future<BaseDynamicResponse<UploadCategoryResponseModel?>> createCategory({
    UploadCategoryRequestModel? request,
  });

  Future<BaseDynamicResponse<User?>> uploadFiles({
    required List<PlatformFile> file,
    required String categoryId,
    required String userType,
    required List<String> keywords,
  });
}
