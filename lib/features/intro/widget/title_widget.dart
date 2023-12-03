import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:giyeong_um_porfolio_page/features/features.dart';
import '../../../core/core.dart';
import 'package:lottie/lottie.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.onContact});

  final Function() onContact;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.pointBackgroundColor,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: constraints.maxWidth > 1200
                ? Container(
                    key: ValueKey<bool>(constraints.maxWidth > 1200),
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(flex: 1, child: TextTitle(onContact: onContact)),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Lottie.asset(
                                  'assets/json/profile_lottie.json',
                                  fit: BoxFit.contain,
                                ),
                              ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 2000.ms),
                            )
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                : Container(
                    key: ValueKey<bool>(constraints.maxWidth > 1200),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Lottie.asset(
                            'assets/json/profile_lottie.json',
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 700.ms),
                        TextTitle(onContact: onContact),
                      ],
                    ),
                  ));
      }),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.onContact});

  final Function() onContact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "Developer",
              textStyle: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.primaryColor, fontSize: 32),
              speed: const Duration(milliseconds: 100),
              cursor: '',
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
        ),
        const SizedBox(height: 16),
        AutoSizeText('GiYeong UM', style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.primaryColor, fontSize: 80), maxFontSize: 80, maxLines: 1)
            .animate()
            .fade(duration: 500.ms, delay: 700.ms, curve: Curves.easeInOut)
            .moveY(delay: 700.ms, duration: 500.ms, curve: Curves.easeInOut, begin: -10, end: 0),
        const SizedBox(height: 16),
        Text.rich(
          TextSpan(
            style: context.textTheme.krBody4,
            children: <TextSpan>[
              TextSpan(text: '${context.localization.as_a} '),
              TextSpan(
                text: 'Flutter',
                style: context.textTheme.krSubtitle1,
              ),
              TextSpan(
                text: ' ${context.localization.intro}',
              ),
            ],
          ),
          style: context.textTheme.krBody4,
          textAlign: TextAlign.left,
        ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 1200.ms),
        SizedBox(height: context.isMobile ? 24 : 40),
        Stack(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: context.colorTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(context.localization.contact, style: context.textTheme.krButton1.copyWith(color: white)),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: white,
                      size: 16,
                    ),
                  ],
                )),
            HoverChangeWidget(
              type: HoverType.shadow,
              onInitialAnimation: false,
              onClick: () => onContact.call(),
              animatedChild: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(color: context.colorTheme.primaryColor, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(context.localization.contact, style: context.textTheme.krButton1.copyWith(color: white)),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_circle_right_rounded,
                        color: white,
                        size: 16,
                      ),
                    ],
                  )),
            ),
          ],
        ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 1200.ms),
      ],
    );
  }
}
