import 'package:flutter/cupertino.dart';
import 'package:fotocolab_admin/util/enum/font_enum.dart';
import 'package:fotocolab_admin/util/enum/transition_enum.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_image_state.freezed.dart';

@freezed
class EditImageState with _$EditImageState {
  const factory EditImageState({
    @Default(45) double logoWidth,
    @Default(45) double logoHeight,
    @Default(10) double logoPositionTop,
    @Default(10) double logoPositionLeft,
    @Default(0) double sliderPositionWidth,
    @Default(0) double sliderPositionHeight,
    @Default(0) double radiusSlider,
    @Default(0) double logoRadius,
    @Default(0) double borderThiknessSlider,
    @Default(0) double logoBorder,
    @Default(AppColors.white) Color fontColor,
    @Default(AppColors.transparent) Color logoBorderColor,
    @Default(true) bool isFilledFont,
    @Default(FontStyle.normal) FontStyle fontStyle,
    @Default(10) double fontPositionBottom,
    @Default(10) double fontPositionLeft,
    @Default(24) double fontSize,
    @Default(0.5) double fontSizeSliderValue,
    @Default(FontWeight.w500) FontWeight fontWeight,
    @Default(false) bool isBold,
    @Default(false) bool isItalic,
    @Default(FontEnum.inter) FontEnum selectedFont,
    @Default(TransitionEnum.leftToCenter) TransitionEnum selectedTransition,
  }) = _EditImageState;
}
