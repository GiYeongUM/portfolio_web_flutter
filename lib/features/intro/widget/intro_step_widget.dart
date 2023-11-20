import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/config/config.dart';
import '../../../core/util/static_logic.dart';

class IntroStepWidget extends StatefulWidget {
  const IntroStepWidget({Key? key, required this.onPrevious}) : super(key: key);

  final Function onPrevious;

  @override
  State<IntroStepWidget> createState() => _IntroStepWidgetState();
}

class _IntroStepWidgetState extends State<IntroStepWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  final ScrollController _scrollController = ScrollController();
  var stepOffset = 0;
  var stepPosition = 0.0;
  var scrollPixels = 0.0;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (isMinimum(_scrollController, edge: true) && !context.isMobile) widget.onPrevious.call();
      final offset = getScrollOffset(context);
      final position = getScrollPosition(context, offset);
      if (stepOffset != offset) {
        _controller.reset();
      }
      if (stepPosition >= position) {
        _controller.animateBack(position);
        setState(() {
          scrollPixels = pixels;
          stepOffset = offset;
          stepPosition = position;
        });
        return;
      }

      setState(() {
        scrollPixels = pixels;
        stepOffset = offset;
        stepPosition = position;
      });

      if (stepOffset >= 3) {
        if (!_controller.isAnimating) _controller.forward();
        return;
      }

      _controller.animateTo(2 * position);
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
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      child: Container(
        constraints: BoxConstraints(minHeight: stepHeight * 4.5),
        decoration: const BoxDecoration(
          color: floor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: scrollPixels),
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
          ],
        ),
      ),
    );
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
