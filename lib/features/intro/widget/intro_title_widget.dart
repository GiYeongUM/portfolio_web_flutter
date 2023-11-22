import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class IntroTitleWidget extends StatelessWidget {
  const IntroTitleWidget({Key? key, required this.onNext}) : super(key: key);

  final Function() onNext;

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
            decoration: const BoxDecoration(
              color: yellow1,
            ),
            child: Column(
              children: [
                const Expanded(child: TitleWidget()),
                SizedBox(
                  height: baseboardHeight(context),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: baseboardHeight(context),
                        decoration: const BoxDecoration(
                          color: floor,
                          border: Border(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(color: floor, height: 24),
        ],
      ),
    );
  }
}

double baseboardHeight(BuildContext context) {
  return MediaQuery.of(context).size.height / 8;
}
