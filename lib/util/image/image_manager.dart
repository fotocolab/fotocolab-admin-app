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
    const double horizontalPadding = 16 * 2;

    final effectiveWidth = maxWidth - horizontalPadding;

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

      if (tp.width > effectiveWidth) {
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
