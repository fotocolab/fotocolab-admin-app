// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_subscription_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateSubscriptionRequestModel _$CreateSubscriptionRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateSubscriptionRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateSubscriptionRequestModel {
  @JsonKey(name: "planName")
  String? get planName => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "duration")
  Duration? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: "tagLine")
  String? get tagLine => throw _privateConstructorUsedError;
  Features? get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateSubscriptionRequestModelCopyWith<CreateSubscriptionRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSubscriptionRequestModelCopyWith<$Res> {
  factory $CreateSubscriptionRequestModelCopyWith(
          CreateSubscriptionRequestModel value,
          $Res Function(CreateSubscriptionRequestModel) then) =
      _$CreateSubscriptionRequestModelCopyWithImpl<$Res,
          CreateSubscriptionRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "planName") String? planName,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "duration") Duration? duration,
      @JsonKey(name: "tagLine") String? tagLine,
      Features? features});

  $DurationCopyWith<$Res>? get duration;
  $FeaturesCopyWith<$Res>? get features;
}

/// @nodoc
class _$CreateSubscriptionRequestModelCopyWithImpl<$Res,
        $Val extends CreateSubscriptionRequestModel>
    implements $CreateSubscriptionRequestModelCopyWith<$Res> {
  _$CreateSubscriptionRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planName = freezed,
    Object? price = freezed,
    Object? duration = freezed,
    Object? tagLine = freezed,
    Object? features = freezed,
  }) {
    return _then(_value.copyWith(
      planName: freezed == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      tagLine: freezed == tagLine
          ? _value.tagLine
          : tagLine // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Features?,
    ) as $Val);
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
}

/// @nodoc
abstract class _$$CreateSubscriptionRequestModelImplCopyWith<$Res>
    implements $CreateSubscriptionRequestModelCopyWith<$Res> {
  factory _$$CreateSubscriptionRequestModelImplCopyWith(
          _$CreateSubscriptionRequestModelImpl value,
          $Res Function(_$CreateSubscriptionRequestModelImpl) then) =
      __$$CreateSubscriptionRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "planName") String? planName,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "duration") Duration? duration,
      @JsonKey(name: "tagLine") String? tagLine,
      Features? features});

  @override
  $DurationCopyWith<$Res>? get duration;
  @override
  $FeaturesCopyWith<$Res>? get features;
}

