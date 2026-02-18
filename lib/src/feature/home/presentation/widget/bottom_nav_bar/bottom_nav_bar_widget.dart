import 'package:flutter/material.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class BottomNavBarWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isActive;
  final IconData iconData;
  const BottomNavBarWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return BrandInkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: isActive ? AppColors.primary : AppColors.blue8B,
            ),
            BrandVSpace.gap10(),
            BrandText.white(
              data: title,
              fontWeight: FontWeight.bold,
              fontSize: BrandFontSize.size12,
              maxLines: 1,
              fontColor: isActive ? AppColors.primary : AppColors.blue8B,
            ),
            BrandVSpace.gap10(),
          ],
        ),
      ),
    );
  }
}
