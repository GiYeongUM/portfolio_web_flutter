import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class IntroTitleWidget extends StatelessWidget {
  const IntroTitleWidget({super.key, required this.onNext, required this.onContact});

  final Function() onNext;
  final Function() onContact;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController..addListener(() => onScroll(controller: scrollController, edge: true, onDone: () => onNext.call())),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TitleWidget(onContact: onContact),
            ),
            Container(color: context.colorTheme.pointBackgroundColor, height: 24),
          ],
        ),
      ),
    );
  }
}

double baseboardHeight(BuildContext context) {
  return MediaQuery.of(context).size.height / 8;
}
