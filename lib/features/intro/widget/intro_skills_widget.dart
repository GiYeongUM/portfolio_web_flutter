import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:giyeong_um_porfolio_page/features/features.dart';

import '../../../core/core.dart';

class IntroSkillsWidget extends StatelessWidget {
  const IntroSkillsWidget({Key? key}) : super(key: key);

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
                  "Development skills",
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
                Flexible(child: Text(context.localization.skill, style: context.textTheme.krBody4)),
              ],
            ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 500.ms),
          ),
          const SizedBox(height: 56),
          Align(
            alignment: context.isDesktop ? Alignment.centerLeft : Alignment.centerLeft,
            child: Container(
              width: context.isDesktop ? MediaQuery.of(context).size.width / 2 : double.infinity,
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: IPhoneWidget(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        crossAxisSpacing: context.isDesktop ? 16 : 16,
                        mainAxisSpacing: context.isDesktop ? 16 : 16,
                        children: skillImages()
                            .asMap()
                            .entries
                            .map(
                              (e) => HoverChangeWidget(
                                type: HoverType.zoom,
                                animatedChild: AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(context.isDesktop ? 16 : 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: context.colorTheme.foregroundColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      e.value,
                                      color: e.key == 2 ? context.colorTheme.reverseColor : null,
                                    ),
                                  ),
                                ),
                                delay: (e.key * 100).ms,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> skillImages() {
    return [
      "assets/icons/ic_flutter.png",
      "assets/icons/ic_android.png",
      "assets/icons/ic_apple.png",
      "assets/icons/ic_nest.png",
      "assets/icons/ic_dart.png",
      "assets/icons/ic_kotlin.png",
      "assets/icons/ic_swift.png",
      "assets/icons/ic_typescript.png",
      "assets/icons/ic_fastlane.png",
      "assets/icons/ic_shorebird.png",
      "assets/icons/ic_swiftui.png",
      "assets/icons/ic_firebase.png",
      "assets/icons/ic_git.png",
      "assets/icons/ic_gitlab.png",
      "assets/icons/ic_jira.png",
      "assets/icons/ic_confluence.png",
      "assets/icons/ic_figma.png",
      "assets/icons/ic_notion.png",
      "assets/icons/ic_slack.png",
    ];
  }
}
