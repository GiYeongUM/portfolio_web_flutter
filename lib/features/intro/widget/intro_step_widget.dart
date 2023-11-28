import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gif/gif.dart';
import 'package:lottie/lottie.dart';

import '../../../core/core.dart';
import '../../features.dart';

class IntroStepWidget extends StatefulWidget {
  const IntroStepWidget({Key? key, required this.onPrevious}) : super(key: key);

  final Function onPrevious;

  @override
  State<IntroStepWidget> createState() => _IntroStepWidgetState();
}

class _IntroStepWidgetState extends State<IntroStepWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final AnimationController _gifController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  final ScrollController _scrollController = ScrollController();
  var stepOffset = 0;
  var stepPosition = 0.0;
  var scrollPixels = 0.0;

  @override
  void initState() {
    setScrollListener(_scrollController, gifController: _gifController);
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.animateTo(stepHeight / 4, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      _controller.forward();
      stepPosition = stepHeight / 4;
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: context.colorTheme.wallColor,
      radius: const Radius.circular(20),
      controller: _scrollController,
      thickness: 10,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorTheme.backgroundColor,
        ),
        child: Stack(
          children: [
            Blur(
              blur: 4,
              blurColor: context.colorTheme.backgroundColor ?? Colors.white,
              child: Container(
                width: 400,
                height: 400,
                margin: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorTheme.wallColor ?? Colors.white, width: 20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Gif(
                  image: const AssetImage("assets/images/cloud-4058_512.gif"),
                  autostart: Autostart.no,
                  placeholder: (context) => Container(
                    width: 400,
                    height: 400,
                    color: context.colorTheme.wallColor?.withOpacity(0.8),
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 500.ms)
                .animate(controller: _gifController)
                .moveY(end: -(MediaQuery.of(context).size.height), duration: 1000.ms, curve: Curves.easeInOut)
                .fadeOut(duration: 500.ms, curve: Curves.easeInOut),
            SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                constraints: BoxConstraints(minHeight: stepHeight * 4.5),
                child: Column(
                  children: [
                    SizedBox(height: stepHeight / 4),
                    const IntroStrengthWidget(),
                    SizedBox(height: stepHeight / 4),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              width: context.isDesktop ? 160 : 120,
              height: context.isDesktop ? 160 : 120,
              child: Lottie.asset(
                'assets/json/chair_lottie_${stepOffset + 1}.json',
                animate: false,
                controller: _controller,
                onLoaded: (composition) {
                  setState(() {
                    _controller.duration = composition.duration;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setScrollListener(ScrollController controller, {AnimationController? gifController}) {
    controller.addListener(() {
      final offset = getScrollOffset(context);
      final position = getScrollPosition(context, offset);
      if (stepOffset != 1) {
        gifController?.forward();
      } else {
        gifController?.reverse();
      }
      if (stepOffset != offset) {
        _controller.reset();
      }

      if (stepPosition > position) {
        /// 스크롤 위 방향
        _controller.animateBack(position);
        setState(() {
          scrollPixels = pixels;
          stepOffset = offset;
          stepPosition = position;
        });
        if (isMinimum(controller)) widget.onPrevious.call();
        return;
      }

      setState(() {
        scrollPixels = pixels;
        stepOffset = offset;
        stepPosition = position;
      });
      _controller.forward();
    });
  }

  int getScrollOffset(BuildContext context) {
    return _scrollController.hasClients ? _scrollController.offset ~/ stepHeight : 0;
  }

  double getScrollPosition(BuildContext context, int offset) {
    return (_scrollController.offset - offset * stepHeight) / stepHeight;
  }

  get pixels => _scrollController.offset;

  get stepHeight => MediaQuery.of(context).size.height;
}
