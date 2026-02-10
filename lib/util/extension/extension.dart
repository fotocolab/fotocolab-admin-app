// Created By Suresh M, 07/03/2025

import 'package:flutter/material.dart';
import 'package:fotocolab_admin/localization/l10n/l10n.dart';

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
}

extension AppColorFilter on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.src);
}
