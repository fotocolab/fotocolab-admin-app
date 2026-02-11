// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_category_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadCategoryResponseModel _$UploadCategoryResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UploadCategoryResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UploadCategoryResponseModel {
  String? get categoryId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadCategoryResponseModelCopyWith<UploadCategoryResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadCategoryResponseModelCopyWith<$Res> {
  factory $UploadCategoryResponseModelCopyWith(
          UploadCategoryResponseModel value,
          $Res Function(UploadCategoryResponseModel) then) =
      _$UploadCategoryResponseModelCopyWithImpl<$Res,
          UploadCategoryResponseModel>;
  @useResult
  $Res call({String? categoryId, String? categoryName});
}

/// @nodoc
class _$UploadCategoryResponseModelCopyWithImpl<$Res,
        $Val extends UploadCategoryResponseModel>
    implements $UploadCategoryResponseModelCopyWith<$Res> {
  _$UploadCategoryResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadCategoryResponseModelImplCopyWith<$Res>
    implements $UploadCategoryResponseModelCopyWith<$Res> {
  factory _$$UploadCategoryResponseModelImplCopyWith(
          _$UploadCategoryResponseModelImpl value,
          $Res Function(_$UploadCategoryResponseModelImpl) then) =
      __$$UploadCategoryResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? categoryId, String? categoryName});
}

/// @nodoc
class __$$UploadCategoryResponseModelImplCopyWithImpl<$Res>
    extends _$UploadCategoryResponseModelCopyWithImpl<$Res,
        _$UploadCategoryResponseModelImpl>
    implements _$$UploadCategoryResponseModelImplCopyWith<$Res> {
  __$$UploadCategoryResponseModelImplCopyWithImpl(
      _$UploadCategoryResponseModelImpl _value,
      $Res Function(_$UploadCategoryResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$UploadCategoryResponseModelImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadCategoryResponseModelImpl
    implements _UploadCategoryResponseModel {
  const _$UploadCategoryResponseModelImpl({this.categoryId, this.categoryName});

  factory _$UploadCategoryResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UploadCategoryResponseModelImplFromJson(json);

  @override
  final String? categoryId;
  @override
  final String? categoryName;

  @override
  String toString() {
    return 'UploadCategoryResponseModel(categoryId: $categoryId, categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadCategoryResponseModelImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadCategoryResponseModelImplCopyWith<_$UploadCategoryResponseModelImpl>
      get copyWith => __$$UploadCategoryResponseModelImplCopyWithImpl<
          _$UploadCategoryResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadCategoryResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UploadCategoryResponseModel
    implements UploadCategoryResponseModel {
  const factory _UploadCategoryResponseModel(
      {final String? categoryId,
      final String? categoryName}) = _$UploadCategoryResponseModelImpl;

  factory _UploadCategoryResponseModel.fromJson(Map<String, dynamic> json) =
      _$UploadCategoryResponseModelImpl.fromJson;

  @override
  String? get categoryId;
  @override
  String? get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$UploadCategoryResponseModelImplCopyWith<_$UploadCategoryResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
