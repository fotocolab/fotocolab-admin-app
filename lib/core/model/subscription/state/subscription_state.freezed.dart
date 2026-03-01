// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SubscriptionState {
  bool get isLoading => throw _privateConstructorUsedError;
  SubscriptionDurationEnum? get selectedPlanDurationEnum =>
      throw _privateConstructorUsedError;
  Features get features => throw _privateConstructorUsedError;
  bool get isSelectAllFeatures => throw _privateConstructorUsedError;
  List<PlansResponseModel> get plans => throw _privateConstructorUsedError;
  bool get isDeletePlanLoading => throw _privateConstructorUsedError;
  bool get isDeactivatePlanLoading => throw _privateConstructorUsedError;
  bool get isUpdatePlanLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionStateCopyWith<SubscriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
    SubscriptionState value,
    $Res Function(SubscriptionState) then,
  ) = _$SubscriptionStateCopyWithImpl<$Res, SubscriptionState>;
  @useResult
  $Res call({
    bool isLoading,
    SubscriptionDurationEnum? selectedPlanDurationEnum,
    Features features,
    bool isSelectAllFeatures,
    List<PlansResponseModel> plans,
    bool isDeletePlanLoading,
    bool isDeactivatePlanLoading,
    bool isUpdatePlanLoading,
  });

  $FeaturesCopyWith<$Res> get features;
}

