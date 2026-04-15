import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/util/enum/font_enum.dart';
import 'package:fotocolab_admin/util/enum/transition_enum.dart';
import 'package:fotocolab_admin/util/image/image_manager.dart';
import 'package:fotocolab_admin/util/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

abstract class VideoManager {
  static Future<String?> toVideoAndroid({
    String? imagePath,
    String? audioPath,
    String? overlayPath,
    required double fontSize,
    required double textfromLeft,
    required double textfromTop,
    required TransitionEnum transition,
    required Color fontColor,
    required FontEnum font,
    required Size stackSize,
    required double overlaySize,
    required Offset overlayPosition,
    // required String text,
  }) async {
    if (kIsWeb) {
      NavigationService.showErrorSnackbar(message: 'Web not supported');
      return null;
    }

    double ox = overlayPosition.dx;

    double oy = overlayPosition.dy;

    double os = overlaySize;

    final dir = await getTemporaryDirectory();

    final outputPath =
        "${dir.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4";

    final command =
        '-loop 1 -i "$imagePath" -stream_loop -1 -i "$audioPath" -t 15 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2"  -c:v libx264 -pix_fmt yuv420p -c:a aac -shortest -y "$outputPath"';
    final session = await FFmpegKit.execute(command);

    final returnCode = await session.getReturnCode();

    await session.getOutput();

    if (ReturnCode.isSuccess(returnCode)) {
      if (overlayPath != null) {
        final dir = await getTemporaryDirectory();

        final finalOutputPath =
            "${dir.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4";

        /// Video
        final command =
            '''-i "$outputPath" -stream_loop -1 -i "$overlayPath" -filter_complex "[1:v]crop=in_h*3/4:in_h:(in_w-out_w)/2:0,chromakey=0x00FF00:0.3:0.1[ck]; [ck]scale=$os:-1[ov]; [0:v][ov]overlay=$ox:$oy:shortest=1" -map 0:a? -c:v libx264 -pix_fmt yuv420p -c:a copy -shortest -y "$finalOutputPath"''';

        await FFmpegKit.execute(command);

        return finalOutputPath;
      } else {
        return outputPath;
      }
    } else {
      debugLog("❌ Failed");
    }
    return null;
  }

  static Future<String?> textToVideoAndroid({
    required String text,
    required String videoPath,
    required double fontSize,
    required double textfromLeft,
    required double textfromTop,
    required TransitionEnum transition,
    required Color fontColor,
    required FontEnum font,
    required Size stackSize,
  }) async {
    var mText = wrapTextForFFmpeg(
      text: text,
      maxWidth: stackSize.width,
      fontSize: fontSize,
      fontFamily: font.fontFamily,
    ).replaceAll(r'\n', '\n');

    final result = await calculateFFmpegPosition(
      videoPath: videoPath,
      fontFamily: font.fontFamily,
      textOffset: Offset(textfromLeft, textfromTop),
      text: mText,
      fromTop: textfromTop,
      uiFontSize: fontSize,
      stackSize: stackSize,
      fit: BoxFit.contain,
    );

    double tx = (result.x) + 40;

    double ty = (result.y) - 20;

    double fSize = result.fontSize;

    /// Adding Text

    final dir = await getTemporaryDirectory();

    var loadedFont = await rootBundle.load(font.path);

    String fontLocalPath = '${dir.path}/font.ttf';

    final fontFile = await File(
      fontLocalPath,
    ).writeAsBytes(loadedFont.buffer.asUint8List());

    final textToVideoOutputPath =
        "${dir.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4";

    final c1 =
        '''-i $videoPath -vf "drawtext=fontfile=${fontFile.path}:text='$mText':'${transition.cmd(tx, ty)}':fontsize=$fSize:fontcolor=white:line_spacing=10:fix_bounds=1:alpha='if(lt(t,1),t/1, 1)'" -t 15 -r 60 -c:v libx264 -pix_fmt yuv420p -crf 18 -preset medium $textToVideoOutputPath''';

    await FFmpegKit.execute(c1);

    return textToVideoOutputPath;
  }
}
