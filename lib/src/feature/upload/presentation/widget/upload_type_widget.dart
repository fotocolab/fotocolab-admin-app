import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/enum/upload_enum.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class UploadTypeWidget extends ConsumerWidget {
  const UploadTypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(uploadProvider);
    var provider = ref.read(uploadProvider.notifier);
    return RoundedContainer(
      color: AppColors.blue29.withAlpha(100),
      height: 55,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: BrandSelectableChip(
                title: UploadEnum.free.displayValue,
                borderRadius: 12,
                isSelected: provider.selectedUploadType == UploadEnum.free,
                showCheck: provider.selectedUploadType == UploadEnum.free,
                onTap: (value) {
                  provider.setSelectedUploadType = UploadEnum.free;
                },
              ),
            ),
            BrandHSpace.gap10(),
            Expanded(
              child: BrandSelectableChip(
                title: UploadEnum.paid.displayValue,
                borderRadius: 12,
                isSelected: provider.selectedUploadType == UploadEnum.paid,
                showCheck: provider.selectedUploadType == UploadEnum.paid,
                onTap: (value) {
                  provider.setSelectedUploadType = UploadEnum.paid;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
