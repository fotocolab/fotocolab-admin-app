import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fotocolab_design_system/design_system/widget/brand_icon_buton.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? path;
  const VideoPlayerWidget({super.key, this.path});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.path != null) {
      _controller = VideoPlayerController.file(File(widget.path!));
      _controller.addListener(() {
        isPlaying = _controller.value.isPlaying;
      });
      _controller.initialize().then((_) {
        setState(() {});
      });
      _controller.play();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: _controller.value.isInitialized
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                isPlaying
                    ? BrandIconButon(
                        iconData: Icons.pause,
                        height: 32,
                        width: 32,
                        onTap: () {
                          _controller.pause();
                          setState(() {});
                        },
                      )
                    : BrandIconButon(
                        iconData: Icons.play_arrow,
                        height: 32,
                        width: 32,
                        onTap: () {
                          _controller.play();
                          setState(() {});
                        },
                      ),
              ],
            )
          : Container(),
    );
  }
}
