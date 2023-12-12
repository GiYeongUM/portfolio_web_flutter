import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/features/features.dart';
import 'package:video_player/video_player.dart';

class StrengthUiUxWidget extends StatefulWidget {
  const StrengthUiUxWidget({super.key});

  @override
  State<StrengthUiUxWidget> createState() => _StrengthUiUxWidgetState();
}

class _StrengthUiUxWidgetState extends State<StrengthUiUxWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/ui_ux_1.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      width: MediaQuery.of(context).size.width / 3,
      child: IPhoneWidget(
        bottomWidget: false,
        child: VideoPlayer(
          _controller,
        ),
      ),
    );
  }
}
