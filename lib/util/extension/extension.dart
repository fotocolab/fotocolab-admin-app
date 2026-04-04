// Created By Suresh M, 07/03/2025

import 'package:flutter/material.dart';
import 'package:fotocolab_admin/localization/l10n/l10n.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';

extension LocalizationExtension on BuildContext {
  S get loc => S.of(this);

  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
}

extension StringOperation on String {
  String toFirstCaps() {
    try {
      return (this).substring(0, 1).toUpperCase() +
          (this).substring(1, (this).length).toLowerCase();
    } catch (e) {
      return this;
    }
  }

  String camelCaseToTitle() {
    final result = (this).replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );

    return result[0].toUpperCase() + result.substring(1);
  }
}

extension AppColorFilter on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.src);
}

extension FileSize on int {
  double get toMb => (((this) / 1024) / 1024);
}

extension GetLanguage on String {
  LanguageEnum get toLanguageEnum {
    if (this == LanguageEnum.english.value) {
      return .english;
    }
    if (this == LanguageEnum.hindi.value) {
      return .hindi;
    }
    if (this == LanguageEnum.assamese.value) {
      return .assamese;
    }
    if (this == LanguageEnum.bengali.value) {
      return .bengali;
    }
    if (this == LanguageEnum.bodo.value) {
      return .bodo;
    }
    if (this == LanguageEnum.gujarati.value) {
      return .gujarati;
    }
    if (this == LanguageEnum.kannada.value) {
      return .kannada;
    }
    if (this == LanguageEnum.malayalam.value) {
      return .malayalam;
    }
    if (this == LanguageEnum.marathi.value) {
      return .marathi;
    }
    if (this == LanguageEnum.nepali.value) {
      return .nepali;
    }
    if (this == LanguageEnum.odia.value) {
      return .odia;
    }
    if (this == LanguageEnum.punjabi.value) {
      return .punjabi;
    }
    if (this == LanguageEnum.tamil.value) {
      return .tamil;
    }
    if (this == LanguageEnum.telugu.value) {
      return .telugu;
    }
    if (this == LanguageEnum.urdu.value) {
      return .urdu;
    }

    return .english;
  }

  bool get isVideo => split('.').last.contains('mp4');
}
