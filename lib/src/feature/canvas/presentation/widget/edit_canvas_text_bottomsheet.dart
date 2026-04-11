import 'package:flutter/material.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/widget/color_picker_button.dart';
import 'package:fotocolab_admin/util/enum/font_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

void openCanvasTextActions({
  required BuildContext context,
  FontStyle? fontStyle,
  Color? fillColor,
  Function(FontEnum font)? onFontTap,
  Function(bool value)? onFilledFontTap,
  bool isFilled = false,
  required final Function fontcolorPick,
  required double fontSizeSliderValue,
  required Function(double value) onFontSizeChanged,
  required Function(bool isBold) onIsBoldChanged,
  required bool isBold,
  required bool isItalic,
  required Function(bool isItalic) onIsItalicChanged,
}) {
  showModalBottomSheet(
    backgroundColor: AppColors.white,
    barrierColor: AppColors.transparent,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, stateSet) {
        return ClipRRect(
          borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(20)),
          child: Container(
            height: context.screenHeight * 0.3,
            width: context.screenWidth,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                BrandVSpace.gap10(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BrandVSpace.gap10(),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Row(
                                children: [
                                  BrandInkWell(
                                    onTap: () {
                                      isFilled = !isFilled;
                                      onFilledFontTap?.call(isFilled);
                                      stateSet(() {});
                                    },
                                    child: RoundedContainer(
                                      color: isFilled
                                          ? fillColor?.withAlpha(100)
                                          : AppColors.transparent,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                        child: BrandText.grey(
                                          data: context.loc.aa,
                                          fontColor: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BrandHSpace.gap10(),
                                  BrandInkWell(
                                    onTap: () {
                                      onIsBoldChanged(!isBold);
                                      isBold = !isBold;
                                      stateSet(() {});
                                    },
                                    child: RoundedContainer(
                                      width: 65,
                                      color: AppColors.greend2,
                                      child: Center(
                                        child: BrandText.secondary(
                                          data: context.loc.b,
                                          fontWeight: isBold ? .w900 : .w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BrandHSpace.gap10(),
                                  BrandInkWell(
                                    onTap: () {
                                      onIsItalicChanged(!isItalic);
                                      isItalic = !isItalic;
                                      if (isItalic) {
                                        fontStyle = .italic;
                                      } else {
                                        fontStyle = .normal;
                                      }
                                      stateSet(() {});
                                    },
                                    child: RoundedContainer(
                                      width: 65,
                                      color: AppColors.greend2,
                                      child: Center(
                                        child: BrandText.secondary(
                                          data: context.loc.i,
                                          fontStyle: fontStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              BrandHSpace.gap10(),
                              BrandIconButon(
                                iconData: Icons.close,
                                onTap: () {
                                  context.pop();
                                },
                              ),
                            ],
                          ),

                          BrandVSpace.gap10(),
                          SizedBox(
                            height: 45,
                            child: ListView.separated(
                              itemCount: FontEnum.values.length,
                              scrollDirection: .horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = FontEnum.values[index];
                                return BrandInkWell(
                                  onTap: () {
                                    onFontTap?.call(item);
                                  },
                                  child: RoundedContainer(
                                    color: AppColors.primary.withAlpha(200),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 4,
                                      ),
                                      child: Center(
                                        child: BrandText.white(
                                          data: context.loc.aa,
                                          fontFamily: item.fontFamily,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  BrandHSpace.gap10(),
                            ),
                          ),
                          BrandVSpace.gap10(),
                          Row(
                            children: [
                              BrandText.grey(
                                data: context.loc.font_color,
                                fontSize: BrandFontSize.size12,
                              ),
                              BrandHSpace.gap10(),
                              ColorPickerButton(colorPick: fontcolorPick),
                            ],
                          ),
                          BrandVSpace.gap10(),
                          Row(
                            children: [
                              BrandText.grey(
                                data: context.loc.size,
                                fontSize: BrandFontSize.size12,
                              ),
                              Expanded(
                                child: Slider(
                                  value: fontSizeSliderValue,
                                  onChanged: (value) {
                                    fontSizeSliderValue = value;
                                    onFontSizeChanged(value);
                                    stateSet(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          BrandVSpace.gap10(),

                          BrandVSpace.gap100(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
