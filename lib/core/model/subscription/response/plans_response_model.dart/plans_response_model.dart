// ignore_for_file: invalid_annotation_target

import 'package:fotocolab_admin/core/model/subscription/create/create_subscription_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'plans_response_model.freezed.dart';
part 'plans_response_model.g.dart';

@freezed
class PlansResponseModel with _$PlansResponseModel {
  const factory PlansResponseModel({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "planId") String? planId,
    @JsonKey(name: "createdBy") String? createdBy,
    @JsonKey(name: "planName") String? planName,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "tagLine") String? tagLine,
    Features? features,
    @JsonKey(name: "duration") Duration? duration,
    bool? isActive,
    bool? isDeleted,
    String? deletedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PlansResponseModel;

  factory PlansResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlansResponseModelFromJson(json);
}
