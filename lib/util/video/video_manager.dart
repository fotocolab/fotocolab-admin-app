// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:ui' as ui;
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/screen/render_screen.dart';
import 'package:fotocolab_admin/util/enum/font_enum.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';
import 'package:fotocolab_admin/util/enum/transition_enum.dart';
import 'package:fotocolab_admin/util/image/image_manager.dart';
import 'package:fotocolab_admin/util/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

abstract class VideoManager {
  static Future<String?> applyGreenScreen({
    String? imagePath,
    String? audioPath,
    String? overlayPath,
    required double overlaySize,
    required Offset overlayPosition,
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

  static Future<String?> addTextToVideoAndroid({
    required BuildContext context,
    required String text,
    required LanguageEnum language,
    required String inputVideoPath,
    required Size stackSize,
    required double fontSize,
    required double textfromLeft,
    required double textfromTop,
    required TransitionEnum transition,
    int frameCount = 10,
    Color? fontColor,
  }) async {
    FontEnum font = .inter;

    if (language == .hindi) {
      font = .hindi;
    } else if (language == .assamese) {
      font = .assamese;
    } else if (language == .bengali) {
      font = .bengali;
    } else if (language == .bodo) {
      font = .bodo;
    } else if (language == .gujarati) {
      font = .gujarati;
    } else if (language == .kannada) {
      font = .kannada;
    } else if (language == .malayalam) {
      font = .malayalam;
    } else if (language == .marathi) {
      font = .marathi;
    } else if (language == .nepali) {
      font = .nepali;
    } else if (language == .odia) {
      font = .odia;
    } else if (language == .punjabi) {
      font = .punjabi;
    } else if (language == .tamil) {
      font = .tamil;
    } else if (language == .telugu) {
      font = .telugu;
    } else if (language == .urdu) {
      font = .urdu;
    }

    var mText = ImageManager.wrapTextForFFmpeg(
      text: text,
      maxWidth: stackSize.width,
      fontSize: fontSize,
      fontFamily: font.fontFamily,
    ).replaceAll(r'\n', '\n');

    final GlobalKey<RenderScreenState> key = GlobalKey<RenderScreenState>();

    final dir = await getTemporaryDirectory();

    final frameDir = Directory('${dir.path}/frames');

    if (frameDir.existsSync()) {
      frameDir.deleteSync(recursive: true);
    }

    frameDir.createSync(recursive: true);

    final outputPath =
        '${dir.path}/video_${DateTime.now().microsecondsSinceEpoch}.mp4';

    double progress = 0.0;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RenderScreen(
          key: key,
          text: mText,
          fontFamily: font.fontFamily,
          progress: progress,
          left: textfromLeft,
          top: textfromTop,
          fontSize: fontSize,
          transition: transition,
          fontColor: fontColor,
          stackSize: stackSize,
        ),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 100));

    for (int i = 0; i < frameCount; i++) {
      progress = i / (frameCount - 1);

      key.currentState?.setProgress(progress);

      await Future.delayed(Duration.zero);
      await WidgetsBinding.instance.endOfFrame;
      await Future.delayed(const Duration(milliseconds: 50));

      final state = key.currentState as RenderScreenState;

      final boundary =
          state.repaintKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;

      final image = await boundary.toImage(pixelRatio: 2.75);

      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      final file = File(
        '${frameDir.path}/frame_${i.toString().padLeft(4, '0')}.png',
      );
      await file.writeAsBytes(byteData!.buffer.asUint8List());
    }

    if (context.mounted) {
      context.pop();
    }
    var videoSize = await ImageManager.getVideoSize(inputVideoPath);

    double fW = videoSize.width;

    double fh = videoSize.height;

    final cmd =
        '''-i $inputVideoPath -framerate 25 -i ${frameDir.path}/frame_%04d.png -filter_complex "[1:v]scale=${fW.toInt()}:${fh.toInt()}[fg];[0:v][fg]overlay=0:0" -c:v libx264 -pix_fmt yuv420p -crf 18 -preset veryfast $outputPath''';

    var session = await FFmpegKit.execute(cmd);

    var o = await session.getAllLogs();

    for (var i in o) {
      debugLog(i.getMessage());
    }

    return outputPath;
  }
}
