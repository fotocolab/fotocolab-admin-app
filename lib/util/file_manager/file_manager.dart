import 'package:file_picker/file_picker.dart';

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
      return result.files;
    } else {
      return [];
    }
  }
}
