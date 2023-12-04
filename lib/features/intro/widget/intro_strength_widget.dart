import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/core.dart';
import '../../../core/domain/model/strength.dart';
import '../../features.dart';

class IntroStrengthWidget extends StatelessWidget {
  const IntroStrengthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorTheme.pointBackgroundColor,
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      padding: EdgeInsets.symmetric(horizontal: context.isDesktop ? 40 : 16, vertical: context.isDesktop ? 40 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  context.localization.about_me,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(context.localization.strength_1, style: context.textTheme.krBody4).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 500.ms),
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: context.isDesktop ? 0.8 : 1, crossAxisCount: context.isDesktop ? 3 : 1),
              itemBuilder: (context, index) {
                return HoverChangeWidget(
                  type: HoverType.arrow,
                  header: Expanded(
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            key: ValueKey<int>(index),
                            padding: EdgeInsets.symmetric(horizontal: context.isDesktop ? 24 : 24, vertical: 24),
                            width: context.isDesktop ? MediaQuery.of(context).size.width / 3 - 32 : double.infinity,
                            child: Container(
                              margin: const EdgeInsets.all(80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage("${strengthWidgets[index].imageUrl}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (context.isDesktop) Container(margin: const EdgeInsets.symmetric(horizontal: 8), color: context.colorTheme.primaryColor, height: 1),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  animatedChild: Hero(
                    tag: '${strengthWidgets[index].title}',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${strengthWidgets[index].title}", style: context.textTheme.krSubtitle1),
                        const SizedBox(height: 8),
                        Text('${strengthWidgets[index].description}', style: context.textTheme.krBody4),
                      ],
                    ),
                  ),
                  delay: (1000 + 200 * index).ms,
                  route: '/strength/$index',
                );
              }),
        ],
      ),
    );
  }

  List<Strength> get strengthWidgets => [
        const Strength(imageUrl: "assets/images/ui_ux.png", title: "UI/UX", description: "Intuitive and Efficient."),
        const Strength(imageUrl: "assets/images/knowledge.png", title: "Knowledge", description: "Thoroughly and Extensively."),
        const Strength(imageUrl: "assets/images/ability.png", title: "Ability", description: "Reliability and Performance."),
      ];
}
