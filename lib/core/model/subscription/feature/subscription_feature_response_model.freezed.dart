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
  int get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get displayValue => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;

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
  $Res call({int id, String key, String displayValue, bool value});
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
    Object? id = null,
    Object? key = null,
    Object? displayValue = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      displayValue: null == displayValue
          ? _value.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({int id, String key, String displayValue, bool value});
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
    Object? id = null,
    Object? key = null,
    Object? displayValue = null,
    Object? value = null,
  }) {
    return _then(_$SubscriptionFeatureResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      displayValue: null == displayValue
          ? _value.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionFeatureResponseModelImpl
    implements _SubscriptionFeatureResponseModel {
  const _$SubscriptionFeatureResponseModelImpl(
      {required this.id,
      required this.key,
      required this.displayValue,
      this.value = false});

  factory _$SubscriptionFeatureResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SubscriptionFeatureResponseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String key;
  @override
  final String displayValue;
  @override
  @JsonKey()
  final bool value;

  @override
  String toString() {
    return 'SubscriptionFeatureResponseModel(id: $id, key: $key, displayValue: $displayValue, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionFeatureResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.displayValue, displayValue) ||
                other.displayValue == displayValue) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, key, displayValue, value);

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
      {required final int id,
      required final String key,
      required final String displayValue,
      final bool value}) = _$SubscriptionFeatureResponseModelImpl;

  factory _SubscriptionFeatureResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$SubscriptionFeatureResponseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get key;
  @override
  String get displayValue;
  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionFeatureResponseModelImplCopyWith<
          _$SubscriptionFeatureResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
