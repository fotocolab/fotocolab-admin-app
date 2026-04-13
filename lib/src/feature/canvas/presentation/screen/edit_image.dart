import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/canvas/response/image_title_response_model.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/provider/canvas_provider.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/widget/edit_canvas_text_bottomsheet.dart';
import 'package:fotocolab_admin/util/enum/transition_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/image/image_manager.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class EditImage extends ConsumerStatefulWidget {
  final dynamic routeArgs;
  const EditImage({super.key, this.routeArgs});

  @override
  ConsumerState<EditImage> createState() => _EditImageState();
}

class _EditImageState extends ConsumerState<EditImage> {
  late EditImageNotifierProvider provider;

  ImageTitleResponseModel? image;

  void logoBorderColorPick() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: AppColors.black,
            onColorChanged: (value) {
              provider.onLogoBorderColor(value);
            },
          ),
        ),
      ),
    );
  }

  void fontColorPick() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: AppColors.black,
            onColorChanged: (value) {
              provider.onFontColorChanged(value);
            },
          ),
        ),
      ),
    );
  }

  void textOnTap() {
    openCanvasTextActions(
      context: context,
      isFilled: provider.isFilledFont,
      fillColor: provider.fontColor,
      fontcolorPick: fontColorPick,
      fontStyle: provider.fontStyle,
      fontSizeSliderValue: provider.fontSizeSliderValue,
      onFilledFontTap: provider.onFilledFont,
      onFontTap: provider.fontFamilyOnTap,
      onFontSizeChanged: provider.onFontSizeChanged,
      isBold: provider.isBold,
      onIsBoldChanged: provider.onIsBoldChanged,
      isItalic: provider.isItalic,
      onIsItalicChanged: provider.onIsItalicChanged,
    );
  }

  void fetchData() {
    if (widget.routeArgs != null) {
      try {
        image = widget.routeArgs;
        setState(() {});
      } catch (e) {
        //
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(editImageProvider);
    provider = ref.read(editImageProvider.notifier);

    return BaseLayout(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: context.screenHeight * 0.6,
              maxWidth: context.screenHeight * 0.6,
            ),
            child: Stack(
              fit: .passthrough,
              children: [
                if (image?.image?.path != null)
                  Image.file(File(image!.image!.path!), fit: .contain),

                Positioned(
                  top: provider.fontPositionTop,
                  left: provider.fontPositionLeft,
                  child: GestureDetector(
                    onTap: () {
                      textOnTap();
                    },
                    onPanUpdate: (details) {
                      provider.onFontPositionChanged(details.delta);
                    },
                    child: BrandText.white(
                      data: wrapTextForFFmpeg(
                        text: image?.title ?? '--',
                        maxWidth: context.screenWidth,
                        fontSize: provider.fontSize,
                        fontFamily: provider.selectedFont.fontFamily,
                      ).replaceAll(r'\n', '\n'),
                      textAlign: .center,
                      fontSize: provider.fontSize,
                      fontColor: provider.fontColor,
                      fontFamily: provider.selectedFont.fontFamily,
                      fontStyle: provider.fontStyle,
                      fontWeight: provider.fontWeight,
                    ),
                  ),
                ),
                Positioned(
                  left: provider.overlayPositionLeft,
                  top: provider.overlayPositionTop,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      provider.onOverlayPositionTop(details.delta);
                    },

                    child: RoundedContainer(
                      width: provider.overlayWidth,
                      height: provider.overlayHeight,
                      color: AppColors.white.withAlpha(50),
                      borderColor: AppColors.primary.withAlpha(100),
                      child: Center(
                        child: BrandText.white(data: context.loc.overlay),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BrandVSpace.gap10(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BrandText.white(
              data: context.loc.transition,
              fontWeight: .w600,
            ),
          ),
          BrandVSpace.gap4(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: context.screenWidth,
              height: 100,
              child: ListView.separated(
                scrollDirection: .horizontal,
                padding: .zero,
                shrinkWrap: true,
                itemCount: TransitionEnum.values.length,
                itemBuilder: (context, index) {
                  var e = TransitionEnum.values[index];
                  bool isSelected = e == provider.selectedTransition;
                  return BrandInkWell(
                    onTap: () async {
                      provider.setSelectedTransiton = e;
                    },
                    child: RoundedContainer(
                      height: 80,
                      width: 80,
                      color: AppColors.transparent,
                      borderColor: isSelected
                          ? AppColors.primary
                          : AppColors.primary.withAlpha(50),
                      child: Center(
                        child: BrandText.white(
                          data: e.displayValue,
                          textAlign: .center,
                          fontColor: isSelected
                              ? AppColors.white
                              : AppColors.white.withAlpha(100),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => BrandHSpace.gap10(),
              ),
            ),
          ),
          BrandVSpace.gap26(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BrandButton.primary(
              title: context.loc.confirm,
              onTap: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
