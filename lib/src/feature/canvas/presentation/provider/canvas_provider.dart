import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/canvas/state/edit_image_state.dart';
import 'package:fotocolab_admin/util/enum/font_enum.dart';
import 'package:fotocolab_admin/util/enum/transition_enum.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

final editImageProvider =
    StateNotifierProvider<EditImageNotifierProvider, EditImageState>(
      (ref) => EditImageNotifierProvider(ref),
    );

class EditImageNotifierProvider extends StateNotifier<EditImageState> {
  EditImageNotifierProvider(this.ref) : super(const EditImageState());

  final Ref ref;
  double get logoWidth => state.logoWidth;
  double get logoHeight => state.logoHeight;
  double get logoPositionTop => state.logoPositionTop;
  double get logoPositionLeft => state.logoPositionLeft;
  double get sliderPositionWidth => state.sliderPositionWidth;
  double get sliderPositionHeight => state.sliderPositionHeight;
  double get radiusSlider => state.radiusSlider;
  double get logoRadius => state.logoRadius;
  double get borderThiknessSlider => state.borderThiknessSlider;
  double get logoBorder => state.logoBorder;
  Color get fontColor => state.fontColor;
  Color get logoBorderColor => state.logoBorderColor;
  bool get isFilledFont => state.isFilledFont;
  FontStyle get fontStyle => state.fontStyle;
  double get fontPositionTop => state.fontPositionBottom;
  double get fontPositionLeft => state.fontPositionLeft;
  double get fontSize => state.fontSize;
  double get fontSizeSliderValue => state.fontSizeSliderValue;
  FontWeight get fontWeight => state.fontWeight;
  bool get isBold => state.isBold;
  bool get isItalic => state.isItalic;

  FontEnum get selectedFont => state.selectedFont;

  TransitionEnum get selectedTransition => state.selectedTransition;

  void radiusSliderChanged(double value) {
    setRadiusSlider = value;
    setLogoRadius = value * 100;
  }

  void onWidthChanged(double value) {
    setSliderPositionWidth = value;
    setLogoWidth = value * 300;
  }

  void onHeightChanged(double value) {
    setSliderPositionHeight = value;
    setLogoHeight = value * 300;
  }

  void borderThiknessOnChanged(double value) {
    setBorderThiknessSlider = value;
    setLogoBorder = value * 50;
  }

  void onLogoBorderColor(Color value) {
    setLogoBorderColor = value;
  }

  void onFilledFont(bool value) {
    setIsFilledFont = value;
  }

  void fontFamilyOnTap(FontEnum font) {
    setFont = font;
  }

  void onFontSizeChanged(double value) {
    setFontSizeSliderValue = value;
    setFontSize = value * 50;
  }

  void onIsBoldChanged(bool value) {
    if (value) {
      setFontWeight = .w900;
    } else {
      setFontWeight = .w500;
    }
    setIsBold = value;
  }

  void onIsItalicChanged(bool value) {
    if (value) {
      setFontStyle = .italic;
    } else {
      setFontStyle = .normal;
    }
    setIsItalic = value;
  }

  void onFontColorChanged(Color value) {
    setFontColor = value;
  }

  void onFontPositionChanged(Offset value) {
    setFontPositionLeft = fontPositionLeft + value.dx;
    setFontPositionBottom = fontPositionTop + value.dy;
  }

  void clearAllValues() {
    state = state.copyWith(
      logoWidth: 45,
      logoHeight: 45,
      borderThiknessSlider: 0,
      fontColor: AppColors.green34,
      selectedFont: .inter,
      fontPositionBottom: 10,
      fontPositionLeft: 10,
      fontSize: 12,
      fontSizeSliderValue: 0.5,
      fontStyle: FontStyle.normal,
      fontWeight: .w500,
      isBold: false,
      isFilledFont: true,
      isItalic: false,
      logoBorder: 0,
      logoBorderColor: AppColors.transparent,
      logoPositionLeft: 10,
      logoPositionTop: 10,
      logoRadius: 0,
      radiusSlider: 0,
      sliderPositionHeight: 0,
      sliderPositionWidth: 0,
    );
  }

  set setLogoWidth(double value) {
    state = state.copyWith(logoWidth: value);
  }

  set setLogoHeight(double value) {
    state = state.copyWith(logoHeight: value);
  }

  set setLogoPositionTop(double value) {
    state = state.copyWith(logoPositionTop: value);
  }

  set setLogoPositionLeft(double value) {
    state = state.copyWith(logoPositionLeft: value);
  }

  set setSliderPositionWidth(double value) {
    state = state.copyWith(sliderPositionWidth: value);
  }

  set setSliderPositionHeight(double value) {
    state = state.copyWith(sliderPositionHeight: value);
  }

  set setRadiusSlider(double value) {
    state = state.copyWith(radiusSlider: value);
  }

  set setLogoRadius(double value) {
    state = state.copyWith(logoRadius: value);
  }

  set setBorderThiknessSlider(double value) {
    state = state.copyWith(borderThiknessSlider: value);
  }

  set setLogoBorder(double value) {
    state = state.copyWith(logoBorder: value);
  }

  set setFontColor(Color value) {
    state = state.copyWith(fontColor: value);
  }

  set setLogoBorderColor(Color value) {
    state = state.copyWith(logoBorderColor: value);
  }

  set setIsFilledFont(bool value) {
    state = state.copyWith(isFilledFont: value);
  }

  set setFontStyle(FontStyle value) {
    state = state.copyWith(fontStyle: value);
  }

  set setFont(FontEnum value) {
    state = state.copyWith(selectedFont: value);
  }

  set setFontPositionBottom(double value) {
    state = state.copyWith(fontPositionBottom: value);
  }

  set setFontPositionLeft(double value) {
    state = state.copyWith(fontPositionLeft: value);
  }

  set setFontSize(double value) {
    state = state.copyWith(fontSize: value);
  }

  set setFontSizeSliderValue(double value) {
    state = state.copyWith(fontSizeSliderValue: value);
  }

  set setFontWeight(FontWeight value) {
    state = state.copyWith(fontWeight: value);
  }

  set setIsBold(bool value) {
    state = state.copyWith(isBold: value);
  }

  set setIsItalic(bool value) {
    state = state.copyWith(isItalic: value);
  }

  set setSelectedTransiton(TransitionEnum value) {
    state = state.copyWith(selectedTransition: value);
  }
}
