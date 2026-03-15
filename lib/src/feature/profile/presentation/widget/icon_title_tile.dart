import 'package:flutter/material.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class IconTitleTile extends StatelessWidget {
  final IconData? iconData;
  final String? value;
  final Color? iconColor;
  final Function? onTap;
  const IconTitleTile({
    super.key,
    this.iconData,
    this.value,
    this.onTap,
    this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return BrandInkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    iconData ?? Icons.open_with_outlined,
                    color: iconColor ?? AppColors.white,
                  ),
                  BrandHSpace.gap10(),
                  BrandText.white(data: value ?? '-'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