/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res, $Val extends SubscriptionState>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedPlanDurationEnum = freezed,
    Object? features = null,
    Object? isSelectAllFeatures = null,
    Object? plans = null,
    Object? isDeletePlanLoading = null,
    Object? isDeactivatePlanLoading = null,
    Object? isUpdatePlanLoading = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            selectedPlanDurationEnum: freezed == selectedPlanDurationEnum
                ? _value.selectedPlanDurationEnum
                : selectedPlanDurationEnum // ignore: cast_nullable_to_non_nullable
                      as SubscriptionDurationEnum?,
            features: null == features
                ? _value.features
                : features // ignore: cast_nullable_to_non_nullable
                      as Features,
            isSelectAllFeatures: null == isSelectAllFeatures
                ? _value.isSelectAllFeatures
                : isSelectAllFeatures // ignore: cast_nullable_to_non_nullable
                      as bool,
            plans: null == plans
                ? _value.plans
                : plans // ignore: cast_nullable_to_non_nullable
                      as List<PlansResponseModel>,
            isDeletePlanLoading: null == isDeletePlanLoading
                ? _value.isDeletePlanLoading
                : isDeletePlanLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDeactivatePlanLoading: null == isDeactivatePlanLoading
                ? _value.isDeactivatePlanLoading
                : isDeactivatePlanLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isUpdatePlanLoading: null == isUpdatePlanLoading
                ? _value.isUpdatePlanLoading
                : isUpdatePlanLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $FeaturesCopyWith<$Res> get features {
    return $FeaturesCopyWith<$Res>(_value.features, (value) {
      return _then(_value.copyWith(features: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscriptionStateImplCopyWith<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  factory _$$SubscriptionStateImplCopyWith(
    _$SubscriptionStateImpl value,
    $Res Function(_$SubscriptionStateImpl) then,
  ) = __$$SubscriptionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    SubscriptionDurationEnum? selectedPlanDurationEnum,
    Features features,
    bool isSelectAllFeatures,
    List<PlansResponseModel> plans,
    bool isDeletePlanLoading,
    bool isDeactivatePlanLoading,
    bool isUpdatePlanLoading,
  });

  @override
  $FeaturesCopyWith<$Res> get features;
}

/// @nodoc
class __$$SubscriptionStateImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$SubscriptionStateImpl>
    implements _$$SubscriptionStateImplCopyWith<$Res> {
  __$$SubscriptionStateImplCopyWithImpl(
    _$SubscriptionStateImpl _value,
    $Res Function(_$SubscriptionStateImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedPlanDurationEnum = freezed,
    Object? features = null,
    Object? isSelectAllFeatures = null,
    Object? plans = null,
    Object? isDeletePlanLoading = null,
    Object? isDeactivatePlanLoading = null,
    Object? isUpdatePlanLoading = null,
  }) {
    return _then(
      _$SubscriptionStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedPlanDurationEnum: freezed == selectedPlanDurationEnum
            ? _value.selectedPlanDurationEnum
            : selectedPlanDurationEnum // ignore: cast_nullable_to_non_nullable
                  as SubscriptionDurationEnum?,
        features: null == features
            ? _value.features
            : features // ignore: cast_nullable_to_non_nullable
                  as Features,
        isSelectAllFeatures: null == isSelectAllFeatures
            ? _value.isSelectAllFeatures
            : isSelectAllFeatures // ignore: cast_nullable_to_non_nullable
                  as bool,
        plans: null == plans
            ? _value._plans
            : plans // ignore: cast_nullable_to_non_nullable
                  as List<PlansResponseModel>,
        isDeletePlanLoading: null == isDeletePlanLoading
            ? _value.isDeletePlanLoading
            : isDeletePlanLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDeactivatePlanLoading: null == isDeactivatePlanLoading
            ? _value.isDeactivatePlanLoading
            : isDeactivatePlanLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isUpdatePlanLoading: null == isUpdatePlanLoading
            ? _value.isUpdatePlanLoading
            : isUpdatePlanLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$SubscriptionStateImpl implements _SubscriptionState {
  const _$SubscriptionStateImpl({
    this.isLoading = false,
    this.selectedPlanDurationEnum,
    this.features = const Features(
      fontAccesibility: false,
      hideAds: false,
      noWatermark: false,
      perDayDownloads: 1,
      premiumFeeds: false,
      qualityDownload: false,
      unlimitedDownloads: false,
      updateLogo: false,
      updateSignature: false,
    ),
    this.isSelectAllFeatures = false,
    final List<PlansResponseModel> plans = const [],
    this.isDeletePlanLoading = false,
    this.isDeactivatePlanLoading = false,
    this.isUpdatePlanLoading = false,
  }) : _plans = plans;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final SubscriptionDurationEnum? selectedPlanDurationEnum;
  @override
  @JsonKey()
  final Features features;
  @override
  @JsonKey()
  final bool isSelectAllFeatures;
  final List<PlansResponseModel> _plans;
  @override
  @JsonKey()
  List<PlansResponseModel> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  @JsonKey()
  final bool isDeletePlanLoading;
  @override
  @JsonKey()
  final bool isDeactivatePlanLoading;
  @override
  @JsonKey()
  final bool isUpdatePlanLoading;

  @override
  String toString() {
    return 'SubscriptionState(isLoading: $isLoading, selectedPlanDurationEnum: $selectedPlanDurationEnum, features: $features, isSelectAllFeatures: $isSelectAllFeatures, plans: $plans, isDeletePlanLoading: $isDeletePlanLoading, isDeactivatePlanLoading: $isDeactivatePlanLoading, isUpdatePlanLoading: $isUpdatePlanLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(
                  other.selectedPlanDurationEnum,
                  selectedPlanDurationEnum,
                ) ||
                other.selectedPlanDurationEnum == selectedPlanDurationEnum) &&
            (identical(other.features, features) ||
                other.features == features) &&
            (identical(other.isSelectAllFeatures, isSelectAllFeatures) ||
                other.isSelectAllFeatures == isSelectAllFeatures) &&
            const DeepCollectionEquality().equals(other._plans, _plans) &&
            (identical(other.isDeletePlanLoading, isDeletePlanLoading) ||
                other.isDeletePlanLoading == isDeletePlanLoading) &&
            (identical(
                  other.isDeactivatePlanLoading,
                  isDeactivatePlanLoading,
                ) ||
                other.isDeactivatePlanLoading == isDeactivatePlanLoading) &&
            (identical(other.isUpdatePlanLoading, isUpdatePlanLoading) ||
                other.isUpdatePlanLoading == isUpdatePlanLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    selectedPlanDurationEnum,
    features,
    isSelectAllFeatures,
    const DeepCollectionEquality().hash(_plans),
    isDeletePlanLoading,
    isDeactivatePlanLoading,
    isUpdatePlanLoading,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      __$$SubscriptionStateImplCopyWithImpl<_$SubscriptionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SubscriptionState implements SubscriptionState {
  const factory _SubscriptionState({
    final bool isLoading,
    final SubscriptionDurationEnum? selectedPlanDurationEnum,
    final Features features,
    final bool isSelectAllFeatures,
    final List<PlansResponseModel> plans,
    final bool isDeletePlanLoading,
    final bool isDeactivatePlanLoading,
    final bool isUpdatePlanLoading,
  }) = _$SubscriptionStateImpl;

  @override
  bool get isLoading;
  @override
  SubscriptionDurationEnum? get selectedPlanDurationEnum;
  @override
  Features get features;
  @override
  bool get isSelectAllFeatures;
  @override
  List<PlansResponseModel> get plans;
  @override
  bool get isDeletePlanLoading;
  @override
  bool get isDeactivatePlanLoading;
  @override
  bool get isUpdatePlanLoading;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
