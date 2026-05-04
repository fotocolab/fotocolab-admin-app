import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:fotocolab_admin/util/video/video_manager.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class CanvasScreen extends ConsumerStatefulWidget {
  const CanvasScreen({super.key});

  @override
  ConsumerState<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends ConsumerState<CanvasScreen> {
  late UploadNotifierProvider provider;

  late EditImageNotifierProvider editImgProvider;

  List<ImageTitleResponseModel> assetImages = [];

  List<String> titles = [];

  TextEditingController copyCountController = TextEditingController();

  TextEditingController quoteController = TextEditingController();

  bool isMergeAndGoLoding = false;

  String? mergedVideoPath;

  int mergedVideoSize = 10;

  Future<void> attachOnTap() async {
    var imgList = await FileManager.uploadMultiple();
    for (var i in imgList) {
      assetImages.add(ImageTitleResponseModel(image: i, language: .english));
    }
    setState(() {});
  }

  void onChanged(int index, String? value) {
    assetImages[index] = assetImages[index].copyWith(
      image: assetImages[index].image,
      title: value ?? '',
    );
  }

  void onMultiLineChanged(String? value) {
    if (value == null || value.isEmpty) return;

    var list = (value.split('\n'));

    int length = list.length;

    if (assetImages.length < length) {
      length = assetImages.length;
    }

    for (int i = 0; i < length; i++) {
      assetImages[i] = assetImages[i].copyWith(
        image: assetImages[i].image,
        title: list[i].split('|||').first,
        language: list[i].split('|||').last.trim().toLowerCase().toLanguageEnum,
      );
    }

    setState(() {});
  }

  void deleteOnTap(int index) {
    assetImages.removeAt(index);
    setState(() {});
  }

  void onLanguageChanged(LanguageEnum? langauge, int index) {
    assetImages[index] = assetImages[index].copyWith(
      language: langauge ?? .english,
    );
    setState(() {});
  }

  // check this and text in video after merge
  void duplicateOnTap() {
    int? count = int.tryParse(copyCountController.text);
    if (count != null) {
      if (count > 0 && assetImages.length == 1) {
        for (int i = 0; i < count - 1; i++) {
          assetImages.add(
            ImageTitleResponseModel(
              image: PlatformFile(
                name: 'fotocolab_video.mp4',
                size: mergedVideoSize,
                path: mergedVideoPath,
              ),
              language: .english,
            ),
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

    for (var i in assetImages) {
      try {
        var videoPath = await VideoManager.addTextToVideoAndroid(
          context: context,
          text: i.title.split('|||').first,
          language: i.language,
          inputVideoPath: i.image!.path!,
          frameCount: 10,
          fontSize: editImgProvider.fontSize,
          textfromLeft: editImgProvider.fontPositionLeft,
          textfromTop: editImgProvider.fontPositionTop,
          transition: editImgProvider.selectedTransition,
          fontColor: editImgProvider.fontColor,
          stackSize: Size(context.screenWidth, context.screenWidth * 4 / 3),
        );

        if (videoPath != null) {
          var video = File(videoPath);

          var pf = PlatformFile(
            name: 'fotocolab_video.mp4',
            size: await video.length(),
            path: video.path,
            bytes: await video.readAsBytes(),
          );

          mergedImage.add(
            UploadImageRequestModel(image: pf, langauge: i.language.value),
          );
        }
      } catch (e) {
        //
      }
    }

    if (mounted) {
      setState(() {
        isMergeAndGoLoding = false;
      });
    }
    provider.setSelectedFiles = mergedImage;
    if (mounted) {
      context.pop();
    }
  }

  Future<void> audioOnTap(int index) async {
    var audio = await FileManager.uploadSingle(allowedExtensions: ['mp3']);
    assetImages[index] = assetImages[index].copyWith(audio: audio);
    setState(() {});
  }

  void deleteAudioOnTap(int index) {
    assetImages[index] = assetImages[index].copyWith(audio: null);
    setState(() {});
  }

  Future<void> overlayOnTap(int index) async {
    var overlay = await FileManager.uploadSingle(allowedExtensions: ['mp4']);
    assetImages[index] = assetImages[index].copyWith(overlay: overlay);
    setState(() {});
  }

  void deleteOverlayOnTap(int index) {
    assetImages[index] = assetImages[index].copyWith(overlay: null);
    setState(() {});
  }

  void gotoEditImageScreen(int index) {
    context.push(RouteName.editImage, extra: assetImages[index]);
  }

  void gotoVideoMergeScreen() {
    context.push(RouteName.videoMerge).then((videoPath) async {
      mergedVideoPath = videoPath?.toString();

      mergedVideoSize = (await File(
        mergedVideoPath.toString(),
      ).readAsBytes()).lengthInBytes;

      if (mergedVideoPath != null) {
        assetImages.add(
          ImageTitleResponseModel(
            image: PlatformFile(
              name: 'fotocolab_video.mp4',
              size: mergedVideoSize,
              path: videoPath.toString(),
            ),
            language: .english,
          ),
        );
      }
      setState(() {});
    });
  }

  void copyFromClipBoard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    onMultiLineChanged(data?.text);
    quoteController.text = data?.text ?? '';

    if (mounted) {
      setState(() {});
    }
  }

  void clearQuote() {
    quoteController.text = '';
    if (mounted) {
      setState(() {});
    }
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
                        BrandVSpace.gap10(),
                        FittedBox(
                          child: BrandButton.primary(
                            title: context.loc.to_video,
                            onTap: gotoVideoMergeScreen,
                            borderRadius: 12,
                          ),
                        ),
                        if (assetImages.isNotEmpty) ...[
                          BrandVSpace.gap16(),
                          SizedBox(
                            child: BrandTextField(
                              controller: quoteController,
                              maxLines: 2,
                              hintText:
                                  context.loc.enter_or_paste_multiple_quote,
                              onChanged: (p0) {
                                onMultiLineChanged(p0);
                                quoteController.text = p0;
                              },
                              suffixIcon: quoteController.text.isEmpty
                                  ? BrandInkWell(
                                      onTap: copyFromClipBoard,
                                      child: Icon(
                                        Icons.paste_outlined,
                                        color: AppColors.white,
                                      ),
                                    )
                                  : BrandInkWell(
                                      onTap: clearQuote,
                                      child: Icon(
                                        Icons.clear,
                                        color: AppColors.white,
                                      ),
                                    ),
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
                                  '${context.loc.total_images}: ${assetImages.length}',
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                BrandVSpace.gap10(),

                if (assetImages.isNotEmpty) ...[
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: assetImages.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => BrandVSpace.gap14(),
                    itemBuilder: (context, index) {
                      var item = assetImages[index];
                      return ImageTitleWidget(
                        title: item.title,
                        image: item.image,
                        selectedLanguage: item.language,
                        audio: item.audio,
                        overlay: item.overlay,
                        showEdit: false,
                        showAudio: false,
                        showOverlay: false,
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
