import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:giyeong_um_porfolio_page/core/config/config.dart';
import 'package:lottie/lottie.dart';

class ChairWidget extends StatelessWidget {
  const ChairWidget({Key? key, required this.page}) : super(key: key);

  final int page;

  @override
  Widget build(BuildContext context) {
    return page == 0
        ? const SizedBox()
        : Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: context.isDesktop ? 160 : 120,
              height: context.isDesktop ? 160 : 120,
              child: Lottie.asset(
                'assets/json/chair_lottie_$page.json',
                animate: true,
                repeat: false,
              ),
            ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut),
          );
  }
}
