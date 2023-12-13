import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/features/features.dart';

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
            Hero(
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
            const SizedBox(height: 24),
            Expanded(child: strengthWidget(index)),
          ],
        ),
      ),
    );
  }

  List<Strength> get strengthWidgets => [
        const Strength(imageUrl: "assets/images/ui_ux.png", title: "UI/UX", description: "Intuitive and Efficient."),
        const Strength(imageUrl: "assets/images/knowledge.png", title: "Knowledge", description: "Thoroughly and Extensively."),
        const Strength(imageUrl: "assets/images/ability.png", title: "Ability", description: "Reliability and Performance."),
      ];

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
