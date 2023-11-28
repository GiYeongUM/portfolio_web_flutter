import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:giyeong_um_porfolio_page/core/core.dart';

import '../../features.dart';

class IntroStrengthDataWidget extends StatelessWidget {
  const IntroStrengthDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.isDesktop ? 40 : 16, vertical: context.isDesktop ? 40 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "About me",
                  textStyle: context.textTheme.krSubtitle1,
                  speed: const Duration(milliseconds: 100),
                  cursor: '',
                ),
              ],
              totalRepeatCount: 1,
              displayFullTextOnTap: true,
            ),
          ),
          const SizedBox(height: 16),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 2,
                  decoration: BoxDecoration(
                    color: context.colorTheme.wallColor,
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(child: Text(context.localization.strength_1, style: context.textTheme.krBody4)),
              ],
            ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 500.ms),
          ),
          context.isMobile
              ? ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return strengthWidgets(context)[index];
                  },
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: strengthWidgets(context),
                )
        ],
      ),
    );
  }

  List<Widget> strengthWidgets(BuildContext context) {
    return [
      HoverChangeWidget(
        firstChild: Container(
          key: const ValueKey<bool>(false),
          padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 8 : 0, vertical: 24),
          width: context.isMobile ? double.infinity : MediaQuery.of(context).size.width / 3 - 32,
          child: AspectRatio(
            aspectRatio: 0.85,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/ui_ux.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        secondChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("UI/UX", style: context.textTheme.krSubtitle2),
            Text('Intuitive and Efficient.', style: context.textTheme.krBody1),
          ],
        ),
        delay: 1.seconds,
      ),
      HoverChangeWidget(
        firstChild: Container(
          key: const ValueKey<bool>(false),
          padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 8 : 0, vertical: 24),
          width: context.isMobile ? double.infinity : MediaQuery.of(context).size.width / 3 - 32,
          child: AspectRatio(
            aspectRatio: 0.85,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/knowledge.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        secondChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Knowledge", style: context.textTheme.krSubtitle2),
            Text('Thoroughly and Extensively.', style: context.textTheme.krBody1),
          ],
        ),
        delay: 1200.ms,
      ),
      HoverChangeWidget(
        firstChild: Container(
          padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 8 : 0, vertical: 24),
          width: context.isMobile ? double.infinity : MediaQuery.of(context).size.width / 3 - 32,
          child: AspectRatio(
            aspectRatio: 0.85,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/avility.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        secondChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ability", style: context.textTheme.krSubtitle2),
            Text('Reliability and Performance.', style: context.textTheme.krBody1),
          ],
        ),
        delay: 1400.ms,
      )
    ];
  }
}

/*

first
Container(
            key: const ValueKey<bool>(true),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            width: context.isDesktop ? MediaQuery.of(context).size.width / 3 - 80 : double.infinity,
            child: Column(
              children: [
                Lottie.asset('assets/json/uiux_lottie.json', fit: BoxFit.contain, height: 160),
                const SizedBox(height: 16),
                Align(alignment: Alignment.centerLeft, child: Text("UI/UX", style: context.textTheme.krSubtitle2)),
                const SizedBox(height: 24),
                Text(context.localization.strength_2, style: context.textTheme.krBody1),
              ],
            ),
          )

second
Container(
            key: const ValueKey<bool>(true),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            width: context.isDesktop ? MediaQuery.of(context).size.width / 3 - 80 : double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/json/cross_platform_lottie.json', fit: BoxFit.contain, height: 160),
                const SizedBox(height: 16),
                Align(alignment: Alignment.centerLeft, child: Text("Knowledge", style: context.textTheme.krSubtitle2)),
                const SizedBox(height: 24),
                Text(context.localization.strength_3, style: context.textTheme.krBody1),
              ],
            ),
          )

third
Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            width: context.isDesktop ? MediaQuery.of(context).size.width / 3 - 80 : double.infinity,
            child: Column(
              children: [
                Lottie.asset('assets/json/update_lottie.json', fit: BoxFit.contain, height: 160),
                const SizedBox(height: 16),
                Align(alignment: Alignment.centerLeft, child: Text("Ability", style: context.textTheme.krSubtitle2)),
                const SizedBox(height: 24),
                Text(context.localization.strength_4, style: context.textTheme.krBody1, maxLines: 7),
              ],
            ),
          )

 */
