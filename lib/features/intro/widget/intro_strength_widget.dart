import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/core.dart';
import '../../features.dart';

class IntroStrengthWidget extends StatelessWidget {
  const IntroStrengthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
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
        type: HoverType.arrow,
        header: Container(
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
        animatedChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("UI/UX", style: context.textTheme.krSubtitle2),
            Text('Intuitive and Efficient.', style: context.textTheme.krBody1),
          ],
        ),
        delay: 1.seconds,
        route: '/',
      ),
      HoverChangeWidget(
        type: HoverType.arrow,
        header: Container(
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
        animatedChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Knowledge", style: context.textTheme.krSubtitle2),
            Text('Thoroughly and Extensively.', style: context.textTheme.krBody1),
          ],
        ),
        delay: 1200.ms,
      ),
      HoverChangeWidget(
        type: HoverType.arrow,
        header: Container(
          padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 8 : 0, vertical: 24),
          width: context.isMobile ? double.infinity : MediaQuery.of(context).size.width / 3 - 32,
          child: AspectRatio(
            aspectRatio: 0.85,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/ability.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        animatedChild: Column(
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
