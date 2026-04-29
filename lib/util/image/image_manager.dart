import 'dart:io';
import 'dart:typed_data';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:fotocolab_design_system/design_system/utils/utils.dart';
import 'package:image/image.dart' as img;

class FFmpegTextPosition {
  final double x;
  final double y; // already converted for FFmpeg (top-based)
  final double fontSize;

  FFmpegTextPosition({
    required this.x,
    required this.y,
    required this.fontSize,
  });
}

class TextMetrics {
  final Size size;
  final double ascent;
  final double descent;

  TextMetrics(this.size, this.ascent, this.descent);
}

/// Crops image to nearest 3:4 or 9:16 from center.
/// Returns Uint8List (PNG, no quality loss).
abstract class ImageManager {
  static Future<Uint8List> cropToAspectSmart(String filePath) async {
    final file = File(filePath);

    if (!await file.exists()) {
      throw Exception("File not found: $filePath");
    }

    final bytes = await file.readAsBytes();

    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      throw Exception("Unable to decode image");
    }

    final int width = decoded.width;
    final int height = decoded.height;

    final double currentRatio = width / height;

    const double ratio3by4 = 3 / 4; // 0.75
    const double ratio9by16 = 9 / 16; // 0.5625

    const double tolerance = 0.02; // adjust if needed

    // If already close to 3:4 or 9:16 → return original
    if ((currentRatio - ratio3by4).abs() < tolerance ||
        (currentRatio - ratio9by16).abs() < tolerance) {
      return bytes;
    }

    //  Choose nearest ratio
    final double targetRatio =
        (currentRatio - ratio3by4).abs() < (currentRatio - ratio9by16).abs()
        ? ratio3by4
        : ratio9by16;

    int newWidth = width;
    int newHeight = height;

    if (currentRatio > targetRatio) {
      //  Image too wide → crop width
      newWidth = (height * targetRatio).round();
    } else {
      //  Image too tall → crop height
      newHeight = (width / targetRatio).round();
    }

    //  Center crop offsets
    final int offsetX = ((width - newWidth) / 2).round();
    final int offsetY = ((height - newHeight) / 2).round();

    final cropped = img.copyCrop(
      decoded,
      x: offsetX,
      y: offsetY,
      width: newWidth,
      height: newHeight,
    );

    //  Encode as PNG (lossless)
    final Uint8List result = Uint8List.fromList(img.encodePng(cropped));

