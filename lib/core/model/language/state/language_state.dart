// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 16/10/2025

import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'language_state.freezed.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({@Default(Locale('en')) Locale locale}) =
      _LanguageState;
}
