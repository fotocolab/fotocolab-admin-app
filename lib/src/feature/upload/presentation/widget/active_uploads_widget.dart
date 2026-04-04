import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/widget/image_title_widget.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';
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

  void onLanguageChanged(LanguageEnum? langauge, int index) {
    var images = [...provider.selectedFiles];

    images[index] = images[index].copyWith(
      langauge: langauge?.value ?? LanguageEnum.english.value,
    );
    provider.setSelectedFiles = images;
  }

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
        ListView.separated(
          shrinkWrap: true,
          itemCount: provider.selectedFiles.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var item = provider.selectedFiles[index];
            return ImageTitleWidget(
              image: item.image!,
              showQuotes: false,
              showDelete: false,
              showAudio: false,
              showOverlay: false,
              selectedLanguage: item.langauge.toLanguageEnum,
              onLanguageChanged: (langauge) {
                onLanguageChanged(langauge, index);
              },
            );
            // return UploadingStatusTile(
            //   fileName: item.image!.name,
            //   fileSize: item.image!.size.toMb.toStringAsFixed(2),
            // );
          },
          separatorBuilder: (context, index) => BrandVSpace.gap10(),
        ),
      ],
    );
  }
}
