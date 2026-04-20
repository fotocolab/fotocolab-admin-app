import 'package:flutter/material.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:fotocolab_design_system/design_system/utils/utils.dart';

class RenderScreen extends StatefulWidget {
  final String text;
  final String fontFamily;
  final double progress, left, top, fontSize;

  const RenderScreen({
    super.key,
    required this.text,
    required this.fontFamily,
    required this.progress,
    required this.left,
    required this.top,
    required this.fontSize,
  });

  @override
  State<RenderScreen> createState() => RenderScreenState();
}

class RenderScreenState extends State<RenderScreen> {
  // double _progress = 0;

  final GlobalKey repaintKey = GlobalKey();

  void setProgress(double value) {
    if (mounted) {
      // setState(() => _progress = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        children: [
          BrandVSpace.gap60(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greenEF),
            ),
            child: Center(
              child: RepaintBoundary(
                key: repaintKey,
                child: Container(
                  width: context.screenWidth,
                  height: context.screenWidth * 4 / 3,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        left: widget.left,
                        top: widget.top,
                        child: Text(
                          widget.text,
                          style: TextStyle(
                            fontSize: widget.fontSize,
                            color: Colors.white,
                            fontFamily: widget.fontFamily,
                            package: BrandConstansts.packageName,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.35),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