    return result;
  }

  static Future<Size> getImageSize(String filePath) async {
    final file = File(filePath);

    if (!await file.exists()) {
      throw Exception("File not found: $filePath");
    }

    final bytes = await file.readAsBytes();

    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      throw Exception("Unable to decode image");
    }

    final int width = decoded.width;
    final int height = decoded.height;
    return Size(width.toDouble(), height.toDouble());
  }

  static Future<Size> getVideoSize(String filePath) async {
    final session = await FFprobeKit.getMediaInformation(filePath);
    final info = session.getMediaInformation();

    final streams = info?.getStreams();
    final videoStream = streams?.firstWhere((s) => s.getType() == 'video');

    final width =
        double.tryParse(
          videoStream?.getAllProperties()?['width'].toString() ?? '',
        ) ??
        0;
    final height =
        double.tryParse(
          videoStream?.getAllProperties()?['height'].toString() ?? '',
        ) ??
        0;

    return Size(width, height);
  }

  static Future<FFmpegTextPosition> calculateFFmpegPosition({
    required String videoPath,
    required Size stackSize,
    required BoxFit fit,
    required Offset textOffset, // position of text in Stack
    required String text,
    required double uiFontSize,
    required String fontFamily,
    double? fromTop,
    double? fromBottom,
  }) async {
    final session = await FFprobeKit.execute(
      '-v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 "$videoPath"',
    );

    final output = await session.getOutput();
    final parts = output!.trim().split(',');
    final videoWidth = double.parse(parts[0]);
    final videoHeight = double.parse(parts[1]);

    final scaleX = videoWidth / stackSize.width;
    final scaleY = videoHeight / stackSize.height;

    // final ffmpegX = textOffset.dx * scaleX;
    // final ffmpegY = textOffset.dy * scaleY;
    final ffmpegX = (textOffset.dx * 3 * scaleX).round().toDouble();
    final ffmpegY = (textOffset.dy * 3 * scaleY).round().toDouble();
    // final fitted = applyBoxFit(fit, videoSize, stackSize);
    // final renderSize = fitted.destination;

    // final dx = (stackSize.width - renderSize.width) / 2;
    // final dy = (stackSize.height - renderSize.height) / 2;

    // final rect = Rect.fromLTWH(dx, dy, renderSize.width, renderSize.height);

    // final adjustedX = (textOffset.dx - rect.left).clamp(0.0, rect.width);
    // final adjustedY = (textOffset.dy - rect.top).clamp(0.0, rect.height);

    // // Step 3: Convert to relative
    // final relativeX = adjustedX / rect.width;
    // final relativeY = adjustedY / rect.height;

    // final ffmpegX = relativeX * videoSize.width;
    // final ffmpegY = relativeY * videoSize.height;

    // final scale = videoSize.width / rect.width;
    // final metrics = measureTextAdvanced(text, uiFontSize, fontFamily);

    // final ffmpegYCorrected = ffmpegY + (metrics.ascent * scale);

    return FFmpegTextPosition(x: ffmpegX, y: ffmpegY, fontSize: uiFontSize);
    // );
    // // Step 2: Calculate rendered image size inside Stack
    // final fitted = applyBoxFit(fit, originalSize, stackSize);

    // final renderSize = fitted.destination;

    // final dx = (stackSize.width - renderSize.width) / 2;
    // final dy = (stackSize.height - renderSize.height) / 2;

    // final imageRect = Rect.fromLTWH(dx, dy, renderSize.width, renderSize.height);

    // // Step 3: Resolve vertical position (top/bottom)
    // double finalTop;

    // if (fromTop != null) {
    //   finalTop = fromTop;
    // } else if (fromBottom != null) {
    //   finalTop = stackSize.height - fromBottom;
    // } else {
    //   throw Exception("Provide either fromTop or fromBottom");
    // }

    // // Override stackOffset Y if using top/bottom logic
    // final effectiveOffset = Offset(textOffset.dx, finalTop);

    // // Step 4: Measure text in Flutter
    // // Step 5: Calculate scale factor (Stack → Image)
    // final scale = originalSize.width / imageRect.width;

    // // Step 6: Convert stack position → image space
    // final adjustedX = (effectiveOffset.dx - imageRect.left).clamp(
    //   0.0,
    //   imageRect.width,
    // );

    // final adjustedY = (effectiveOffset.dy - imageRect.top).clamp(
    //   0.0,
    //   imageRect.height,
    // );

    // // Step 7: Convert to relative position
    // final relativeX = adjustedX / imageRect.width;
    // final relativeY = adjustedY / imageRect.height;

    // // Step 8: Convert to FFmpeg pixel space
    // final ffmpegLeft = relativeX * originalSize.width;
    // final ffmpegTop = relativeY * originalSize.height;
    // final scaledAscent = metrics.ascent * scale;

    // final ffmpegTopCorrected = ffmpegTop + scaledAscent;

    // final ffmpegFontSize = uiFontSize * scale;

    // return FFmpegTextPosition(
    //   x: ffmpegLeft,
    //   y: ffmpegTopCorrected,
    //   fontSize: ffmpegFontSize,
    // );
  }

  static TextMetrics measureTextAdvanced(
    String text,
    double fontSize,
    String fontFamily,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          package: BrandConstansts.packageName,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final lineMetrics = textPainter.computeLineMetrics().first;

    return TextMetrics(
      textPainter.size,
      lineMetrics.ascent,
      lineMetrics.descent,
    );
  }

  static String wrapTextForFFmpeg({
    required String text,
    required double maxWidth,
    required double fontSize,
    required String fontFamily,
  }) {
    final words = text.split(RegExp(r'\s+'));
    final lines = <String>[];

    String currentLine = '';

    final textStyle = TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      package: BrandConstansts.packageName,
    );

    for (final word in words) {
      final testLine = currentLine.isEmpty ? word : '$currentLine $word';

      final tp = TextPainter(
        text: TextSpan(text: testLine, style: textStyle),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      )..layout(maxWidth: double.infinity);

      if (tp.width > maxWidth) {
        if (currentLine.isNotEmpty) {
          lines.add(currentLine);
        }

        currentLine = word;
      } else {
        currentLine = testLine;
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    return lines.join(r'\n');
  }
}
