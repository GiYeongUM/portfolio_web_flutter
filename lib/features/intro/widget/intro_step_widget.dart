import 'package:flutter/material.dart';
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
  final ScrollController _scrollController = ScrollController();
  var stepOffset = 0;
  var stepPosition = 0.0;
  var scrollPixels = 0.0;

  @override
  void initState() {
    setScrollListener(_scrollController);
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
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              constraints: BoxConstraints(minHeight: stepHeight * 4.5),
              decoration: BoxDecoration(
                color: context.colorTheme.floorColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: stepHeight / 4),
                  const IntroStrengthWidget(),
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
    );
  }

  void setScrollListener(ScrollController controller) {
    controller.addListener(() {
      final offset = getScrollOffset(context);
      final position = getScrollPosition(context, offset);
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
