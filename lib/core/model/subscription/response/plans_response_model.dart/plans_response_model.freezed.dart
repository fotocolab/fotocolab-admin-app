// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlansResponseModel _$PlansResponseModelFromJson(Map<String, dynamic> json) {
  return _PlansResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PlansResponseModel {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "planId")
  String? get planId => throw _privateConstructorUsedError;
  @JsonKey(name: "createdBy")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "planName")
  String? get planName => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "tagLine")
  String? get tagLine => throw _privateConstructorUsedError;
  Features? get features => throw _privateConstructorUsedError;
  @JsonKey(name: "duration")
  Duration? get duration => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  String? get deletedBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlansResponseModelCopyWith<PlansResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlansResponseModelCopyWith<$Res> {
  factory $PlansResponseModelCopyWith(
          PlansResponseModel value, $Res Function(PlansResponseModel) then) =
      _$PlansResponseModelCopyWithImpl<$Res, PlansResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
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
      DateTime? updatedAt});

  $FeaturesCopyWith<$Res>? get features;
  $DurationCopyWith<$Res>? get duration;
}

/// @nodoc
class _$PlansResponseModelCopyWithImpl<$Res, $Val extends PlansResponseModel>
    implements $PlansResponseModelCopyWith<$Res> {
  _$PlansResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? planId = freezed,
    Object? createdBy = freezed,
    Object? planName = freezed,
    Object? price = freezed,
    Object? tagLine = freezed,
    Object? features = freezed,
    Object? duration = freezed,
    Object? isActive = freezed,
    Object? isDeleted = freezed,
    Object? deletedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      planName: freezed == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      tagLine: freezed == tagLine
          ? _value.tagLine
          : tagLine // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Features?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      deletedBy: freezed == deletedBy
          ? _value.deletedBy
          : deletedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeaturesCopyWith<$Res>? get features {
    if (_value.features == null) {
      return null;
    }

    return $FeaturesCopyWith<$Res>(_value.features!, (value) {
      return _then(_value.copyWith(features: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationCopyWith<$Res>? get duration {
    if (_value.duration == null) {
      return null;
    }

    return $DurationCopyWith<$Res>(_value.duration!, (value) {
      return _then(_value.copyWith(duration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlansResponseModelImplCopyWith<$Res>
    implements $PlansResponseModelCopyWith<$Res> {
  factory _$$PlansResponseModelImplCopyWith(_$PlansResponseModelImpl value,
          $Res Function(_$PlansResponseModelImpl) then) =
      __$$PlansResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
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
      DateTime? updatedAt});

  @override
  $FeaturesCopyWith<$Res>? get features;
  @override
  $DurationCopyWith<$Res>? get duration;
}

/// @nodoc
class __$$PlansResponseModelImplCopyWithImpl<$Res>
    extends _$PlansResponseModelCopyWithImpl<$Res, _$PlansResponseModelImpl>
    implements _$$PlansResponseModelImplCopyWith<$Res> {
  __$$PlansResponseModelImplCopyWithImpl(_$PlansResponseModelImpl _value,
      $Res Function(_$PlansResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? planId = freezed,
    Object? createdBy = freezed,
    Object? planName = freezed,
    Object? price = freezed,
    Object? tagLine = freezed,
    Object? features = freezed,
    Object? duration = freezed,
    Object? isActive = freezed,
    Object? isDeleted = freezed,
    Object? deletedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PlansResponseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      planName: freezed == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      tagLine: freezed == tagLine
          ? _value.tagLine
          : tagLine // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Features?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      deletedBy: freezed == deletedBy
          ? _value.deletedBy
          : deletedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlansResponseModelImpl implements _PlansResponseModel {
  const _$PlansResponseModelImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "planId") this.planId,
      @JsonKey(name: "createdBy") this.createdBy,
      @JsonKey(name: "planName") this.planName,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "tagLine") this.tagLine,
      this.features,
      @JsonKey(name: "duration") this.duration,
      this.isActive,
      this.isDeleted,
      this.deletedBy,
      this.createdAt,
      this.updatedAt});

  factory _$PlansResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlansResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "planId")
  final String? planId;
  @override
  @JsonKey(name: "createdBy")
  final String? createdBy;
  @override
  @JsonKey(name: "planName")
  final String? planName;
  @override
  @JsonKey(name: "price")
  final double? price;
  @override
  @JsonKey(name: "tagLine")
  final String? tagLine;
  @override
  final Features? features;
  @override
  @JsonKey(name: "duration")
  final Duration? duration;
  @override
  final bool? isActive;
  @override
  final bool? isDeleted;
  @override
  final String? deletedBy;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PlansResponseModel(id: $id, planId: $planId, createdBy: $createdBy, planName: $planName, price: $price, tagLine: $tagLine, features: $features, duration: $duration, isActive: $isActive, isDeleted: $isDeleted, deletedBy: $deletedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlansResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.tagLine, tagLine) || other.tagLine == tagLine) &&
            (identical(other.features, features) ||
                other.features == features) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.deletedBy, deletedBy) ||
                other.deletedBy == deletedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      planId,
      createdBy,
      planName,
      price,
      tagLine,
      features,
      duration,
      isActive,
      isDeleted,
      deletedBy,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlansResponseModelImplCopyWith<_$PlansResponseModelImpl> get copyWith =>
      __$$PlansResponseModelImplCopyWithImpl<_$PlansResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlansResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PlansResponseModel implements PlansResponseModel {
  const factory _PlansResponseModel(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "planId") final String? planId,
      @JsonKey(name: "createdBy") final String? createdBy,
      @JsonKey(name: "planName") final String? planName,
      @JsonKey(name: "price") final double? price,
      @JsonKey(name: "tagLine") final String? tagLine,
      final Features? features,
      @JsonKey(name: "duration") final Duration? duration,
      final bool? isActive,
      final bool? isDeleted,
      final String? deletedBy,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PlansResponseModelImpl;

  factory _PlansResponseModel.fromJson(Map<String, dynamic> json) =
      _$PlansResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "planId")
  String? get planId;
  @override
  @JsonKey(name: "createdBy")
  String? get createdBy;
  @override
  @JsonKey(name: "planName")
  String? get planName;
  @override
  @JsonKey(name: "price")
  double? get price;
  @override
  @JsonKey(name: "tagLine")
  String? get tagLine;
  @override
  Features? get features;
  @override
  @JsonKey(name: "duration")
  Duration? get duration;
  @override
  bool? get isActive;
  @override
  bool? get isDeleted;
  @override
  String? get deletedBy;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PlansResponseModelImplCopyWith<_$PlansResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
