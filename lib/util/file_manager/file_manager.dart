import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img;

abstract class FileManager {
  static Future<PlatformFile?> uploadSingle({
    List<String> allowedExtensions = const ['png', 'jpg', 'jpeg', 'mp4'],
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: allowedExtensions,
      type: FileType.custom,
    );

    if (result != null) {
      return result.files.first;
    } else {
      return null;
    }
  }

  static Future<List<PlatformFile>> uploadMultiple({
    List<String> allowedExtensions = const ['png', 'jpg', 'jpeg', 'mp4'],
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: allowedExtensions,
      type: FileType.custom,
      allowMultiple: true,
    );

    if (result != null) {
      var files = result.files;
      List<PlatformFile> k = [];
      for (var i in files) {
        k.add(await cropToThreeFour(i));
      }

      return k;
    } else {
      return [];
    }
  }

  static Future<PlatformFile> cropToThreeFour(PlatformFile file) async {
    final bytes = file.bytes!;
    img.Image? decoded = img.decodeImage(bytes);

    if (decoded == null) return file;

    if (isNearAspectRatio(decoded.width, decoded.height)) {
      return file;
    }

    final image = img.Image(width: decoded.width, height: decoded.height);

    for (int y = 0; y < decoded.height; y++) {
      for (int x = 0; x < decoded.width; x++) {
        image.setPixel(x, y, decoded.getPixel(x, y));
      }
    }

    int width = decoded.width;
    int height = decoded.height;

    double targetRatio = 3 / 4;
    int cropWidth = width;
    int cropHeight = (width / targetRatio).toInt();

    if (cropHeight > height) {
      cropHeight = height;
      cropWidth = (height * targetRatio).toInt();
    }

    int x = ((width - cropWidth) / 2).round();
    int y = ((height - cropHeight) / 2).round();

    img.Image cropped = img.copyCrop(
      image,
      x: x,
      y: y,
      width: cropWidth,
      height: cropHeight,
    );

    final newBytes = img.encodeJpg(cropped);
    var f = PlatformFile(name: 'image', size: newBytes.length, bytes: newBytes);

    return f;
  }

  static bool isNearAspectRatio(int width, int height) {
    double ratio = width / height;

    const r34 = 3 / 4;
    const r916 = 9 / 16;

    const tolerance = 0.03;

    return (ratio - r34).abs() < tolerance || (ratio - r916).abs() < tolerance;
  }
}
