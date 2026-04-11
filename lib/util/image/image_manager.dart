import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

/// Crops image to nearest 3:4 or 9:16 from center.
/// Returns Uint8List (PNG, no quality loss).
Future<Uint8List> cropToAspectSmart(String filePath) async {
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
