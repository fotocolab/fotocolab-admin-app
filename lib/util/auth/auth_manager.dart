// Created By Suresh M, 11/04/2025

import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/util/storage/local_storage.dart';
import 'package:fotocolab_admin/util/storage/local_storage_key.dart';

class AuthManager {
  static final AuthManager _instance = AuthManager._internal();

  factory AuthManager() => _instance;

  AuthManager._internal();

  String? _token;

  String? get token => _token;

  // String? _refreshToken;

  // String? get refreshToken => _refreshToken;

  Future<void> setToken(String? token) async {
    _token = token;

    /// caching token
    if (token != null) {
      await LocalStorage.setString(key: LocalStorageKey.token, value: token);
    }
  }

  Future<void> fetchToken() async {
    var localToken = await LocalStorage.getString(key: LocalStorageKey.token);

    await setToken(localToken);
  }

  // Future<void> setRefreshToken(String? refreshToken) async {
  //   _refreshToken = refreshToken;

  //   /// caching token
  //   if (refreshToken != null) {
  //     await LocalStorage.setString(
  //       key: LocalStorageKey.refreshToken,
  //       value: refreshToken,
  //     );
  //   }
  // }

  // Future<void> fetchRefreshToken() async {
  //   var localToken = await LocalStorage.getString(
  //     key: LocalStorageKey.refreshToken,
  //   );

  //   await setRefreshToken(localToken);
  // }

  void handleTokenExpiry() {
    // call api and get new token

    LocalStorage.clearKey(LocalStorageKey.token);

    LocalStorage.clearKey(LocalStorageKey.userData);

    NavigationService.navigatorKey.currentContext?.go(
      RouteName.login,
      extra: {'from_invalid_token': true},
    );
  }

  Future<void> setPin(String pin) async {
    await LocalStorage.setString(key: LocalStorageKey.pin, value: pin);
  }

  Future<bool> isPinValid(String pin) async {
    String? cachedPin = await LocalStorage.getString(key: LocalStorageKey.pin);

    if (cachedPin == null) return false;
    if (pin == cachedPin) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> hasPin() async {
    var pin = await LocalStorage.getString(key: LocalStorageKey.pin);
    return pin != null;
  }

  void handleNotFound() {
    NavigationService.navigatorKey.currentContext?.push(RouteName.error);
  }

  Future<bool> loginWithBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();

    try {
      bool authenticated = await auth.authenticate(localizedReason: 'login');
      return authenticated;
    } on PlatformException {
      rethrow;
    }
  }
}
