// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadState {
  UploadEnum get selectedUploadType => throw _privateConstructorUsedError;
  List<PlatformFile> get selectedFiles => throw _privateConstructorUsedError;
  List<UploadCategoryResponseModel> get uploadCategory =>
      throw _privateConstructorUsedError;
  UploadCategoryResponseModel? get selectedUploadCategory =>
      throw _privateConstructorUsedError;
  bool get isCategoryLoading => throw _privateConstructorUsedError;
  bool get isUploading => throw _privateConstructorUsedError;
  bool get isCreateCategoryLoading => throw _privateConstructorUsedError;
  List<String> get keywords => throw _privateConstructorUsedError;
  DateTime? get selectedFromDate => throw _privateConstructorUsedError;
  DateTime? get selectedToDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadStateCopyWith<UploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadStateCopyWith<$Res> {
  factory $UploadStateCopyWith(
          UploadState value, $Res Function(UploadState) then) =
      _$UploadStateCopyWithImpl<$Res, UploadState>;
  @useResult
  $Res call(
      {UploadEnum selectedUploadType,
      List<PlatformFile> selectedFiles,
      List<UploadCategoryResponseModel> uploadCategory,
      UploadCategoryResponseModel? selectedUploadCategory,
      bool isCategoryLoading,
      bool isUploading,
      bool isCreateCategoryLoading,
      List<String> keywords,
      DateTime? selectedFromDate,
      DateTime? selectedToDate});

  $UploadCategoryResponseModelCopyWith<$Res>? get selectedUploadCategory;
}

