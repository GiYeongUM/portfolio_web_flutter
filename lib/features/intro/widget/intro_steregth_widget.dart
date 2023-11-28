import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class IntroStrengthWidget extends StatefulWidget {
  const IntroStrengthWidget({Key? key, required this.onPrevious, required this.onNext}) : super(key: key);

  final Function() onPrevious;
  final Function() onNext;

  @override
  State<IntroStrengthWidget> createState() => _IntroStrengthWidgetState();
}

class _IntroStrengthWidgetState extends State<IntroStrengthWidget> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  var stepOffset = 0;
  var stepPosition = 0.0;
  var scrollPixels = 0.0;

  @override
  void initState() {
    setScrollListener(_scrollController);
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.animateTo(stepHeight / 4, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.backgroundColor,
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            constraints: BoxConstraints(minHeight: stepHeight),
            child: Column(
              children: [
                SizedBox(height: stepHeight / 4),
                const IntroStrengthDataWidget(),
                SizedBox(height: stepHeight / 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setScrollListener(ScrollController controller) {
    controller.addListener(() {
      if (isMinimum(controller)) widget.onPrevious.call();
      if (isMaximum(controller)) widget.onNext.call();
    });
  }

  get pixels => _scrollController.offset;

  get stepHeight => MediaQuery.of(context).size.height;
}
