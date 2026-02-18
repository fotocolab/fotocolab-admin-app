import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/upload/request/category/upload_category_request_model.dart';
import 'package:fotocolab_admin/core/model/upload/response/category/upload_category_response_model.dart';
import 'package:fotocolab_admin/core/model/upload/state/upload_state.dart';
import 'package:fotocolab_admin/core/network/network_status.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/src/feature/upload/data/upload_remote_repo.dart';
import 'package:fotocolab_admin/util/enum/upload_enum.dart';

final uploadProvider =
    StateNotifierProvider<UploadNotifierProvider, UploadState>(
      (ref) => UploadNotifierProvider(ref),
    );

class UploadNotifierProvider extends StateNotifier<UploadState> {
  UploadNotifierProvider(this.ref) : super(const UploadState());

  final Ref ref;

  UploadEnum get selectedUploadType => state.selectedUploadType;

  List<PlatformFile> get selectedFiles => state.selectedFiles;

  List<UploadCategoryResponseModel> get uploadCategory => state.uploadCategory;

  UploadCategoryResponseModel? get selectedUploadCategory =>
      state.selectedUploadCategory;

  bool get isCategoryLoading => state.isCategoryLoading;

  bool get isUploading => state.isUploading;

  bool get isCreateCategoryLoading => state.isCreateCategoryLoading;

  List<String> get keywords => state.keywords;

  DateTime get firstDate => DateTime(DateTime.now().year - 1);

  DateTime get lastDate => DateTime(DateTime.now().year + 3);

  DateTime? get selectedFromDate => state.selectedFromDate;

  DateTime? get selectedToDate => state.selectedToDate;

  Future<void> getUploadCategory() async {
    state = state.copyWith(isCategoryLoading: true);

    var result = await ref.read(uploadRemoteRepoProvider).getCategory();

    if (result.status == ActionStatus.success.code) {
      state = state.copyWith(
        uploadCategory: result.data,
        isCategoryLoading: false,
      );
    } else {
      state = state.copyWith(uploadCategory: [], isCategoryLoading: false);
    }
  }

  Future<void> createUploadCategory({String? categoryName}) async {
    state = state.copyWith(isCreateCategoryLoading: true);

    var request = UploadCategoryRequestModel(
      categoryName: categoryName,
      dateRange: DateRage(
        from: selectedFromDate?.toString(),
        to: selectedToDate?.toString(),
      ),
    );

    var result = await ref
        .read(uploadRemoteRepoProvider)
        .createCategory(request: request);

    if (result.status == ActionStatus.success.code) {
      await getUploadCategory();
      state = state.copyWith(
        isCreateCategoryLoading: false,
        selectedUploadCategory: result.data,
      );
    } else {
      state = state.copyWith(
        isCreateCategoryLoading: false,
        selectedUploadCategory: null,
      );
    }
  }

  Future<bool> uploadFiles() async {
    if (selectedUploadCategory == null ||
        selectedUploadCategory!.categoryId == null) {
      return false;
    }
    state = state.copyWith(isUploading: true);

    var result = await ref
        .read(uploadRemoteRepoProvider)
        .uploadFiles(
          file: selectedFiles,
          categoryId: selectedUploadCategory!.categoryId!,
          userType: selectedUploadType.value,
          keywords: keywords,
        );

    if (result.status == ActionStatus.success.code) {
      state = state.copyWith(isUploading: false, selectedFiles: []);
      return true;
    } else {
      state = state.copyWith(isUploading: false, selectedFiles: []);
    }
    return false;
  }

  void addKeywords(String value) {
    List<String> keyW = [...keywords];
    if (value.contains(',')) {
      var l = value.split(',');
      for (var i in l) {
        if (!keyW.contains(i)) {
          keyW.add(i.toLowerCase().trim());
        }
      }
    } else if (keyW.contains(value)) {
      NavigationService.showErrorSnackbar(message: 'Already added');
      return;
    } else {
      keyW.add(value.toLowerCase().trim());
    }
    state = state.copyWith(keywords: keyW.toSet().toList());
  }

  set setSelectedUploadType(UploadEnum value) {
    state = state.copyWith(selectedUploadType: value);
  }

  set setSelectedFiles(List<PlatformFile> value) {
    state = state.copyWith(selectedFiles: value);
  }

  set setSelectedUploadCategory(UploadCategoryResponseModel value) {
    state = state.copyWith(selectedUploadCategory: value);
  }

  set setSelectedFromDate(DateTime value) {
    state = state.copyWith(selectedFromDate: value);
  }

  set setSelectedToDate(DateTime value) {
    state = state.copyWith(selectedToDate: value);
  }

  void clearSelectedDate() {
    state = state.copyWith(selectedFromDate: null, selectedToDate: null);
  }
}
