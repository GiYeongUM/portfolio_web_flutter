import 'package:flutter/material.dart';

import '../../../core/config/config.dart';
import '../../features.dart';

class EntranceFloorWidget extends StatelessWidget {
  const EntranceFloorWidget({Key? key, required this.animation}) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Positioned(
            bottom: 0,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: floorHeight(context),
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
          );
        });
  }

  double floorHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height * (1.5 - animation.value)) / 4;
  }
}
