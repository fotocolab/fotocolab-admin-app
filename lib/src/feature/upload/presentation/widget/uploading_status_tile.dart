import 'package:flutter/material.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:fotocolab_design_system/design_system/utils/utils.dart';

class UploadingStatusTile extends StatelessWidget {
  final String fileName;
  final bool isLoading;
  final String? fileSize;
  const UploadingStatusTile({
    super.key,
    this.fileName = '',
    this.isLoading = false,
    this.fileSize,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: context.screenWidth * 0.5 >= BrandConstansts.maxWidth
          ? BrandConstansts.maxWidth
          : context.screenWidth * 0.5,
      color: AppColors.blue29.withAlpha(150),
      // height: 200,
      borderColor: AppColors.primary.withAlpha(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Flexible(
              child: BrandText.grey(
                fontColor: AppColors.grey8D,
                data: fileName,
                maxLines: 2,
              ),
            ),
            BrandHSpace.gap10(),

            BrandText.white(data: '${fileSize ?? '--'} MB', fontWeight: .w700),
          ],
        ),
      ),
    );
  }
}
