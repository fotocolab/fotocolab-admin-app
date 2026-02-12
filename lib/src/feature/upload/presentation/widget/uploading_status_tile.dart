import 'package:flutter/material.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class UploadingStatusTile extends StatelessWidget {
  final String fileName;
  final bool isLoading;
  const UploadingStatusTile({
    super.key,
    this.fileName = '',
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: AppColors.blue29.withAlpha(150),
      height: 45,
      borderColor: AppColors.primary.withAlpha(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            BrandText.white(data: fileName),

            BrandLoaderWidget(),
          ],
        ),
      ),
    );
  }
}
