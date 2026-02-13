// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_category_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadCategoryRequestModel _$UploadCategoryRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UploadCategoryRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UploadCategoryRequestModel {
  String? get categoryName => throw _privateConstructorUsedError;
  DateRage? get dateRange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadCategoryRequestModelCopyWith<UploadCategoryRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadCategoryRequestModelCopyWith<$Res> {
  factory $UploadCategoryRequestModelCopyWith(UploadCategoryRequestModel value,
          $Res Function(UploadCategoryRequestModel) then) =
      _$UploadCategoryRequestModelCopyWithImpl<$Res,
          UploadCategoryRequestModel>;
  @useResult
  $Res call({String? categoryName, DateRage? dateRange});

  $DateRageCopyWith<$Res>? get dateRange;
}

/// @nodoc
class _$UploadCategoryRequestModelCopyWithImpl<$Res,
        $Val extends UploadCategoryRequestModel>
    implements $UploadCategoryRequestModelCopyWith<$Res> {
  _$UploadCategoryRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = freezed,
    Object? dateRange = freezed,
  }) {
    return _then(_value.copyWith(
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DateRageCopyWith<$Res>? get dateRange {
    if (_value.dateRange == null) {
      return null;
    }

    return $DateRageCopyWith<$Res>(_value.dateRange!, (value) {
      return _then(_value.copyWith(dateRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UploadCategoryRequestModelImplCopyWith<$Res>
    implements $UploadCategoryRequestModelCopyWith<$Res> {
  factory _$$UploadCategoryRequestModelImplCopyWith(
          _$UploadCategoryRequestModelImpl value,
          $Res Function(_$UploadCategoryRequestModelImpl) then) =
      __$$UploadCategoryRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? categoryName, DateRage? dateRange});

  @override
  $DateRageCopyWith<$Res>? get dateRange;
}

/// @nodoc
class __$$UploadCategoryRequestModelImplCopyWithImpl<$Res>
    extends _$UploadCategoryRequestModelCopyWithImpl<$Res,
        _$UploadCategoryRequestModelImpl>
    implements _$$UploadCategoryRequestModelImplCopyWith<$Res> {
  __$$UploadCategoryRequestModelImplCopyWithImpl(
      _$UploadCategoryRequestModelImpl _value,
      $Res Function(_$UploadCategoryRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = freezed,
    Object? dateRange = freezed,
  }) {
    return _then(_$UploadCategoryRequestModelImpl(
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadCategoryRequestModelImpl implements _UploadCategoryRequestModel {
  const _$UploadCategoryRequestModelImpl({this.categoryName, this.dateRange});

  factory _$UploadCategoryRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UploadCategoryRequestModelImplFromJson(json);

  @override
  final String? categoryName;
  @override
  final DateRage? dateRange;

  @override
  String toString() {
    return 'UploadCategoryRequestModel(categoryName: $categoryName, dateRange: $dateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadCategoryRequestModelImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryName, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadCategoryRequestModelImplCopyWith<_$UploadCategoryRequestModelImpl>
      get copyWith => __$$UploadCategoryRequestModelImplCopyWithImpl<
          _$UploadCategoryRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadCategoryRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UploadCategoryRequestModel
    implements UploadCategoryRequestModel {
  const factory _UploadCategoryRequestModel(
      {final String? categoryName,
      final DateRage? dateRange}) = _$UploadCategoryRequestModelImpl;

  factory _UploadCategoryRequestModel.fromJson(Map<String, dynamic> json) =
      _$UploadCategoryRequestModelImpl.fromJson;

  @override
  String? get categoryName;
  @override
  DateRage? get dateRange;
  @override
  @JsonKey(ignore: true)
  _$$UploadCategoryRequestModelImplCopyWith<_$UploadCategoryRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DateRage _$DateRageFromJson(Map<String, dynamic> json) {
  return _DateRage.fromJson(json);
}

/// @nodoc
mixin _$DateRage {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateRageCopyWith<DateRage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateRageCopyWith<$Res> {
  factory $DateRageCopyWith(DateRage value, $Res Function(DateRage) then) =
      _$DateRageCopyWithImpl<$Res, DateRage>;
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class _$DateRageCopyWithImpl<$Res, $Val extends DateRage>
    implements $DateRageCopyWith<$Res> {
  _$DateRageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateRageImplCopyWith<$Res>
    implements $DateRageCopyWith<$Res> {
  factory _$$DateRageImplCopyWith(
          _$DateRageImpl value, $Res Function(_$DateRageImpl) then) =
      __$$DateRageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class __$$DateRageImplCopyWithImpl<$Res>
    extends _$DateRageCopyWithImpl<$Res, _$DateRageImpl>
    implements _$$DateRageImplCopyWith<$Res> {
  __$$DateRageImplCopyWithImpl(
      _$DateRageImpl _value, $Res Function(_$DateRageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$DateRageImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateRageImpl implements _DateRage {
  const _$DateRageImpl({this.from, this.to});

  factory _$DateRageImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateRageImplFromJson(json);

  @override
  final String? from;
  @override
  final String? to;

  @override
  String toString() {
    return 'DateRage(from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateRageImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateRageImplCopyWith<_$DateRageImpl> get copyWith =>
      __$$DateRageImplCopyWithImpl<_$DateRageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateRageImplToJson(
      this,
    );
  }
}

abstract class _DateRage implements DateRage {
  const factory _DateRage({final String? from, final String? to}) =
      _$DateRageImpl;

  factory _DateRage.fromJson(Map<String, dynamic> json) =
      _$DateRageImpl.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  @JsonKey(ignore: true)
  _$$DateRageImplCopyWith<_$DateRageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
