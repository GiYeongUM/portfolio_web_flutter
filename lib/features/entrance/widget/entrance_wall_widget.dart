import 'dart:math';

import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/config/config.dart';

class EntranceWallWidget extends StatelessWidget {
  const EntranceWallWidget({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (animation.value != 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.skewY(-calculateHeightFactor(context)),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: calculateWallHeight(context) * (1 - animation.value),
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: context.colorTheme.wallColor,
                          border: const Border(
                            bottom: BorderSide(color: white, width: 20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(4, 0),
                            ),
                          ]),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Transform(
                      transform: Matrix4.skewY(-calculateHeightFactor(context)),
                      child: Container(
                        width: calculateWallHeight(context) * (1 - animation.value),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: context.colorTheme.wallColor,
                          border: const Border(
                            bottom: BorderSide(color: white, width: 20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(4, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
      ],
    );
  }

  double calculateWallHeight(BuildContext context) {
    if (!context.isDesktop) return MediaQuery.of(context).size.width / 4.5;
    if (MediaQuery.of(context).size.width / 4 < MediaQuery.of(context).size.height / 3) {
      return context.stepHeight;
    } else {
      return MediaQuery.of(context).size.width / 4;
    }
  }

  double calculateHeightFactor(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double minFactor = 0.2;
    double maxFactor = 1.0;
    if (!context.isDesktop) return 0.9;
    if (screenHeight > 2160) return maxFactor;
    if (screenHeight < 600) return minFactor;

    // Screen height-dependent calculation
    double heightFactor = minFactor + (maxFactor - minFactor) * (screenHeight / 2160);

    // Clamp the value to the specified range
    return heightFactor.clamp(minFactor, maxFactor);
  }
}
