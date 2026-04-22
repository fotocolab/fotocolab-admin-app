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
  const RenderScreen({
    super.key,
    required this.text,
    required this.fontFamily,
    required this.progress,
    required this.left,
    required this.top,
    required this.fontSize,
    required this.transition,
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
    final textWidth = measureTextAdvanced(
      widget.text,
      widget.fontSize,
      widget.fontFamily,
    ).size.width;

    final startX = -textWidth;

    final endX = widget.left;

    final t = easeOut(_progress);

    return (startX + (endX - startX) * t, widget.top);
  }

  (double, double) getAnimatedRightToCenter() {
    final screenWidth = MediaQuery.of(context).size.width;

    final startX = screenWidth;

    final endX = widget.left;

    final t = easeOut(_progress);

    return (startX + (endX - startX) * t, widget.top);
  }

  (double, double) getAnimatedTopToCenter() {
    final textHeight = measureTextAdvanced(
      widget.text,
      widget.fontSize,
      widget.fontFamily,
    ).size.height;

    final startY = -textHeight;

    final endY = widget.top;

    final t = easeOut(_progress);

    final animatedY = startY + (endY - startY) * t;

    return (widget.left, animatedY);
  }

  (double, double) getAnimatedBottomToCenter() {
    final screenHeight = MediaQuery.of(context).size.height;

    final startY = screenHeight;

    final endY = widget.top;

    final t = easeOut(_progress);

    final animatedY = startY + (endY - startY) * t;

    return (widget.left, animatedY);
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
                        left: getleftAndTop().$1,
                        top: getleftAndTop().$2,
                        child: ClipRect(
                          child: Align(
                            alignment: .centerLeft,
                            widthFactor: _progress,
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
