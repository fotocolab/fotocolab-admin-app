import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/widget/uploading_status_tile.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class ImageTitleWidget extends StatelessWidget {
  final Function(String? value)? onChanged;
  final String title;
  final PlatformFile? image;
  final Function? deleteOnTap;
  const ImageTitleWidget({
    super.key,
    this.image,
    this.onChanged,
    this.title = '',
    this.deleteOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: context.screenWidth,
      color: AppColors.primary.withAlpha(10),
      borderColor: AppColors.primary.withAlpha(55),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          children: [
            Align(
              alignment: .topRight,
              child: BrandInkWell(
                onTap: deleteOnTap,
                child: Icon(
                  Icons.delete_forever_outlined,
                  color: AppColors.red36,
                ),
              ),
            ),
            if (image?.bytes != null)
              Column(
                children: [
                  Row(
                    children: [
                      Image.memory(image!.bytes!, height: 55),
                      BrandHSpace.gap10(),
                      UploadingStatusTile(
                        fileName: image?.name ?? '--',
                        fileSize: image?.size.toMb.toStringAsFixed(2),
                      ),
                    ],
                  ),
                  BrandVSpace.gap14(),
                  BrandTextField(
                    controller: TextEditingController(text: title),
                    hintText: context.loc.enter_quote,
                    onChanged: (p0) {
                      onChanged?.call(p0);
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
