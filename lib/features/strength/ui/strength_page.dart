import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:giyeong_um_porfolio_page/features/features.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../core/domain/model/strength.dart';

class StrengthPage extends StatelessWidget {
  const StrengthPage({super.key, this.index = 0});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.backgroundColor,
      body: Padding(
        padding: context.isDesktop ? const EdgeInsets.symmetric(horizontal: 64) : const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(tag: '${strengthWidgets(context)[index].title}', child: Text("${strengthWidgets(context)[index].title}", style: context.textTheme.krSubtitle1)),
                const SizedBox(height: 8),
                Text('${strengthWidgets(context)[index].description}', style: context.textTheme.krBody4)
                    .animate()
                    .fadeIn(duration: 500.ms, delay: 500.ms)
                    .moveX(begin: 24, end: 0, duration: 500.ms, delay: 500.ms, curve: Curves.easeOut),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(child: strengthWidget(index)),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => context.pop(),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: context.colorTheme.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_circle_left_rounded,
                          color: white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(context.localization.back, style: context.textTheme.krButton1.copyWith(color: white)),
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  List<Strength> strengthWidgets(BuildContext context) {
    return [
      Strength(imageUrl: "assets/images/ui_ux.png", title: "UI/UX", description: context.localization.strength_2),
      const Strength(imageUrl: "assets/images/knowledge.png", title: "Knowledge", description: "Thoroughly and Extensively."),
      const Strength(imageUrl: "assets/images/ability.png", title: "Ability", description: "Reliability and Performance."),
    ];
  }

  Widget strengthWidget(int index) {
    switch (index) {
      case 0:
        return const StrengthUiUxWidget();
      case 1:
        return const StrengthKnowledgeWidget();
      case 2:
        return const StrengthAbilityWidget();
      default:
        return const StrengthUiUxWidget();
    }
  }
}
