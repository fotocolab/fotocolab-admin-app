import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final dynamic routeArgs;
  const VideoPlayerScreen({super.key, this.routeArgs});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.routeArgs != null) {
      var filePath = widget.routeArgs['videoPath'];
      controller = VideoPlayerController.file(File(filePath!));
      controller.addListener(() {
        setState(() {
          isPlaying = controller.value.isPlaying;
        });
        if (controller.value.isCompleted) {
          setState(() {
            isPlaying = false;
          });
        }
      });
      controller.initialize().then((_) async {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  void init() async {
    var filePath = widget.routeArgs['videoPath'];
    controller = VideoPlayerController.file(File(filePath));
    controller.initialize().then((_) async {
      await Future.delayed(const Duration(milliseconds: 250));
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: controller.value.isInitialized
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
                isPlaying
                    ? BrandIconButon(
                        iconData: Icons.pause,
                        height: 32,
                        width: 32,
                        onTap: () {
                          controller.pause();
                          isPlaying = false;
                          setState(() {});
                        },
                      )
                    : BrandIconButon(
                        iconData: Icons.play_arrow,
                        height: 32,
                        width: 32,
                        onTap: () {
                          controller.play();
                          isPlaying = true;
                          setState(() {});
                        },
                      ),
              ],
            )
          : SizedBox(
              child: BrandTextButton(title: context.loc.play, onTap: init),
            ),
    );
  }
}
