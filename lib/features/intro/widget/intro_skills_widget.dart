import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:giyeong_um_porfolio_page/features/features.dart';

import '../../../core/core.dart';

class IntroSkillsWidget extends StatelessWidget {
  const IntroSkillsWidget({Key? key, this.onItemClick}) : super(key: key);

  final Function(SkillItem)? onItemClick;

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
              constraints: BoxConstraints(maxWidth: 1200, maxHeight: context.isDesktop ? (MediaQuery.of(context).size.height * 3 / 4) : double.infinity),
              padding: EdgeInsets.symmetric(horizontal: context.isDesktop ? 16 : 40),
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
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: SkillItem.values.asMap()
                            .entries
                            .map(
                              (e) => HoverChangeWidget(
                                type: HoverType.zoom,
                                onClick: () => onItemClick?.call(e.value),
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
                                      e.value.imageUrl ?? '',
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
              ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 500.ms).moveY(begin: 100, end: 0, duration: 500.ms, curve: Curves.easeInOut, delay: 500.ms),
            ),
          ),
        ],
      ),
    );
  }

  Map<(int, String), String> skillImages() {
    return {
      (0, 'flutter'): "assets/icons/ic_flutter.png",
      (1, 'android'): "assets/icons/ic_android.png",
      (2, 'apple'): "assets/icons/ic_apple.png",
      (3, 'nest'): "assets/icons/ic_nest.png",
      (4, 'dart'): "assets/icons/ic_dart.png",
      (5, 'kotlin'): "assets/icons/ic_kotlin.png",
      (6, 'swift'): "assets/icons/ic_swift.png",
      (7, 'typescript'): "assets/icons/ic_typescript.png",
      (8, 'fastlane'): "assets/icons/ic_fastlane.png",
      (9, 'shorebird'): "assets/icons/ic_shorebird.png",
      (10, 'swiftui'): "assets/icons/ic_swiftui.png",
      (11, 'firebase'): "assets/icons/ic_firebase.png",
      (12, 'git'): "assets/icons/ic_git.png",
      (13, 'gitlab'): "assets/icons/ic_gitlab.png",
      (14, 'jira'): "assets/icons/ic_jira.png",
      (15, 'confluence'): "assets/icons/ic_confluence.png",
      (16, 'figma'): "assets/icons/ic_figma.png",
      (17, 'notion'): "assets/icons/ic_notion.png",
      (18, 'slack'): "assets/icons/ic_slack.png",
    };
  }
}
