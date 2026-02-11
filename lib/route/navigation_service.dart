// Created By Suresh M, 07/03/2025

import 'package:flutter/material.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

abstract class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static void showSnackbar(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: BrandText(data: message)),
    );
  }

  ///[message] default to "Something went wrong"
  static void showErrorSnackbar({String? message}) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        margin: EdgeInsets.all(8),
        behavior: .floating,
        showCloseIcon: true,
        content: Row(
          children: [
            Expanded(
              child: BrandText(
                data: message ?? 'Something went wrong',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.red36,
      ),
    );
  }

  ///[message] default to "Success"
  static void showSuccessSnackbar({String? message}) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        margin: EdgeInsets.all(8),
        behavior: .floating,
        showCloseIcon: true,
        content: BrandText(
          data: message ?? 'Success',
          fontWeight: FontWeight.w600,
          fontColor: AppColors.white,
        ),
        backgroundColor: AppColors.green33,
      ),
    );
  }
}
