import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? path;
  const VideoPlayerWidget({super.key, this.path});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.path != null) {
      controller = VideoPlayerController.file(File(widget.path!));
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
      // controller.initialize().then((_) async {
      //   if (mounted) {
      //     setState(() {});
      //   }
      // });
    }
  }

  void init() async {
    controller = VideoPlayerController.file(File(widget.path!));
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
    return SizedBox(
      width: 120,
      child: controller.value.isInitialized
          ? Column(
              children: [
                BrandInkWell(
                  onTap: () {
                    context.push(
                      RouteName.videoPlayer,
                      extra: {"videoPath": widget.path},
                    );
                  },
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
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
