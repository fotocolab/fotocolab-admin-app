import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/widget/uploading_status_tile.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class ActiveUploadsWidget extends ConsumerStatefulWidget {
  const ActiveUploadsWidget({super.key});

  @override
  ConsumerState<ActiveUploadsWidget> createState() =>
      _ActiveUploadsWidgetState();
}

class _ActiveUploadsWidgetState extends ConsumerState<ActiveUploadsWidget> {
  late UploadNotifierProvider provider;

  @override
  Widget build(BuildContext context) {
    ref.watch(uploadProvider);
    provider = ref.read(uploadProvider.notifier);
    return Column(
      crossAxisAlignment: .start,
      children: [
        BrandText.white(
          data:
              '${context.loc.active_uploads} (${provider.selectedFiles.length})',
        ),
        BrandVSpace.gap10(),
        SizedBox(
          height: 75,
          width: context.screenWidth,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: provider.selectedFiles.length,
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              var item = provider.selectedFiles[index];
              return UploadingStatusTile(
                fileName: item.name,
                fileSize: item.size.toMb.toStringAsFixed(2),
              );
            },
            separatorBuilder: (context, index) => BrandHSpace.gap10(),
          ),
        ),
      ],
    );
  }
}
