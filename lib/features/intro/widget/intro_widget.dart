import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../core/config/config.dart';
import '../../features.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: yellow1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / (ResponsiveBreakpoints.of(context).isDesktop ? 2 : 1),
                  height: MediaQuery.of(context).size.height / (ResponsiveBreakpoints.of(context).isDesktop ? 1 : 2),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      Lottie.asset(
                        'assets/json/chair_lottie_1.json',
                        repeat: false,
                      ),
                      Lottie.asset('assets/json/chair_lottie_2.json', repeat: false),
                      Lottie.asset(
                        'assets/json/chair_lottie_3.json',
                        repeat: false,
                      ),
                      Lottie.asset(
                        'assets/json/chair_lottie_4.json',
                        repeat: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / (ResponsiveBreakpoints.of(context).isDesktop ? 2 : 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hej!',
                        style: context.textTheme.krSubtitle1.copyWith(color: Colors.red, fontSize: (context.textTheme.krSubtitle1.fontSize ?? 16)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.5) / 4,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height * 0.5) / 4,
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
    );
  }
}
