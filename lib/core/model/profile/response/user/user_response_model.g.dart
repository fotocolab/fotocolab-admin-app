// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      role: json['role'] as String?,
      phone: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      verificationStatus: json['verificationStatus'] as String?,
      isAvatar: json['isAvatar'] as bool?,
      isBankdetails: json['isBankdetails'] as bool?,
      gender: json['gender'] as String?,
      isPinExist: json['isPinExist'] as bool?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      nationIdExpiry: json['nationIdExpiry'] == null
          ? null
          : DateTime.parse(json['nationIdExpiry'] as String),
      countryCode: json['countryCode'] as String?,
      ln: json['ln'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'role': instance.role,
      'phoneNumber': instance.phone,
      'email': instance.email,
      'fullName': instance.fullName,
      'verificationStatus': instance.verificationStatus,
      'isAvatar': instance.isAvatar,
      'isBankdetails': instance.isBankdetails,
      'gender': instance.gender,
      'isPinExist': instance.isPinExist,
      'dob': instance.dob?.toIso8601String(),
      'nationIdExpiry': instance.nationIdExpiry?.toIso8601String(),
      'countryCode': instance.countryCode,
      'ln': instance.ln,
    };
