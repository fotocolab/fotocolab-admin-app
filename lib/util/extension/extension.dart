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
