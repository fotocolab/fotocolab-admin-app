// Created By Suresh M, 16/10/2025

import 'package:fotocolab_admin/util/enum/bottom_nav_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(BottomNavEnum.feed) BottomNavEnum selectedBottomNav,
    @Default(false) bool isWhatsappInstalled,
  }) = _HomeState;
}
