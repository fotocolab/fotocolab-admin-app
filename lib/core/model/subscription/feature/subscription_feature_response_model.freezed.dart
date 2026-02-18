// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_feature_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscriptionFeatureResponseModel _$SubscriptionFeatureResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SubscriptionFeatureResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionFeatureResponseModel {
  int get index => throw _privateConstructorUsedError;
  String get feature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionFeatureResponseModelCopyWith<SubscriptionFeatureResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionFeatureResponseModelCopyWith<$Res> {
  factory $SubscriptionFeatureResponseModelCopyWith(
          SubscriptionFeatureResponseModel value,
          $Res Function(SubscriptionFeatureResponseModel) then) =
      _$SubscriptionFeatureResponseModelCopyWithImpl<$Res,
          SubscriptionFeatureResponseModel>;
  @useResult
  $Res call({int index, String feature});
}

/// @nodoc
class _$SubscriptionFeatureResponseModelCopyWithImpl<$Res,
        $Val extends SubscriptionFeatureResponseModel>
    implements $SubscriptionFeatureResponseModelCopyWith<$Res> {
  _$SubscriptionFeatureResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? feature = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionFeatureResponseModelImplCopyWith<$Res>
    implements $SubscriptionFeatureResponseModelCopyWith<$Res> {
  factory _$$SubscriptionFeatureResponseModelImplCopyWith(
          _$SubscriptionFeatureResponseModelImpl value,
          $Res Function(_$SubscriptionFeatureResponseModelImpl) then) =
      __$$SubscriptionFeatureResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String feature});
}

/// @nodoc
class __$$SubscriptionFeatureResponseModelImplCopyWithImpl<$Res>
    extends _$SubscriptionFeatureResponseModelCopyWithImpl<$Res,
        _$SubscriptionFeatureResponseModelImpl>
    implements _$$SubscriptionFeatureResponseModelImplCopyWith<$Res> {
  __$$SubscriptionFeatureResponseModelImplCopyWithImpl(
      _$SubscriptionFeatureResponseModelImpl _value,
      $Res Function(_$SubscriptionFeatureResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? feature = null,
  }) {
    return _then(_$SubscriptionFeatureResponseModelImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionFeatureResponseModelImpl
    implements _SubscriptionFeatureResponseModel {
  const _$SubscriptionFeatureResponseModelImpl(
      {this.index = 0, this.feature = ''});

  factory _$SubscriptionFeatureResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SubscriptionFeatureResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final String feature;

  @override
  String toString() {
    return 'SubscriptionFeatureResponseModel(index: $index, feature: $feature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionFeatureResponseModelImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.feature, feature) || other.feature == feature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, feature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionFeatureResponseModelImplCopyWith<
          _$SubscriptionFeatureResponseModelImpl>
      get copyWith => __$$SubscriptionFeatureResponseModelImplCopyWithImpl<
          _$SubscriptionFeatureResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionFeatureResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionFeatureResponseModel
    implements SubscriptionFeatureResponseModel {
  const factory _SubscriptionFeatureResponseModel(
      {final int index,
      final String feature}) = _$SubscriptionFeatureResponseModelImpl;

  factory _SubscriptionFeatureResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$SubscriptionFeatureResponseModelImpl.fromJson;

  @override
  int get index;
  @override
  String get feature;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionFeatureResponseModelImplCopyWith<
          _$SubscriptionFeatureResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
