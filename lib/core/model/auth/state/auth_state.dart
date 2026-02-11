// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 16/10/2025

import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({@Default(false) bool isLoading}) = _AuthState;
}
