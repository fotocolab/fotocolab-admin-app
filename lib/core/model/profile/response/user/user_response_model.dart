// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_response_model.freezed.dart';
part 'user_response_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'userId') String? userId,
    String? role,
    @JsonKey(name: 'phoneNumber') String? phone,
    String? email,
    String? fullName,
    String? verificationStatus,
    bool? isAvatar,
    bool? isBankdetails,
    String? gender,
    bool? isPinExist,
    DateTime? dob,
    DateTime? nationIdExpiry,
    String? countryCode,
    String? ln,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
