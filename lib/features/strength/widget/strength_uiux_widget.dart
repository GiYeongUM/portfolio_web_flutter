import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';

import '../../../core/core.dart';

class StrengthUiUxWidget extends StatefulWidget {
  const StrengthUiUxWidget({super.key});

  @override
  State<StrengthUiUxWidget> createState() => _StrengthUiUxWidgetState();
}

class _StrengthUiUxWidgetState extends State<StrengthUiUxWidget> {
  late List<VideoPlayerController> _videoPlayerControllers;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _videoPlayerControllers = [
      VideoPlayerController.asset('assets/videos/ui_ux_1.mp4'),
      VideoPlayerController.asset('assets/videos/ui_ux_2.mp4'),
      VideoPlayerController.asset('assets/videos/ui_ux_3.mp4'),
      VideoPlayerController.asset('assets/videos/ui_ux_4.mp4'),
      VideoPlayerController.asset('assets/videos/ui_ux_5.mp4'),
    ];
    for (var element in _videoPlayerControllers) {
      element.initialize().then((_) {
        element.setVolume(0);
        element.play();
        element.setLooping(true);
      });
    }
  }

  onPointerScroll(PointerScrollEvent pointerSignal) {
    if (pointerSignal.scrollDelta.dy != 0 &&
        scrollController.offset + pointerSignal.scrollDelta.dy >= -200 &&
        scrollController.offset + pointerSignal.scrollDelta.dy <= scrollController.position.maxScrollExtent + 200) {
      scrollController.jumpTo(scrollController.offset + pointerSignal.scrollDelta.dy);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) onPointerScroll(pointerSignal);
      },
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: _videoPlayerControllers
                  .asMap()
                  .entries
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 1.5),
                      width: context.isDesktop ? null : MediaQuery.of(context).size.width / 2.5,
                      child: AspectRatio(
                        aspectRatio: 886 / 1920,
                        child: ClipRRect(borderRadius: BorderRadius.circular(8), child: VideoPlayer(e.value)),
                      ),
                    ).animate().fadeIn(duration: 500.ms, delay: (500 + e.key * 500).ms).moveX(begin: 24, end: 0, duration: 500.ms, delay: (500 + e.key * 500).ms, curve: Curves.easeOut),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
