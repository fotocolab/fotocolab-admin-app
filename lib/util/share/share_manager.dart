// Created By Suresh M, 12/12/2025

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';

abstract class ShareManager {
  static Future<XFile> base64ToXFile({
    required String base64String,
    String fileName = "transaction.pdf",
  }) async {
    final tempDir = await getTemporaryDirectory();

    // Decode Base64 into bytes
    final bytes = base64Decode(base64String);

    // Create file path
    final file = File("${tempDir.path}/$fileName");

    // Write bytes into the file
    await file.writeAsBytes(bytes);

    // Return XFile
    return XFile(file.path);
  }

  static Future<void> shareFromBase64({String? base64String}) async {
    if (base64String == null) {
      NavigationService.showErrorSnackbar();
      return;
    }
    XFile? file = await base64ToXFile(base64String: base64String);
    await SharePlus.instance.share(ShareParams(files: [file]));
  }
}
