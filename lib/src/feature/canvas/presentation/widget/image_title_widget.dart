import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/widget/video_player_widget.dart';
import 'package:fotocolab_admin/src/feature/language/presentaion/widget/select_language_widget.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/widget/uploading_status_tile.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class ImageTitleWidget extends StatelessWidget {
  final Function(String? value)? onChanged;
  final String title;
  final PlatformFile? image, audio, overlay;
  final Function? deleteOnTap,
      audioOnTap,
      deleteAudioOnTap,
      overlayOnTap,
      deleteOvderlayOnTap;
  final Function(LanguageEnum? langauge)? onLanguageChanged;
  final LanguageEnum selectedLanguage;
  final bool showQuotes, showDelete, showAudio, showOverlay;
  const ImageTitleWidget({
    super.key,
    this.image,
    this.onChanged,
    this.title = '',
    this.deleteOnTap,
    this.onLanguageChanged,
    this.selectedLanguage = .english,
    this.showQuotes = true,
    this.showDelete = true,
    this.showAudio = true,
    this.showOverlay = true,
    this.audioOnTap,
    this.audio,
    this.deleteAudioOnTap,
    this.overlayOnTap,
    this.deleteOvderlayOnTap,
    this.overlay,
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
            if (showDelete)
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
            Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    if (image?.path != null) ...[
                      if (image!.path!.isVideo) ...[
                        VideoPlayerWidget(path: image!.path),
                      ] else
                        Image.file(File(image!.path!), width: 120),
                      BrandHSpace.gap10(),
                    ],
                    UploadingStatusTile(
                      fileName: image?.name ?? '--',
                      fileSize: image?.size.toMb.toStringAsFixed(2),
                    ),
                  ],
                ),
                BrandVSpace.gap14(),
                Row(
                  children: [
                    if (showQuotes) ...[
                      Expanded(
                        child: BrandTextField(
                          controller: TextEditingController(text: title),
                          hintText: context.loc.enter_quote,
                          label: context.loc.quote,
                          onChanged: (p0) {
                            onChanged?.call(p0);
                          },
                        ),
                      ),
                      BrandHSpace.gap10(),
                    ],
                    Expanded(
                      child: SelectLanguageWidget(
                        label: context.loc.language,
                        onChanged: onLanguageChanged,
                        initialSelection: selectedLanguage,
                      ),
                    ),
                  ],
                ),
                if (showAudio) ...[
                  BrandVSpace.gap10(),
                  if (audio == null)
                    BrandButton.primary(
                      title: context.loc.attach_audio,
                      onTap: () {
                        audioOnTap?.call();
                      },
                    )
                  else
                    Row(
                      children: [
                        UploadingStatusTile(
                          fileName: audio?.name ?? '--',
                          fileSize: audio?.size.toMb.toStringAsFixed(2),
                        ),
                        BrandHSpace.gap10(),
                        FittedBox(
                          child: BrandIconButon(
                            iconData: Icons.delete_forever,
                            iconColor: AppColors.red,
                            onTap: () {
                              deleteAudioOnTap?.call();
                            },
                          ),
                        ),
                      ],
                    ),
                ],
                if (showOverlay) ...[
                  BrandVSpace.gap10(),
                  if (overlay == null)
                    BrandButton.primary(
                      title: context.loc.overlay,
                      onTap: () {
                        overlayOnTap?.call();
                      },
                    )
                  else
                    Row(
                      children: [
                        UploadingStatusTile(
                          fileName: overlay?.name ?? '--',
                          fileSize: overlay?.size.toMb.toStringAsFixed(2),
                        ),
                        BrandHSpace.gap10(),
                        FittedBox(
                          child: BrandIconButon(
                            iconData: Icons.delete_forever,
                            iconColor: AppColors.red,
                            onTap: () {
                              deleteOvderlayOnTap?.call();
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
