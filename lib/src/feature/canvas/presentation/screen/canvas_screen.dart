import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/canvas/response/image_title_response_model.dart';
import 'package:fotocolab_admin/core/model/upload/request/upload/upload_image_request_model.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/widget/image_title_widget.dart';
import 'package:fotocolab_admin/src/feature/language/presentaion/widget/select_language_widget.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/file_manager/file_manager.dart';
import 'package:fotocolab_admin/util/image/image_manager.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:fotocolab_design_system/design_system/utils/utils.dart';
import 'package:go_router/go_router.dart';

class CanvasScreen extends ConsumerStatefulWidget {
  const CanvasScreen({super.key});

  @override
  ConsumerState<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends ConsumerState<CanvasScreen> {
  late UploadNotifierProvider provider;

  List<ImageTitleResponseModel> images = [];

  List<String> titles = [];

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

  Future<void> mergeOnTap() async {
    List<UploadImageRequestModel> mergedImage = [];
    for (var i in images) {
      try {
        var k = await generateInstagramPoster(
          imageBytes: i.image!.bytes!,
          title: i.title.split('|||').first,
          fontFamily: BrandFontFamily.fjalla,
          package: BrandConstansts.packageName,
        );
        var pf = PlatformFile(
          name: i.image?.name ?? 'image',
          size: k.length,
          bytes: k,
        );
        mergedImage.add(
          UploadImageRequestModel(image: pf, langauge: i.language.value),
        );
      } catch (e) {
        //
      }
    }
    provider.setSelectedFiles = mergedImage;
    if (mounted) {
      context.pop();
    }
  }

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
                          SelectLanguageWidget(),
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
                    separatorBuilder: (context, index) => BrandVSpace.gap14(),
                    itemBuilder: (context, index) {
                      var item = images[index];
                      return ImageTitleWidget(
                        title: item.title,
                        image: item.image,
                        onChanged: (value) {
                          onChanged(index, value);
                        },
                        deleteOnTap: () {
                          deleteOnTap(index);
                        },
                        onLanguageChanged: (langauge) {
                          onLanguageChanged(langauge, index);
                        },
                        selectedLanguage: item.language,
                      );
                    },
                  ),
                  BrandVSpace.gap26(),
                  BrandButton.primary(
                    title: context.loc.merge_and_go_back,
                    onTap: mergeOnTap,
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
