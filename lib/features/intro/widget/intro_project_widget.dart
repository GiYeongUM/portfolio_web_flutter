import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class IntroProjectWidget extends StatelessWidget {
  const IntroProjectWidget({Key? key, required this.onPrevious, required this.onNext}) : super(key: key);

  final Function() onPrevious;
  final Function() onNext;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController(initialScrollOffset: context.stepHeight);

    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.backgroundColor,
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          controller: scrollController
            ..addListener(() {
              if (isMinimum(scrollController)) onPrevious.call();
              if (isMaximum(scrollController)) onNext.call();
            }),
          child: Container(
            constraints: BoxConstraints(minHeight: context.stepHeight),
            child: Column(
              children: [
                SizedBox(height: context.stepHeight),
                const IntroStrengthWidget(),
                SizedBox(height: context.stepHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
