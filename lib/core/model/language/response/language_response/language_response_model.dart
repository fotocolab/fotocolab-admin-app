// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 16/10/2025

import 'dart:ui';

import 'package:fotocolab_admin/util/enum/language_enum.dart';

class LanguageResponseModel {
  final LanguageEnum language;
  final bool isSelected;
  final Locale locale;

  const LanguageResponseModel({
    required this.isSelected,
    required this.language,
    required this.locale,
  });
}