/// @nodoc
class _$UploadStateCopyWithImpl<$Res, $Val extends UploadState>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUploadType = null,
    Object? selectedFiles = null,
    Object? uploadCategory = null,
    Object? selectedUploadCategory = freezed,
    Object? isCategoryLoading = null,
    Object? isUploading = null,
    Object? isCreateCategoryLoading = null,
    Object? keywords = null,
    Object? selectedFromDate = freezed,
    Object? selectedToDate = freezed,
  }) {
    return _then(_value.copyWith(
      selectedUploadType: null == selectedUploadType
          ? _value.selectedUploadType
          : selectedUploadType // ignore: cast_nullable_to_non_nullable
              as UploadEnum,
      selectedFiles: null == selectedFiles
          ? _value.selectedFiles
          : selectedFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
      uploadCategory: null == uploadCategory
          ? _value.uploadCategory
          : uploadCategory // ignore: cast_nullable_to_non_nullable
              as List<UploadCategoryResponseModel>,
      selectedUploadCategory: freezed == selectedUploadCategory
          ? _value.selectedUploadCategory
          : selectedUploadCategory // ignore: cast_nullable_to_non_nullable
              as UploadCategoryResponseModel?,
      isCategoryLoading: null == isCategoryLoading
          ? _value.isCategoryLoading
          : isCategoryLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateCategoryLoading: null == isCreateCategoryLoading
          ? _value.isCreateCategoryLoading
          : isCreateCategoryLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedFromDate: freezed == selectedFromDate
          ? _value.selectedFromDate
          : selectedFromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedToDate: freezed == selectedToDate
          ? _value.selectedToDate
          : selectedToDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UploadCategoryResponseModelCopyWith<$Res>? get selectedUploadCategory {
    if (_value.selectedUploadCategory == null) {
      return null;
    }

    return $UploadCategoryResponseModelCopyWith<$Res>(
        _value.selectedUploadCategory!, (value) {
      return _then(_value.copyWith(selectedUploadCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UploadStateImplCopyWith<$Res>
    implements $UploadStateCopyWith<$Res> {
  factory _$$UploadStateImplCopyWith(
          _$UploadStateImpl value, $Res Function(_$UploadStateImpl) then) =
      __$$UploadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UploadEnum selectedUploadType,
      List<PlatformFile> selectedFiles,
      List<UploadCategoryResponseModel> uploadCategory,
      UploadCategoryResponseModel? selectedUploadCategory,
      bool isCategoryLoading,
      bool isUploading,
      bool isCreateCategoryLoading,
      List<String> keywords,
      DateTime? selectedFromDate,
      DateTime? selectedToDate});

  @override
  $UploadCategoryResponseModelCopyWith<$Res>? get selectedUploadCategory;
}

/// @nodoc
class __$$UploadStateImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadStateImpl>
    implements _$$UploadStateImplCopyWith<$Res> {
  __$$UploadStateImplCopyWithImpl(
      _$UploadStateImpl _value, $Res Function(_$UploadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUploadType = null,
    Object? selectedFiles = null,
    Object? uploadCategory = null,
    Object? selectedUploadCategory = freezed,
    Object? isCategoryLoading = null,
    Object? isUploading = null,
    Object? isCreateCategoryLoading = null,
    Object? keywords = null,
    Object? selectedFromDate = freezed,
    Object? selectedToDate = freezed,
  }) {
    return _then(_$UploadStateImpl(
      selectedUploadType: null == selectedUploadType
          ? _value.selectedUploadType
          : selectedUploadType // ignore: cast_nullable_to_non_nullable
              as UploadEnum,
      selectedFiles: null == selectedFiles
          ? _value._selectedFiles
          : selectedFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
      uploadCategory: null == uploadCategory
          ? _value._uploadCategory
          : uploadCategory // ignore: cast_nullable_to_non_nullable
              as List<UploadCategoryResponseModel>,
      selectedUploadCategory: freezed == selectedUploadCategory
          ? _value.selectedUploadCategory
          : selectedUploadCategory // ignore: cast_nullable_to_non_nullable
              as UploadCategoryResponseModel?,
      isCategoryLoading: null == isCategoryLoading
          ? _value.isCategoryLoading
          : isCategoryLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateCategoryLoading: null == isCreateCategoryLoading
          ? _value.isCreateCategoryLoading
          : isCreateCategoryLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedFromDate: freezed == selectedFromDate
          ? _value.selectedFromDate
          : selectedFromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedToDate: freezed == selectedToDate
          ? _value.selectedToDate
          : selectedToDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$UploadStateImpl implements _UploadState {
  const _$UploadStateImpl(
      {this.selectedUploadType = UploadEnum.free,
      final List<PlatformFile> selectedFiles = const [],
      final List<UploadCategoryResponseModel> uploadCategory = const [],
      this.selectedUploadCategory,
      this.isCategoryLoading = false,
      this.isUploading = false,
      this.isCreateCategoryLoading = false,
      final List<String> keywords = const [],
      this.selectedFromDate,
      this.selectedToDate})
      : _selectedFiles = selectedFiles,
        _uploadCategory = uploadCategory,
        _keywords = keywords;

  @override
  @JsonKey()
  final UploadEnum selectedUploadType;
  final List<PlatformFile> _selectedFiles;
  @override
  @JsonKey()
  List<PlatformFile> get selectedFiles {
    if (_selectedFiles is EqualUnmodifiableListView) return _selectedFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedFiles);
  }

  final List<UploadCategoryResponseModel> _uploadCategory;
  @override
  @JsonKey()
  List<UploadCategoryResponseModel> get uploadCategory {
    if (_uploadCategory is EqualUnmodifiableListView) return _uploadCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uploadCategory);
  }

  @override
  final UploadCategoryResponseModel? selectedUploadCategory;
  @override
  @JsonKey()
  final bool isCategoryLoading;
  @override
  @JsonKey()
  final bool isUploading;
  @override
  @JsonKey()
  final bool isCreateCategoryLoading;
  final List<String> _keywords;
  @override
  @JsonKey()
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  final DateTime? selectedFromDate;
  @override
  final DateTime? selectedToDate;

  @override
  String toString() {
    return 'UploadState(selectedUploadType: $selectedUploadType, selectedFiles: $selectedFiles, uploadCategory: $uploadCategory, selectedUploadCategory: $selectedUploadCategory, isCategoryLoading: $isCategoryLoading, isUploading: $isUploading, isCreateCategoryLoading: $isCreateCategoryLoading, keywords: $keywords, selectedFromDate: $selectedFromDate, selectedToDate: $selectedToDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadStateImpl &&
            (identical(other.selectedUploadType, selectedUploadType) ||
                other.selectedUploadType == selectedUploadType) &&
            const DeepCollectionEquality()
                .equals(other._selectedFiles, _selectedFiles) &&
            const DeepCollectionEquality()
                .equals(other._uploadCategory, _uploadCategory) &&
            (identical(other.selectedUploadCategory, selectedUploadCategory) ||
                other.selectedUploadCategory == selectedUploadCategory) &&
            (identical(other.isCategoryLoading, isCategoryLoading) ||
                other.isCategoryLoading == isCategoryLoading) &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading) &&
            (identical(
                    other.isCreateCategoryLoading, isCreateCategoryLoading) ||
                other.isCreateCategoryLoading == isCreateCategoryLoading) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.selectedFromDate, selectedFromDate) ||
                other.selectedFromDate == selectedFromDate) &&
            (identical(other.selectedToDate, selectedToDate) ||
                other.selectedToDate == selectedToDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedUploadType,
      const DeepCollectionEquality().hash(_selectedFiles),
      const DeepCollectionEquality().hash(_uploadCategory),
      selectedUploadCategory,
      isCategoryLoading,
      isUploading,
      isCreateCategoryLoading,
      const DeepCollectionEquality().hash(_keywords),
      selectedFromDate,
      selectedToDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadStateImplCopyWith<_$UploadStateImpl> get copyWith =>
      __$$UploadStateImplCopyWithImpl<_$UploadStateImpl>(this, _$identity);
}

abstract class _UploadState implements UploadState {
  const factory _UploadState(
      {final UploadEnum selectedUploadType,
      final List<PlatformFile> selectedFiles,
      final List<UploadCategoryResponseModel> uploadCategory,
      final UploadCategoryResponseModel? selectedUploadCategory,
      final bool isCategoryLoading,
      final bool isUploading,
      final bool isCreateCategoryLoading,
      final List<String> keywords,
      final DateTime? selectedFromDate,
      final DateTime? selectedToDate}) = _$UploadStateImpl;

  @override
  UploadEnum get selectedUploadType;
  @override
  List<PlatformFile> get selectedFiles;
  @override
  List<UploadCategoryResponseModel> get uploadCategory;
  @override
  UploadCategoryResponseModel? get selectedUploadCategory;
  @override
  bool get isCategoryLoading;
  @override
  bool get isUploading;
  @override
  bool get isCreateCategoryLoading;
  @override
  List<String> get keywords;
  @override
  DateTime? get selectedFromDate;
  @override
  DateTime? get selectedToDate;
  @override
  @JsonKey(ignore: true)
  _$$UploadStateImplCopyWith<_$UploadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