/// @nodoc
class __$$CreateSubscriptionRequestModelImplCopyWithImpl<$Res>
    extends _$CreateSubscriptionRequestModelCopyWithImpl<$Res,
        _$CreateSubscriptionRequestModelImpl>
    implements _$$CreateSubscriptionRequestModelImplCopyWith<$Res> {
  __$$CreateSubscriptionRequestModelImplCopyWithImpl(
      _$CreateSubscriptionRequestModelImpl _value,
      $Res Function(_$CreateSubscriptionRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planName = freezed,
    Object? price = freezed,
    Object? duration = freezed,
    Object? tagLine = freezed,
    Object? features = freezed,
  }) {
    return _then(_$CreateSubscriptionRequestModelImpl(
      planName: freezed == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      tagLine: freezed == tagLine
          ? _value.tagLine
          : tagLine // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Features?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSubscriptionRequestModelImpl
    implements _CreateSubscriptionRequestModel {
  const _$CreateSubscriptionRequestModelImpl(
      {@JsonKey(name: "planName") this.planName,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "duration") this.duration,
      @JsonKey(name: "tagLine") this.tagLine,
      this.features});

  factory _$CreateSubscriptionRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateSubscriptionRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "planName")
  final String? planName;
  @override
  @JsonKey(name: "price")
  final double? price;
  @override
  @JsonKey(name: "duration")
  final Duration? duration;
  @override
  @JsonKey(name: "tagLine")
  final String? tagLine;
  @override
  final Features? features;

  @override
  String toString() {
    return 'CreateSubscriptionRequestModel(planName: $planName, price: $price, duration: $duration, tagLine: $tagLine, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSubscriptionRequestModelImpl &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.tagLine, tagLine) || other.tagLine == tagLine) &&
            (identical(other.features, features) ||
                other.features == features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, planName, price, duration, tagLine, features);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSubscriptionRequestModelImplCopyWith<
          _$CreateSubscriptionRequestModelImpl>
      get copyWith => __$$CreateSubscriptionRequestModelImplCopyWithImpl<
          _$CreateSubscriptionRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSubscriptionRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateSubscriptionRequestModel
    implements CreateSubscriptionRequestModel {
  const factory _CreateSubscriptionRequestModel(
      {@JsonKey(name: "planName") final String? planName,
      @JsonKey(name: "price") final double? price,
      @JsonKey(name: "duration") final Duration? duration,
      @JsonKey(name: "tagLine") final String? tagLine,
      final Features? features}) = _$CreateSubscriptionRequestModelImpl;

  factory _CreateSubscriptionRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateSubscriptionRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "planName")
  String? get planName;
  @override
  @JsonKey(name: "price")
  double? get price;
  @override
  @JsonKey(name: "duration")
  Duration? get duration;
  @override
  @JsonKey(name: "tagLine")
  String? get tagLine;
  @override
  Features? get features;
  @override
  @JsonKey(ignore: true)
  _$$CreateSubscriptionRequestModelImplCopyWith<
          _$CreateSubscriptionRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Duration _$DurationFromJson(Map<String, dynamic> json) {
  return _Duration.fromJson(json);
}

/// @nodoc
mixin _$Duration {
  @JsonKey(name: "value")
  int? get value => throw _privateConstructorUsedError;
  @JsonKey(name: "unit")
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationCopyWith<Duration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationCopyWith<$Res> {
  factory $DurationCopyWith(Duration value, $Res Function(Duration) then) =
      _$DurationCopyWithImpl<$Res, Duration>;
  @useResult
  $Res call(
      {@JsonKey(name: "value") int? value,
      @JsonKey(name: "unit") String? unit});
}

/// @nodoc
class _$DurationCopyWithImpl<$Res, $Val extends Duration>
    implements $DurationCopyWith<$Res> {
  _$DurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DurationImplCopyWith<$Res>
    implements $DurationCopyWith<$Res> {
  factory _$$DurationImplCopyWith(
          _$DurationImpl value, $Res Function(_$DurationImpl) then) =
      __$$DurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "value") int? value,
      @JsonKey(name: "unit") String? unit});
}

/// @nodoc
class __$$DurationImplCopyWithImpl<$Res>
    extends _$DurationCopyWithImpl<$Res, _$DurationImpl>
    implements _$$DurationImplCopyWith<$Res> {
  __$$DurationImplCopyWithImpl(
      _$DurationImpl _value, $Res Function(_$DurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$DurationImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DurationImpl implements _Duration {
  const _$DurationImpl(
      {@JsonKey(name: "value") this.value, @JsonKey(name: "unit") this.unit});

  factory _$DurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DurationImplFromJson(json);

  @override
  @JsonKey(name: "value")
  final int? value;
  @override
  @JsonKey(name: "unit")
  final String? unit;

  @override
  String toString() {
    return 'Duration(value: $value, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DurationImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DurationImplCopyWith<_$DurationImpl> get copyWith =>
      __$$DurationImplCopyWithImpl<_$DurationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationImplToJson(
      this,
    );
  }
}

abstract class _Duration implements Duration {
  const factory _Duration(
      {@JsonKey(name: "value") final int? value,
      @JsonKey(name: "unit") final String? unit}) = _$DurationImpl;

  factory _Duration.fromJson(Map<String, dynamic> json) =
      _$DurationImpl.fromJson;

  @override
  @JsonKey(name: "value")
  int? get value;
  @override
  @JsonKey(name: "unit")
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$DurationImplCopyWith<_$DurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Features _$FeaturesFromJson(Map<String, dynamic> json) {
  return _Features.fromJson(json);
}

/// @nodoc
mixin _$Features {
  bool get premiumFeeds => throw _privateConstructorUsedError;
  bool get qualityDownload => throw _privateConstructorUsedError;
  bool get noWatermark => throw _privateConstructorUsedError;
  bool get unlimitedDownloads => throw _privateConstructorUsedError;
  int get perDayDownloads => throw _privateConstructorUsedError;
  bool get hideAds => throw _privateConstructorUsedError;
  bool get fontAccesibility => throw _privateConstructorUsedError;
  bool get updateLogo => throw _privateConstructorUsedError;
  bool get updateSignature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturesCopyWith<Features> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturesCopyWith<$Res> {
  factory $FeaturesCopyWith(Features value, $Res Function(Features) then) =
      _$FeaturesCopyWithImpl<$Res, Features>;
  @useResult
  $Res call(
      {bool premiumFeeds,
      bool qualityDownload,
      bool noWatermark,
      bool unlimitedDownloads,
      int perDayDownloads,
      bool hideAds,
      bool fontAccesibility,
      bool updateLogo,
      bool updateSignature});
}

/// @nodoc
class _$FeaturesCopyWithImpl<$Res, $Val extends Features>
    implements $FeaturesCopyWith<$Res> {
  _$FeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? premiumFeeds = null,
    Object? qualityDownload = null,
    Object? noWatermark = null,
    Object? unlimitedDownloads = null,
    Object? perDayDownloads = null,
    Object? hideAds = null,
    Object? fontAccesibility = null,
    Object? updateLogo = null,
    Object? updateSignature = null,
  }) {
    return _then(_value.copyWith(
      premiumFeeds: null == premiumFeeds
          ? _value.premiumFeeds
          : premiumFeeds // ignore: cast_nullable_to_non_nullable
              as bool,
      qualityDownload: null == qualityDownload
          ? _value.qualityDownload
          : qualityDownload // ignore: cast_nullable_to_non_nullable
              as bool,
      noWatermark: null == noWatermark
          ? _value.noWatermark
          : noWatermark // ignore: cast_nullable_to_non_nullable
              as bool,
      unlimitedDownloads: null == unlimitedDownloads
          ? _value.unlimitedDownloads
          : unlimitedDownloads // ignore: cast_nullable_to_non_nullable
              as bool,
      perDayDownloads: null == perDayDownloads
          ? _value.perDayDownloads
          : perDayDownloads // ignore: cast_nullable_to_non_nullable
              as int,
      hideAds: null == hideAds
          ? _value.hideAds
          : hideAds // ignore: cast_nullable_to_non_nullable
              as bool,
      fontAccesibility: null == fontAccesibility
          ? _value.fontAccesibility
          : fontAccesibility // ignore: cast_nullable_to_non_nullable
              as bool,
      updateLogo: null == updateLogo
          ? _value.updateLogo
          : updateLogo // ignore: cast_nullable_to_non_nullable
              as bool,
      updateSignature: null == updateSignature
          ? _value.updateSignature
          : updateSignature // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeaturesImplCopyWith<$Res>
    implements $FeaturesCopyWith<$Res> {
  factory _$$FeaturesImplCopyWith(
          _$FeaturesImpl value, $Res Function(_$FeaturesImpl) then) =
      __$$FeaturesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool premiumFeeds,
      bool qualityDownload,
      bool noWatermark,
      bool unlimitedDownloads,
      int perDayDownloads,
      bool hideAds,
      bool fontAccesibility,
      bool updateLogo,
      bool updateSignature});
}

/// @nodoc
class __$$FeaturesImplCopyWithImpl<$Res>
    extends _$FeaturesCopyWithImpl<$Res, _$FeaturesImpl>
    implements _$$FeaturesImplCopyWith<$Res> {
  __$$FeaturesImplCopyWithImpl(
      _$FeaturesImpl _value, $Res Function(_$FeaturesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? premiumFeeds = null,
    Object? qualityDownload = null,
    Object? noWatermark = null,
    Object? unlimitedDownloads = null,
    Object? perDayDownloads = null,
    Object? hideAds = null,
    Object? fontAccesibility = null,
    Object? updateLogo = null,
    Object? updateSignature = null,
  }) {
    return _then(_$FeaturesImpl(
      premiumFeeds: null == premiumFeeds
          ? _value.premiumFeeds
          : premiumFeeds // ignore: cast_nullable_to_non_nullable
              as bool,
      qualityDownload: null == qualityDownload
          ? _value.qualityDownload
          : qualityDownload // ignore: cast_nullable_to_non_nullable
              as bool,
      noWatermark: null == noWatermark
          ? _value.noWatermark
          : noWatermark // ignore: cast_nullable_to_non_nullable
              as bool,
      unlimitedDownloads: null == unlimitedDownloads
          ? _value.unlimitedDownloads
          : unlimitedDownloads // ignore: cast_nullable_to_non_nullable
              as bool,
      perDayDownloads: null == perDayDownloads
          ? _value.perDayDownloads
          : perDayDownloads // ignore: cast_nullable_to_non_nullable
              as int,
      hideAds: null == hideAds
          ? _value.hideAds
          : hideAds // ignore: cast_nullable_to_non_nullable
              as bool,
      fontAccesibility: null == fontAccesibility
          ? _value.fontAccesibility
          : fontAccesibility // ignore: cast_nullable_to_non_nullable
              as bool,
      updateLogo: null == updateLogo
          ? _value.updateLogo
          : updateLogo // ignore: cast_nullable_to_non_nullable
              as bool,
      updateSignature: null == updateSignature
          ? _value.updateSignature
          : updateSignature // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeaturesImpl implements _Features {
  const _$FeaturesImpl(
      {this.premiumFeeds = false,
      this.qualityDownload = false,
      this.noWatermark = false,
      this.unlimitedDownloads = false,
      this.perDayDownloads = 1,
      this.hideAds = false,
      this.fontAccesibility = false,
      this.updateLogo = false,
      this.updateSignature = false});

  factory _$FeaturesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturesImplFromJson(json);

  @override
  @JsonKey()
  final bool premiumFeeds;
  @override
  @JsonKey()
  final bool qualityDownload;
  @override
  @JsonKey()
  final bool noWatermark;
  @override
  @JsonKey()
  final bool unlimitedDownloads;
  @override
  @JsonKey()
  final int perDayDownloads;
  @override
  @JsonKey()
  final bool hideAds;
  @override
  @JsonKey()
  final bool fontAccesibility;
  @override
  @JsonKey()
  final bool updateLogo;
  @override
  @JsonKey()
  final bool updateSignature;

  @override
  String toString() {
    return 'Features(premiumFeeds: $premiumFeeds, qualityDownload: $qualityDownload, noWatermark: $noWatermark, unlimitedDownloads: $unlimitedDownloads, perDayDownloads: $perDayDownloads, hideAds: $hideAds, fontAccesibility: $fontAccesibility, updateLogo: $updateLogo, updateSignature: $updateSignature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturesImpl &&
            (identical(other.premiumFeeds, premiumFeeds) ||
                other.premiumFeeds == premiumFeeds) &&
            (identical(other.qualityDownload, qualityDownload) ||
                other.qualityDownload == qualityDownload) &&
            (identical(other.noWatermark, noWatermark) ||
                other.noWatermark == noWatermark) &&
            (identical(other.unlimitedDownloads, unlimitedDownloads) ||
                other.unlimitedDownloads == unlimitedDownloads) &&
            (identical(other.perDayDownloads, perDayDownloads) ||
                other.perDayDownloads == perDayDownloads) &&
            (identical(other.hideAds, hideAds) || other.hideAds == hideAds) &&
            (identical(other.fontAccesibility, fontAccesibility) ||
                other.fontAccesibility == fontAccesibility) &&
            (identical(other.updateLogo, updateLogo) ||
                other.updateLogo == updateLogo) &&
            (identical(other.updateSignature, updateSignature) ||
                other.updateSignature == updateSignature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      premiumFeeds,
      qualityDownload,
      noWatermark,
      unlimitedDownloads,
      perDayDownloads,
      hideAds,
      fontAccesibility,
      updateLogo,
      updateSignature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturesImplCopyWith<_$FeaturesImpl> get copyWith =>
      __$$FeaturesImplCopyWithImpl<_$FeaturesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturesImplToJson(
      this,
    );
  }
}

abstract class _Features implements Features {
  const factory _Features(
      {final bool premiumFeeds,
      final bool qualityDownload,
      final bool noWatermark,
      final bool unlimitedDownloads,
      final int perDayDownloads,
      final bool hideAds,
      final bool fontAccesibility,
      final bool updateLogo,
      final bool updateSignature}) = _$FeaturesImpl;

  factory _Features.fromJson(Map<String, dynamic> json) =
      _$FeaturesImpl.fromJson;

  @override
  bool get premiumFeeds;
  @override
  bool get qualityDownload;
  @override
  bool get noWatermark;
  @override
  bool get unlimitedDownloads;
  @override
  int get perDayDownloads;
  @override
  bool get hideAds;
  @override
  bool get fontAccesibility;
  @override
  bool get updateLogo;
  @override
  bool get updateSignature;
  @override
  @JsonKey(ignore: true)
  _$$FeaturesImplCopyWith<_$FeaturesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
