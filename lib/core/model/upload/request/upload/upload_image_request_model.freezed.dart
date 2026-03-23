// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_image_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadImageRequestModel _$UploadImageRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UploadImageRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UploadImageRequestModel {
  @JsonKey(includeToJson: false, includeFromJson: false)
  PlatformFile? get image => throw _privateConstructorUsedError;
  String get langauge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadImageRequestModelCopyWith<UploadImageRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadImageRequestModelCopyWith<$Res> {
  factory $UploadImageRequestModelCopyWith(UploadImageRequestModel value,
          $Res Function(UploadImageRequestModel) then) =
      _$UploadImageRequestModelCopyWithImpl<$Res, UploadImageRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: false)
      PlatformFile? image,
      String langauge});
}

/// @nodoc
class _$UploadImageRequestModelCopyWithImpl<$Res,
        $Val extends UploadImageRequestModel>
    implements $UploadImageRequestModelCopyWith<$Res> {
  _$UploadImageRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? langauge = null,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      langauge: null == langauge
          ? _value.langauge
          : langauge // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadImageRequestModelImplCopyWith<$Res>
    implements $UploadImageRequestModelCopyWith<$Res> {
  factory _$$UploadImageRequestModelImplCopyWith(
          _$UploadImageRequestModelImpl value,
          $Res Function(_$UploadImageRequestModelImpl) then) =
      __$$UploadImageRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: false)
      PlatformFile? image,
      String langauge});
}

/// @nodoc
class __$$UploadImageRequestModelImplCopyWithImpl<$Res>
    extends _$UploadImageRequestModelCopyWithImpl<$Res,
        _$UploadImageRequestModelImpl>
    implements _$$UploadImageRequestModelImplCopyWith<$Res> {
  __$$UploadImageRequestModelImplCopyWithImpl(
      _$UploadImageRequestModelImpl _value,
      $Res Function(_$UploadImageRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? langauge = null,
  }) {
    return _then(_$UploadImageRequestModelImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      langauge: null == langauge
          ? _value.langauge
          : langauge // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadImageRequestModelImpl implements _UploadImageRequestModel {
  const _$UploadImageRequestModelImpl(
      {@JsonKey(includeToJson: false, includeFromJson: false) this.image,
      this.langauge = 'english'});

  factory _$UploadImageRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadImageRequestModelImplFromJson(json);

  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final PlatformFile? image;
  @override
  @JsonKey()
  final String langauge;

  @override
  String toString() {
    return 'UploadImageRequestModel(image: $image, langauge: $langauge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadImageRequestModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.langauge, langauge) ||
                other.langauge == langauge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image, langauge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadImageRequestModelImplCopyWith<_$UploadImageRequestModelImpl>
      get copyWith => __$$UploadImageRequestModelImplCopyWithImpl<
          _$UploadImageRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadImageRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UploadImageRequestModel implements UploadImageRequestModel {
  const factory _UploadImageRequestModel(
      {@JsonKey(includeToJson: false, includeFromJson: false)
      final PlatformFile? image,
      final String langauge}) = _$UploadImageRequestModelImpl;

  factory _UploadImageRequestModel.fromJson(Map<String, dynamic> json) =
      _$UploadImageRequestModelImpl.fromJson;

  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  PlatformFile? get image;
  @override
  String get langauge;
  @override
  @JsonKey(ignore: true)
  _$$UploadImageRequestModelImplCopyWith<_$UploadImageRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
