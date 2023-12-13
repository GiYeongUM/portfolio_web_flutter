import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StrengthUiUxWidget extends StatefulWidget {
  const StrengthUiUxWidget({super.key});

  @override
  State<StrengthUiUxWidget> createState() => _StrengthUiUxWidgetState();
}

class _StrengthUiUxWidgetState extends State<StrengthUiUxWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset("assets/videos/ui_ux_1.mpeg")
      ..initialize().then((_) {
        _videoPlayerController.setVolume(0);
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      width: _videoPlayerController.value.size.width,
      height: _videoPlayerController.value.size.height,
      child: VideoPlayer(_videoPlayerController),
    );
  }
}
