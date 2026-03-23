import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/base/base_dynamic_response_model.dart';
import 'package:fotocolab_admin/core/model/profile/response/user/user_response_model.dart';
import 'package:fotocolab_admin/core/model/upload/request/category/upload_category_request_model.dart';
import 'package:fotocolab_admin/core/model/upload/request/upload/upload_image_request_model.dart';
import 'package:fotocolab_admin/core/model/upload/response/category/upload_category_response_model.dart';
import 'package:fotocolab_admin/core/network/endpoints/upload_endpoint.dart';
import 'package:fotocolab_admin/core/network/network.dart';
import 'package:fotocolab_admin/core/network/network_status.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/src/feature/upload/data/upload_repo.dart';
import 'package:fotocolab_admin/util/enum/http_enum.dart';

class UploadRemoteRepo implements UploadRepo {
  @override
  Future<BaseDynamicResponse<List<UploadCategoryResponseModel?>>>
  getCategory() async {
    try {
      var response = await NetworkClient.get(
        endPoint: UploadEndpoint.getCategory,
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);

        var result = BaseDynamicResponse<UploadCategoryResponseModel>.fromJson(
          body,

          (json) => UploadCategoryResponseModel.fromJson(
            json as Map<String, dynamic>,
          ),
        );
        return BaseDynamicResponse(
          data: result.data,
          status: result.status,
          message: result.message,
          statusCode: result.statusCode,
        );
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }

  @override
  Future<BaseDynamicResponse<UploadCategoryResponseModel?>> createCategory({
    UploadCategoryRequestModel? request,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: UploadEndpoint.createCategory,
        body: request,
      );
      if (response?.statusCode == NetworkStatus.status201.statusCode) {
        var body = json.decode(response!.body);

        var result = BaseDynamicResponse<UploadCategoryResponseModel?>.fromJson(
          body,
          (json) => UploadCategoryResponseModel.fromJson(
            json as Map<String, dynamic>,
          ),
        );
        return result;
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }

  @override
  Future<BaseDynamicResponse<User?>> uploadFiles({
    required List<UploadImageRequestModel> file,
    required String categoryId,
    required String userType,
    required List<String> keywords,
  }) async {
    try {
      var response = await NetworkClient.multiPart(
        httpMethodEnum: HttpMethodEnum.post,
        endPoint: UploadEndpoint.uploadSingle,
        body: {
          "categoryId": categoryId,
          "userType": userType,
          'keywords': keywords.join(','),
          "languages": file.map((e) => e.langauge).toList().join(','),
        },
        files: file.map((e) => e.image!).toList(),
        documentKey: List.generate(file.length, (i) => 'files'),
      );

      if (response?.statusCode == NetworkStatus.status201.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<User>.fromJson(
          body,
          (json) => User.fromJson(json as Map<String, dynamic>),
        );
        return result;
      }
    } catch (e) {
      NavigationService.showErrorSnackbar();
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }
}

final uploadRemoteRepoProvider = Provider<UploadRemoteRepo>(
  (ref) => UploadRemoteRepo(),
);
