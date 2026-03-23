// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_title_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageTitleResponseModel _$ImageTitleResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ImageTitleResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ImageTitleResponseModel {
  @JsonKey(includeFromJson: false)
  PlatformFile? get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  LanguageEnum get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageTitleResponseModelCopyWith<ImageTitleResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTitleResponseModelCopyWith<$Res> {
  factory $ImageTitleResponseModelCopyWith(ImageTitleResponseModel value,
          $Res Function(ImageTitleResponseModel) then) =
      _$ImageTitleResponseModelCopyWithImpl<$Res, ImageTitleResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false) PlatformFile? image,
      String title,
      LanguageEnum language});
}

/// @nodoc
class _$ImageTitleResponseModelCopyWithImpl<$Res,
        $Val extends ImageTitleResponseModel>
    implements $ImageTitleResponseModelCopyWith<$Res> {
  _$ImageTitleResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? title = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as LanguageEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageTitleResponseModelImplCopyWith<$Res>
    implements $ImageTitleResponseModelCopyWith<$Res> {
  factory _$$ImageTitleResponseModelImplCopyWith(
          _$ImageTitleResponseModelImpl value,
          $Res Function(_$ImageTitleResponseModelImpl) then) =
      __$$ImageTitleResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false) PlatformFile? image,
      String title,
      LanguageEnum language});
}

/// @nodoc
class __$$ImageTitleResponseModelImplCopyWithImpl<$Res>
    extends _$ImageTitleResponseModelCopyWithImpl<$Res,
        _$ImageTitleResponseModelImpl>
    implements _$$ImageTitleResponseModelImplCopyWith<$Res> {
  __$$ImageTitleResponseModelImplCopyWithImpl(
      _$ImageTitleResponseModelImpl _value,
      $Res Function(_$ImageTitleResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? title = null,
    Object? language = null,
  }) {
    return _then(_$ImageTitleResponseModelImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as LanguageEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageTitleResponseModelImpl implements _ImageTitleResponseModel {
  const _$ImageTitleResponseModelImpl(
      {@JsonKey(includeFromJson: false) this.image,
      this.title = '',
      this.language = LanguageEnum.english});

  factory _$ImageTitleResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageTitleResponseModelImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false)
  final PlatformFile? image;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final LanguageEnum language;

  @override
  String toString() {
    return 'ImageTitleResponseModel(image: $image, title: $title, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageTitleResponseModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image, title, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageTitleResponseModelImplCopyWith<_$ImageTitleResponseModelImpl>
      get copyWith => __$$ImageTitleResponseModelImplCopyWithImpl<
          _$ImageTitleResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageTitleResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ImageTitleResponseModel implements ImageTitleResponseModel {
  const factory _ImageTitleResponseModel(
      {@JsonKey(includeFromJson: false) final PlatformFile? image,
      final String title,
      final LanguageEnum language}) = _$ImageTitleResponseModelImpl;

  factory _ImageTitleResponseModel.fromJson(Map<String, dynamic> json) =
      _$ImageTitleResponseModelImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false)
  PlatformFile? get image;
  @override
  String get title;
  @override
  LanguageEnum get language;
  @override
  @JsonKey(ignore: true)
  _$$ImageTitleResponseModelImplCopyWith<_$ImageTitleResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
