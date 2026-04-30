import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/canvas/response/image_title_response_model.dart';
import 'package:fotocolab_admin/core/model/upload/request/upload/upload_image_request_model.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/provider/canvas_provider.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/widget/image_title_widget.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/file_manager/file_manager.dart';
import 'package:fotocolab_admin/util/image/image_manager.dart';
import 'package:fotocolab_admin/util/video/video_manager.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

class VideoMergeScreen extends ConsumerStatefulWidget {
  const VideoMergeScreen({super.key});

  @override
  ConsumerState<VideoMergeScreen> createState() => _VideoMergeScreenState();
}

class _VideoMergeScreenState extends ConsumerState<VideoMergeScreen> {
  late UploadNotifierProvider provider;

  late EditImageNotifierProvider editImgProvider;

  List<ImageTitleResponseModel> images = [];

  List<String> titles = [];

  TextEditingController copyCountController = TextEditingController();

  bool isMergeAndGoLoding = false;

  Future<void> attachOnTap() async {
    var imgList = await FileManager.uploadSingle();
    if (imgList != null) {
      var croppedImage = await ImageManager.cropToAspectSmart(imgList.path!);
      var dir = await getApplicationCacheDirectory();

      String path =
          '${dir.path}/image_${DateTime.now().millisecondsSinceEpoch}.png';

      var newFile = await File(path).writeAsBytes(croppedImage);

      images.add(
        ImageTitleResponseModel(
          image: PlatformFile(
            name: 'fotocolab_image.png',
            size: (await newFile.readAsBytes()).lengthInBytes,
            path: path,
          ),
          language: .english,
        ),
      );
      setState(() {});
    }
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
    List<UploadImageRequestModel> mergedVideo = [];

    for (var i in images) {
      try {
        var croppedImage = await ImageManager.cropToAspectSmart(i.image!.path!);

        var dir = await getApplicationCacheDirectory();

        String path =
            '${dir.path}/image_${DateTime.now().millisecondsSinceEpoch}.png';

        var newFile = await File(path).writeAsBytes(croppedImage);

        if (i.audio != null) {
          var videoPath = await VideoManager.applyGreenScreen(
            audioPath: i.audio?.path,
            imagePath: newFile.path,
            overlayPath: i.overlay?.path,
            overlaySize: editImgProvider.overlayWidth,
            overlayPosition: Offset(
              editImgProvider.overlayPositionLeft,
              editImgProvider.overlayPositionTop,
            ),
          );
          if (videoPath != null) {
            var video = await File(
              videoPath,
            ).writeAsBytes(await File(videoPath).readAsBytes());

            var pf = PlatformFile(
              name: 'fotocolab_video.mp4',
              size: await video.length(),
              path: video.path,
              bytes: await video.readAsBytes(),
            );

            mergedVideo.add(
              UploadImageRequestModel(image: pf, langauge: i.language.value),
            );
          }
        } else {
          mergedVideo.add(
            UploadImageRequestModel(image: i.image, langauge: i.language.value),
          );
        }
      } catch (e) {
        //
      }
    }
    setState(() {
      isMergeAndGoLoding = false;
    });
    if (mounted) {
      context.pop(mergedVideo.first.image?.path);
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

  Future<void> overlayOnTap(int index) async {
    var overlay = await FileManager.uploadSingle(allowedExtensions: ['mp4']);
    images[index] = images[index].copyWith(overlay: overlay);
    setState(() {});
  }

  void deleteOverlayOnTap(int index) {
    images[index] = images[index].copyWith(overlay: null);
    setState(() {});
  }

  void gotoEditImageScreen(int index) {
    context.push(RouteName.editImage, extra: images[index]);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images = [];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(uploadProvider);
    ref.watch(editImageProvider);
    provider = ref.read(uploadProvider.notifier);
    editImgProvider = ref.read(editImageProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (images.isEmpty)
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
                        overlay: item.overlay,
                        showEdit: true,
                        showLanguage: false,
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
                        overlayOnTap: () {
                          overlayOnTap(index);
                        },
                        deleteOvderlayOnTap: () {
                          deleteOverlayOnTap(index);
                        },
                        editOnTap: () {
                          gotoEditImageScreen(index);
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
