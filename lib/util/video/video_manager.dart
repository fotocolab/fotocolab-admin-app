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
    String? overlay,
  }) async {
    if (kIsWeb) {
      NavigationService.showErrorSnackbar(message: 'Web not supported');
      return null;
    }

    final dir = await getTemporaryDirectory();

    final outputPath =
        "${dir.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4";

    final command =
        '-loop 1 -i "$imagePath" -stream_loop -1 -i "$audioPath" -t 15 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2"  -c:v libx264 -pix_fmt yuv420p -c:a aac -shortest -y "$outputPath"';
    final session = await FFmpegKit.execute(command);

    final returnCode = await session.getReturnCode();

    await session.getOutput();

    if (ReturnCode.isSuccess(returnCode)) {
      debugLog("✅ Video created: $outputPath");
      if (overlay != null) {
        final dir = await getTemporaryDirectory();

        final finalOutputPath =
            "${dir.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4";

        final command =
            '''-i "$outputPath" -stream_loop -1 -i "$overlay" -filter_complex "[1:v][0:v]scale2ref[ov][base]; [ov]crop=in_h*3/4:in_h:(in_w-out_w)/2:0,chromakey=0x00FF00:0.3:0.1[ck]; [base][ck]overlay=shortest=1"  -map 0:a? -c:v libx264 -pix_fmt yuv420p -c:a copy -shortest -y "$finalOutputPath"''';

        final session = await FFmpegKit.execute(command);

        final returnCode = await session.getReturnCode();

        final output = await session.getOutput();

        debugLog(returnCode);

        debugLog(output);

        return finalOutputPath;
      } else {
        return outputPath;
      }
    } else {
      debugLog("❌ Failed");
    }
    return null;
  }
}
