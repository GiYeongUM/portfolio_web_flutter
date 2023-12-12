import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StrengthUiUxWidget extends StatefulWidget {
  const StrengthUiUxWidget({super.key});

  @override
  State<StrengthUiUxWidget> createState() => _StrengthUiUxWidgetState();
}

class _StrengthUiUxWidgetState extends State<StrengthUiUxWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/ui_ux_1.mp4', videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true));
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.width / 3,
      child: FutureBuilder(
          future: _initializeVideoPlayerFuture.then((value) => _controller.play()),
          builder: (context, snapshot) {
            return VideoPlayer(
              _controller,
            );
          }),
    );
  }
}
