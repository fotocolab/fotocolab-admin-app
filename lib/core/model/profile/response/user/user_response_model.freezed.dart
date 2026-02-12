// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String? get userId => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber')
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get verificationStatus => throw _privateConstructorUsedError;
  bool? get isAvatar => throw _privateConstructorUsedError;
  bool? get isBankdetails => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  bool? get isPinExist => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get nationIdExpiry => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get ln => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
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
      String? ln});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? verificationStatus = freezed,
    Object? isAvatar = freezed,
    Object? isBankdetails = freezed,
    Object? gender = freezed,
    Object? isPinExist = freezed,
    Object? dob = freezed,
    Object? nationIdExpiry = freezed,
    Object? countryCode = freezed,
    Object? ln = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvatar: freezed == isAvatar
          ? _value.isAvatar
          : isAvatar // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBankdetails: freezed == isBankdetails
          ? _value.isBankdetails
          : isBankdetails // ignore: cast_nullable_to_non_nullable
              as bool?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      isPinExist: freezed == isPinExist
          ? _value.isPinExist
          : isPinExist // ignore: cast_nullable_to_non_nullable
              as bool?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nationIdExpiry: freezed == nationIdExpiry
          ? _value.nationIdExpiry
          : nationIdExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      ln: freezed == ln
          ? _value.ln
          : ln // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
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
      String? ln});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? verificationStatus = freezed,
    Object? isAvatar = freezed,
    Object? isBankdetails = freezed,
    Object? gender = freezed,
    Object? isPinExist = freezed,
    Object? dob = freezed,
    Object? nationIdExpiry = freezed,
    Object? countryCode = freezed,
    Object? ln = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvatar: freezed == isAvatar
          ? _value.isAvatar
          : isAvatar // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBankdetails: freezed == isBankdetails
          ? _value.isBankdetails
          : isBankdetails // ignore: cast_nullable_to_non_nullable
              as bool?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      isPinExist: freezed == isPinExist
          ? _value.isPinExist
          : isPinExist // ignore: cast_nullable_to_non_nullable
              as bool?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nationIdExpiry: freezed == nationIdExpiry
          ? _value.nationIdExpiry
          : nationIdExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      ln: freezed == ln
          ? _value.ln
          : ln // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'userId') this.userId,
      this.role,
      @JsonKey(name: 'phoneNumber') this.phone,
      this.email,
      this.fullName,
      this.verificationStatus,
      this.isAvatar,
      this.isBankdetails,
      this.gender,
      this.isPinExist,
      this.dob,
      this.nationIdExpiry,
      this.countryCode,
      this.ln});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'userId')
  final String? userId;
  @override
  final String? role;
  @override
  @JsonKey(name: 'phoneNumber')
  final String? phone;
  @override
  final String? email;
  @override
  final String? fullName;
  @override
  final String? verificationStatus;
  @override
  final bool? isAvatar;
  @override
  final bool? isBankdetails;
  @override
  final String? gender;
  @override
  final bool? isPinExist;
  @override
  final DateTime? dob;
  @override
  final DateTime? nationIdExpiry;
  @override
  final String? countryCode;
  @override
  final String? ln;

  @override
  String toString() {
    return 'User(id: $id, userId: $userId, role: $role, phone: $phone, email: $email, fullName: $fullName, verificationStatus: $verificationStatus, isAvatar: $isAvatar, isBankdetails: $isBankdetails, gender: $gender, isPinExist: $isPinExist, dob: $dob, nationIdExpiry: $nationIdExpiry, countryCode: $countryCode, ln: $ln)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.isAvatar, isAvatar) ||
                other.isAvatar == isAvatar) &&
            (identical(other.isBankdetails, isBankdetails) ||
                other.isBankdetails == isBankdetails) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isPinExist, isPinExist) ||
                other.isPinExist == isPinExist) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.nationIdExpiry, nationIdExpiry) ||
                other.nationIdExpiry == nationIdExpiry) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.ln, ln) || other.ln == ln));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      role,
      phone,
      email,
      fullName,
      verificationStatus,
      isAvatar,
      isBankdetails,
      gender,
      isPinExist,
      dob,
      nationIdExpiry,
      countryCode,
      ln);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'userId') final String? userId,
      final String? role,
      @JsonKey(name: 'phoneNumber') final String? phone,
      final String? email,
      final String? fullName,
      final String? verificationStatus,
      final bool? isAvatar,
      final bool? isBankdetails,
      final String? gender,
      final bool? isPinExist,
      final DateTime? dob,
      final DateTime? nationIdExpiry,
      final String? countryCode,
      final String? ln}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'userId')
  String? get userId;
  @override
  String? get role;
  @override
  @JsonKey(name: 'phoneNumber')
  String? get phone;
  @override
  String? get email;
  @override
  String? get fullName;
  @override
  String? get verificationStatus;
  @override
  bool? get isAvatar;
  @override
  bool? get isBankdetails;
  @override
  String? get gender;
  @override
  bool? get isPinExist;
  @override
  DateTime? get dob;
  @override
  DateTime? get nationIdExpiry;
  @override
  String? get countryCode;
  @override
  String? get ln;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
