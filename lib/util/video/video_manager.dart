import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/util/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

abstract class VideoManager {
  static Future<String?> toVideoAndroid({
    String? imagePath,
    String? audioPath,
  }) async {
    if (kIsWeb) {
      NavigationService.showErrorSnackbar(message: 'Web not supported');
      return null;
    }

    final dir = await getTemporaryDirectory();

    final outputPath =
        "${dir.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4";

    final command =
        '-loop 1 -i "$imagePath" -i "$audioPath" -t 10 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2"  -c:v libx264 -pix_fmt yuv420p -c:a aac -shortest -y "$outputPath"';
    final session = await FFmpegKit.execute(command);

    final returnCode = await session.getReturnCode();
    final output = await session.getOutput();

    debugLog("FFmpeg Output:\n$output");
    if (ReturnCode.isSuccess(returnCode)) {
      debugLog("✅ Video created: $outputPath");
      return outputPath;
    } else {
      debugLog("❌ Failed");
    }
    return null;
  }
}
