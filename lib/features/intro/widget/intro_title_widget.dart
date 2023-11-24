import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/core.dart';
import '../../features.dart';

class IntroTitleWidget extends StatelessWidget {
  const IntroTitleWidget({Key? key, required this.onNext, required this.onContact}) : super(key: key);

  final Function() onNext;
  final Function() onContact;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      controller: scrollController..addListener(() => onScroll(controller: scrollController, edge: true, onDone: () => onNext.call())),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: context.colorTheme.backgroundColor,
            ),
            child: Column(
              children: [
                Expanded(child: TitleWidget(onContact: onContact)),
                SizedBox(
                  height: baseboardHeight(context),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: baseboardHeight(context),
                        decoration: BoxDecoration(
                          color: context.colorTheme.floorColor,
                          border: const Border(
                            top: BorderSide(color: wood, width: 40),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width,
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, -3),
                          ),
                        ]),
                        child: CustomPaint(
                          painter: WoodKnightBaseboardPainter(),
                        ),
                      ),
                      Positioned(bottom: 8, child: Lottie.asset('assets/json/scroll_down.json', fit: BoxFit.fill, height: baseboardHeight(context) / 2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(color: context.colorTheme.floorColor, height: 24),
        ],
      ),
    );
  }
}

double baseboardHeight(BuildContext context) {
  return MediaQuery.of(context).size.height / 8;
}
