import 'package:flutter/material.dart';
import 'package:fotocolab_admin/util/enum/transition_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/image/image_manager.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:fotocolab_design_system/design_system/utils/utils.dart';

class RenderScreen extends StatefulWidget {
  final String text;
  final String fontFamily;
  final double progress, left, top, fontSize;
  final TransitionEnum transition;
  final Color? fontColor;
  final Size stackSize;
  final bool isCenter;
  const RenderScreen({
    super.key,
    required this.text,
    required this.fontFamily,
    required this.progress,
    required this.left,
    required this.top,
    required this.fontSize,
    required this.transition,
    required this.stackSize,
    this.fontColor,
    this.isCenter = true,
  });

  @override
  State<RenderScreen> createState() => RenderScreenState();
}

class RenderScreenState extends State<RenderScreen> {
  double _progress = 0;

  final GlobalKey repaintKey = GlobalKey();

  void setProgress(double value) {
    if (mounted) {
      setState(() => _progress = value);
    }
  }

  double easeOut(double t) => 1 - (1 - t) * (1 - t);

  (double, double) getleftAndTop() {
    if (widget.transition == .leftToCenter) {
      return getAnimatedLeftToCenter();
    }
    if (widget.transition == .rightToCenter) {
      return getAnimatedRightToCenter();
    }
    if (widget.transition == .topToCenter) {
      return getAnimatedTopToCenter();
    }
    if (widget.transition == .bottomToCenter) {
      return getAnimatedBottomToCenter();
    }
    return (10, 10);
  }

  (double, double) getAnimatedLeftToCenter() {
    final textSize = ImageManager.measureTextAdvanced(
      widget.text,
      widget.fontSize,
      widget.fontFamily,
    ).size;

    final startX = -textSize.width;

    final endX = widget.isCenter
        ? (widget.stackSize.width - textSize.width) / 2
        : widget.left;

    final t = easeOut(_progress);

    final x = startX + (endX - startX) * t;

    return (x, widget.top);
  }

  (double, double) getAnimatedRightToCenter() {
    final textSize = ImageManager.measureTextAdvanced(
      widget.text,
      widget.fontSize,
      widget.fontFamily,
    ).size;

    final startX = widget.stackSize.width;

    final endX = widget.isCenter ? (startX - textSize.width) / 2 : widget.left;

    final t = easeOut(_progress);

    final x = startX + (endX - startX) * t;

    return (x, widget.top);
  }

  (double, double) getAnimatedTopToCenter() {
    final textSize = ImageManager.measureTextAdvanced(
      widget.text,
      widget.fontSize,
      widget.fontFamily,
    ).size;

    final screenHeight = widget.stackSize.height;
    final screenWidth = widget.stackSize.width;

    final startY = -textSize.height;

    final endY = widget.isCenter
        ? (screenHeight - textSize.height) / 2
        : widget.top;

    final t = easeOut(_progress);

    final y = startY + (endY - startY) * t;

    final x = widget.isCenter
        ? (screenWidth - textSize.width) / 2
        : widget.left;

    return (x, y);
  }

  (double, double) getAnimatedBottomToCenter() {
    final textSize = ImageManager.measureTextAdvanced(
      widget.text,
      widget.fontSize,
      widget.fontFamily,
    ).size;

    final screenSize = widget.stackSize;

    final startY = screenSize.height;
    final endY = widget.top;

    final t = easeOut(_progress);

    final animatedY = startY + (endY - startY) * t;

    final x = widget.isCenter
        ? (screenSize.width - textSize.width) / 2
        : widget.left;

    return (x, animatedY);
  }

  String getVisibleText() {
    final total = widget.text.length;
    final count = (total * _progress).clamp(0, total).toInt();
    return widget.text.substring(0, count);
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
                        left: getleftAndTop().$1.roundToDouble(),
                        top: getleftAndTop().$2.roundToDouble(),
                        child: Text(
                          widget.text,
                          textAlign: .center,
                          style: TextStyle(
                            fontSize: widget.fontSize,
                            fontFamily: widget.fontFamily,
                            package: BrandConstansts.packageName,
                            height: 1,
                            fontWeight: .w500,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 0.5
                              ..color = Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        left: getleftAndTop().$1.roundToDouble(),
                        top: getleftAndTop().$2.roundToDouble(),
                        child: Text(
                          widget.text,
                          textAlign: .center,
                          style: TextStyle(
                            fontSize: widget.fontSize,
                            color: widget.fontColor ?? Colors.white,
                            fontFamily: widget.fontFamily,
                            package: BrandConstansts.packageName,
                            height: 1,
                            fontWeight: .w500,
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
