import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/core.dart';
import '../../../core/domain/model/strength.dart';

class StrengthPage extends StatelessWidget {
  const StrengthPage({super.key, this.index = 0});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Hero(
              tag: 'arrow',
              child: SvgImage(
                'assets/icons/ic_arrow_forward.svg',
                width: context.isDesktop ? 104 : 64,
                height: context.isDesktop ? 104 : 64,
                color: context.colorTheme.reverseColor,
              ),
            ).animate().rotate(begin: 0, end: 0.5, duration: 500.ms, delay: 500.ms, curve: Curves.easeInOutCirc),
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
}
