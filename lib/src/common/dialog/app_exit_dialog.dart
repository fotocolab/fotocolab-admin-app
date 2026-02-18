import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class AppExitWarning {
  static Future<void> showdialog({
    required BuildContext context,
    String? title,
    String? subTitle,
    IconData? iconData,
    Function? onConfirm,
    String? confirmButtonTitle,
  }) {
    return BrandDialog.alertDialog(
      context: context,
      child: Material(
        color: AppColors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              width: context.screenWidth,
              height: context.screenHeight * 0.4,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Spacer(),
                  BrandVSpace.gap10(),
                  RoundedContainer(
                    width: 100,
                    height: 100,
                    color: AppColors.red36.withAlpha(100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Icon(
                        iconData ?? Icons.gpp_maybe_outlined,
                        color: AppColors.red36,
                        size: 55,
                      ),
                    ),
                  ),
                  BrandVSpace.gap16(),
                  BrandText.secondary(
                    data: title ?? context.loc.are_you_sure,
                    fontSize: BrandFontSize.size20,
                    fontWeight: FontWeight.w700,
                  ),
                  BrandText.grey(
                    data: subTitle ?? context.loc.are_you_sure_you_want_to_exit,
                    fontSize: BrandFontSize.size12,
                    fontWeight: FontWeight.w700,
                    fontColor: AppColors.greyA3,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BrandButton.primary(
                        title: context.loc.cancel,
                        onTap: () {
                          context.pop();
                        },
                      ),
                      BrandHSpace.gap16(),
                      BrandButton.secondary(
                        title: confirmButtonTitle ?? context.loc.confirm,
                        onTap: () {
                          if (onConfirm != null) {
                            onConfirm.call();
                          } else {
                            context.pop();
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
