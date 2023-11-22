import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/core.dart';

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
      _scrollController.animateTo(stepHeight / 2, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      _controller.forward();
      stepPosition = stepHeight / 2;
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
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      controller: _scrollController,
      child: Container(
        constraints: BoxConstraints(minHeight: stepHeight * 4.5),
        decoration: const BoxDecoration(
          color: floor,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: scrollPixels),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: constraints.maxWidth > 1200
                    ? SizedBox(
                        height: stepHeight,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
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
                            ),
                            const Expanded(flex: 1, child: Text('data')),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
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
                          const Text('data'),
                        ],
                      ),
              ),
            ],
          );
        }),
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
