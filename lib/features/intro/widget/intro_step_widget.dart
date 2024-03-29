import 'package:flutter/material.dart';

import '../../../core/core.dart';

class IntroStepWidget extends StatelessWidget {
  const IntroStepWidget({super.key, required this.onPrevious, required this.onNext, required this.child, required this.color});

  final Function() onPrevious;
  final Function() onNext;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController(initialScrollOffset: context.stepHeight);
    return Container(
      color: color,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          controller: scrollController
            ..addListener(() {
              if (isMinimum(scrollController)) onPrevious.call();
              if (isMaximum(scrollController)) onNext.call();
            }),
          child: Container(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                SizedBox(height: context.stepHeight),
                child,
                SizedBox(height: context.stepHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
