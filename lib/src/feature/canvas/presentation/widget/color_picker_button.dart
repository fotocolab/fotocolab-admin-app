import 'package:flutter/material.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class ColorPickerButton extends StatelessWidget {
  final Function colorPick;
  const ColorPickerButton({super.key, required this.colorPick});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: AppColors.white,
        child: BrandInkWell(
          onTap: () {
            colorPick();
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.white,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: [
                  Color(0xFFFF0000), // Red
                  Color(0xFFFF7F00), // Orange
                  Color(0xFFFFFF00), // Yellow
                  Color(0xFF00FF00), // Green
                  Color(0xFF0000FF), // Blue
                  Color(0xFF4B0082), // Indigo
                  Color(0xFF8F00FF), // Violet
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
