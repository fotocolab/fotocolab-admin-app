import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/canvas/response/image_title_response_model.dart';
import 'package:fotocolab_admin/core/model/upload/request/upload/upload_image_request_model.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/widget/image_title_widget.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/file_manager/file_manager.dart';
import 'package:fotocolab_admin/util/image/image_manager.dart';
import 'package:fotocolab_admin/util/video/video_manager.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:fotocolab_design_system/design_system/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

class CanvasScreen extends ConsumerStatefulWidget {
  const CanvasScreen({super.key});

  @override
  ConsumerState<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends ConsumerState<CanvasScreen> {
  late UploadNotifierProvider provider;

  List<ImageTitleResponseModel> images = [];

  List<String> titles = [];

  TextEditingController copyCountController = TextEditingController();

  bool isMergeAndGoLoding = false;

  Future<void> attachOnTap() async {
    var imgList = await FileManager.uploadMultiple();
    for (var i in imgList) {
      images.add(ImageTitleResponseModel(image: i, language: .english));
    }
    setState(() {});
  }

  void onChanged(int index, String? value) {
    images[index] = images[index].copyWith(
      image: images[index].image,
      title: value ?? '',
    );
  }

  void onMultiLineChanged(String? value) {
    if (value == null || value.isEmpty) return;

    var list = (value.split('\n'));

    int length = list.length;

    if (images.length < length) {
      length = images.length;
    }

    for (int i = 0; i < length; i++) {
      images[i] = images[i].copyWith(
        image: images[i].image,
        title: list[i].split('|||').first,
        language: list[i].split('|||').last.trim().toLowerCase().toLanguageEnum,
      );
    }

    setState(() {});
  }

  void deleteOnTap(int index) {
    images.removeAt(index);
    setState(() {});
  }

  void onLanguageChanged(LanguageEnum? langauge, int index) {
    images[index] = images[index].copyWith(language: langauge ?? .english);
    setState(() {});
  }

  void duplicateOnTap() {
    int? count = int.tryParse(copyCountController.text);
    if (count != null) {
      if (count > 0 && images.length == 1) {
        for (int i = 0; i < count - 1; i++) {
          images.add(
            ImageTitleResponseModel(image: images[0].image, language: .english),
          );
        }
      } else {
        NavigationService.showErrorSnackbar(
          message: context.loc.duplicate_image_should_be_one,
        );
      }
      setState(() {});
    }
  }

  Future<void> mergeOnTap() async {
    setState(() {
      isMergeAndGoLoding = true;
    });
    List<UploadImageRequestModel> mergedImage = [];
    for (var i in images) {
      try {
        var k = await generateInstagramPoster(
          imageBytes: await File(i.image!.path!).readAsBytes(),
          title: i.title.split('|||').first,
          package: BrandConstansts.packageName,
        );
        var dir = await getApplicationCacheDirectory();

        String path = '${dir.path}/merge_${i.image?.name}';

        var newFile = await File(path).writeAsBytes(k);

        var pf = PlatformFile(
          name: i.image?.name ?? 'image.png',
          size: k.length,
          bytes: k,
          path: newFile.path,
        );

        if (i.audio != null) {
          var videoPath = await VideoManager.toVideoAndroid(
            audioPath: i.audio?.path,
            imagePath: pf.path,
          );
          if (videoPath != null) {
            var video = await File(
              videoPath,
            ).writeAsBytes(await File(videoPath).readAsBytes());

            pf = PlatformFile(
              name: 'video.mp4',
              size: await video.length(),
              path: video.path,
              bytes: await video.readAsBytes(),
            );

            mergedImage.add(
              UploadImageRequestModel(image: pf, langauge: i.language.value),
            );
          }
        } else {
          mergedImage.add(
            UploadImageRequestModel(image: pf, langauge: i.language.value),
          );
        }
      } catch (e) {
        //
      }
    }
    setState(() {
      isMergeAndGoLoding = false;
    });
    provider.setSelectedFiles = mergedImage;
    if (mounted) {
      context.pop();
    }
  }

  Future<void> audioOnTap(int index) async {
    var audio = await FileManager.uploadSingle(allowedExtensions: ['mp3']);
    images[index] = images[index].copyWith(audio: audio);
    setState(() {});
  }

  void deleteAudioOnTap(int index) {
    images[index] = images[index].copyWith(audio: null);
    setState(() {});
  }

  // await VideoManager.toVideoAndroid(audioPath: audio?.path);
  // void save() async {
  //   await GallerySaver.saveVideo(outputPath!);
  // }

  @override
  Widget build(BuildContext context) {
    ref.watch(uploadProvider);
    provider = ref.read(uploadProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RoundedContainer(
                  width: context.screenWidth,
                  color: AppColors.primary.withAlpha(30),
                  borderColor: AppColors.primary.withAlpha(55),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 26,
                    ),
                    child: Column(
                      children: [
                        RoundedContainer(
                          color: AppColors.primary.withAlpha(80),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        BrandVSpace.gap16(),
                        BrandText.white(
                          data: context.loc.add_images,
                          fontWeight: .w700,
                        ),
                        BrandText.grey(
                          data: context.loc.tap_to_select_photos,
                          fontColor: AppColors.greyA3,
                          fontSize: BrandFontSize.size14,
                        ),
                        BrandVSpace.gap10(),
                        FittedBox(
                          child: BrandButton.primary(
                            title: context.loc.select_photos,
                            onTap: attachOnTap,
                            borderRadius: 12,
                          ),
                        ),
                        if (images.isNotEmpty) ...[
                          BrandVSpace.gap16(),
                          SizedBox(
                            child: BrandTextField(
                              maxLines: 2,
                              hintText:
                                  context.loc.enter_or_paste_multiple_quote,
                              onChanged: (p0) {
                                onMultiLineChanged(p0);
                              },
                            ),
                          ),
                          BrandVSpace.gap16(),
                          Row(
                            children: [
                              Expanded(
                                child: BrandTextField(
                                  controller: copyCountController,
                                  hintText: context.loc.how_many_duplicates,
                                  keyboardType: .number,
                                ),
                              ),
                              BrandHSpace.gap10(),
                              BrandButton.primary(
                                title: context.loc.duplicate,
                                onTap: duplicateOnTap,
                              ),
                            ],
                          ),
                          BrandVSpace.gap16(),
                          Align(
                            alignment: .topLeft,
                            child: BrandText.white(
                              data:
                                  '${context.loc.total_images}: ${images.length}',
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                BrandVSpace.gap10(),

                if (images.isNotEmpty) ...[
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: images.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => BrandVSpace.gap14(),
                    itemBuilder: (context, index) {
                      var item = images[index];
                      return ImageTitleWidget(
                        title: item.title,
                        image: item.image,
                        selectedLanguage: item.language,
                        audio: item.audio,
                        onChanged: (value) {
                          onChanged(index, value);
                        },
                        deleteOnTap: () {
                          deleteOnTap(index);
                        },
                        onLanguageChanged: (langauge) {
                          onLanguageChanged(langauge, index);
                        },
                        audioOnTap: () {
                          audioOnTap(index);
                        },
                        deleteAudioOnTap: () {
                          deleteAudioOnTap(index);
                        },
                      );
                    },
                  ),
                  BrandVSpace.gap26(),
                  BrandButton.primary(
                    title: context.loc.merge_and_go_back,
                    onTap: mergeOnTap,
                    isLoading: isMergeAndGoLoding,
                    leftIcon: Icon(
                      Icons.arrow_back_sharp,
                      color: AppColors.white,
                    ),
                  ),
                  BrandVSpace.gap100(),
                ],
                BrandVSpace.gap100(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
