import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';

import '../../../core/core.dart';
import '../../intro/widget/hover_change_widget.dart';

class StrengthUiUxWidget extends StatefulWidget {
  const StrengthUiUxWidget({super.key});

  @override
  State<StrengthUiUxWidget> createState() => _StrengthUiUxWidgetState();
}

class _StrengthUiUxWidgetState extends State<StrengthUiUxWidget> {
  late VideoPlayerController _firstVideoPlayerController;
  late VideoPlayerController _secondVideoPlayerController;

  @override
  void initState() {
    super.initState();
    _firstVideoPlayerController = VideoPlayerController.asset('assets/videos/ui_ux_1.mp4');
    _secondVideoPlayerController = VideoPlayerController.asset('assets/videos/ui_ux_2.mp4');
    _firstVideoPlayerController.initialize().then((_) {
      _firstVideoPlayerController.setVolume(0);
      _firstVideoPlayerController.play();
      _firstVideoPlayerController.setLooping(true);
    });
    _secondVideoPlayerController.initialize().then((_) {
      _secondVideoPlayerController.setVolume(0);
      _secondVideoPlayerController.play();
      _secondVideoPlayerController.setLooping(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: context.isDesktop ? MainAxisAlignment.start : MainAxisAlignment.spaceAround,
      children: [
        HoverChangeWidget(
          type: HoverType.up,
          onInitialAnimation: false,
          animatedChild: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 1.5),
            width: context.isDesktop ? null : MediaQuery.of(context).size.width / 2.5,
            child: AspectRatio(
              aspectRatio: 886 / 1920,
              child: ClipRRect(borderRadius: BorderRadius.circular(8), child: VideoPlayer(_firstVideoPlayerController)),
            ),
          ),
        ).animate().fadeIn(duration: 500.ms, delay: 1.seconds).moveX(begin: 24, end: 0, duration: 500.ms, delay: 1.seconds, curve: Curves.easeOut),
        if (context.isDesktop) const SizedBox(width: 40),
        HoverChangeWidget(
          type: HoverType.up,
          onInitialAnimation: false,
          animatedChild: Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 1.5),
              width: context.isDesktop ? null : MediaQuery.of(context).size.width / 2.5,
              child: AspectRatio(aspectRatio: 886 / 1920, child: ClipRRect(borderRadius: BorderRadius.circular(8), child: VideoPlayer(_secondVideoPlayerController)))),
        ).animate().fadeIn(duration: 500.ms, delay: 1500.ms).moveX(begin: 24, end: 0, duration: 500.ms, delay: 1500.ms, curve: Curves.easeOut),
      ],
    );
  }
}
