import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

/// Generates an Instagram-style poster from an image
/// Automatically wraps title text, adds gradient, and draws outline + fill for visibility
Future<Uint8List> generateInstagramPoster({
  required Uint8List imageBytes,
  required String title,
  String? subtitle,
  double titleFontSize = 48,
  double subtitleFontSize = 24,
  String fontFamily = 'Datatype',
  String? package,
}) async {
  // Load the image
  final codec = await ui.instantiateImageCodec(imageBytes);
  final frame = await codec.getNextFrame();
  final image = frame.image;

  // Prepare Canvas
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(
    recorder,
    Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
  );

  // Draw original image
  canvas.drawImage(image, Offset.zero, Paint());

  // Draw gradient overlay at bottom
  const gradientHeight = 0.0;
  final gradientPaint = Paint()
    ..shader = ui.Gradient.linear(
      Offset(0, image.height - gradientHeight),
      Offset(0, image.height.toDouble()),
      [Colors.transparent, Colors.black.withAlpha(150)],
    );
  canvas.drawRect(
    Rect.fromLTWH(
      0,
      image.height - gradientHeight,
      image.width.toDouble(),
      gradientHeight,
    ),
    gradientPaint,
  );

  // Helper to wrap text
  List<String> wrapText(
    String text,
    double maxWidth,
    double fontSize,
    String fontFamily,
  ) {
    final words = text.split(' ');
    List<String> lines = [];
    String currentLine = '';

    for (var word in words) {
      String testLine = currentLine.isEmpty ? word : '$currentLine $word';
      final tp = TextPainter(
        text: TextSpan(
          text: testLine,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            package: package,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      if (tp.width > maxWidth) {
        if (currentLine.isNotEmpty) lines.add(currentLine);
        currentLine = word;
      } else {
        currentLine = testLine;
      }
    }
    if (currentLine.isNotEmpty) lines.add(currentLine);
    return lines;
  }

  // Draw text with outline + fill
  void drawText(String text, double yOffset, double fontSize, Color fillColor) {
    final textPainterStroke = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          package: package,
          color: AppColors.white,
          shadows: [
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 4, // soft blur for natural depth
              color: Colors.black.withAlpha(160), // dark shadow
            ),
            Shadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: Colors.black.withAlpha(180),
            ),
          ],
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: image.width - 80);

    final textPainterFill = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          package: package,
          color: fillColor,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: image.width - 80);

    final x = (image.width - textPainterFill.width) / 2;
    textPainterStroke.paint(canvas, Offset(x, yOffset));
    textPainterFill.paint(canvas, Offset(x, yOffset));
  }

  // Calculate total height of text block
  final lines = wrapText(title, image.width - 80, titleFontSize, fontFamily);
  double lineHeight = titleFontSize * 1.2;
  double subtitleHeight = (subtitle != null && subtitle.isNotEmpty)
      ? subtitleFontSize * 1.4
      : 0;
  double totalHeight = lines.length * lineHeight + subtitleHeight;

  // Set startY to vertically center the text block
  double startY = (image.height - totalHeight) / 2; // <-- CENTER
  // Draw title lines
  for (var line in lines) {
    drawText(line, startY, titleFontSize, Colors.white);
    startY += lineHeight;
  }

  // Draw subtitle if any
  if (subtitle != null && subtitle.isNotEmpty) {
    drawText(subtitle, startY, subtitleFontSize, Colors.grey[200]!);
  }

  // Finish image
  final picture = recorder.endRecording();
  final finalImage = await picture.toImage(image.width, image.height);
  final byteData = await finalImage.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}
