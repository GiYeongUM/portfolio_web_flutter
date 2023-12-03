import 'package:flutter/material.dart';

import '../../../core/config/config.dart';

class EntranceFloorWidget extends StatelessWidget {
  const EntranceFloorWidget({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: floorHeight(context),
              decoration: BoxDecoration(
                color: context.colorTheme.floorColor,
                border: const Border(
                  top: BorderSide(color: white, width: 32),
                ),
              ),
            ),
          );
        });
  }

  double floorHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height * (1 - animation.value)) / 4;
  }
}
