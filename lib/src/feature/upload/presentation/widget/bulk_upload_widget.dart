import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/file_manager/file_manager.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class BulkUploadWidget extends ConsumerStatefulWidget {
  const BulkUploadWidget({super.key});

  @override
  ConsumerState<BulkUploadWidget> createState() => _BulkUploadWidgetState();
}

class _BulkUploadWidgetState extends ConsumerState<BulkUploadWidget> {
  late UploadNotifierProvider provider;

  Future<void> selectFileOnTap() async {
    var files = await FileManager.uploadMultiple();
    provider.setSelectedFiles = files;
    bool isUploaded = await provider.uploadFiles();
    if (isUploaded) {
      NavigationService.showSuccessSnackbar(message: 'Files are uploaded');
    } else {
      NavigationService.showErrorSnackbar();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(uploadProvider);
    provider = ref.read(uploadProvider.notifier);
    return RoundedContainer(
      height: 300,
      width: context.screenWidth,
      color: AppColors.primary.withAlpha(30),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          RoundedContainer(
            borderRadius: 100,
            color: AppColors.primary.withAlpha(40),
            width: 55,
            height: 55,
            child: Center(
              child: Icon(
                Icons.cloud_upload_outlined,
                color: AppColors.primary,
                size: 35,
              ),
            ),
          ),
          BrandVSpace.gap10(),
          BrandText.white(
            data: context.loc.bulk_asset_upload,
            fontWeight: FontWeight.bold,
          ),
          BrandVSpace.gap2(),
          BrandText.grey(
            data: context.loc.drag_and_drop,
            fontSize: BrandFontSize.size12,
            fontColor: AppColors.grey7D,
          ),
          BrandVSpace.gap10(),
          FittedBox(
            child: BrandButton.primary(
              title: context.loc.select_file,
              borderRadius: 8,
              titlePadding: EdgeInsets.symmetric(horizontal: 16),
              onTap: selectFileOnTap,
            ),
          ),
        ],
      ),
    );
  }
}
