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
