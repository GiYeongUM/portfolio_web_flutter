import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/core.dart';
import 'package:lottie/lottie.dart';

class IntroStrengthWidget extends StatelessWidget {
  const IntroStrengthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(alignment: Alignment.centerLeft, child: Text('About me', style: context.textTheme.krSubtitle1)),
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
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                decoration: BoxDecoration(
                  color: context.colorTheme.foregroundColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(4, 0),
                    ),
                  ],
                ),
                width: 400,
                child: Column(
                  children: [
                    Lottie.asset('assets/json/uiux_lottie.json', fit: BoxFit.fill, height: 200),
                    const SizedBox(height: 16),
                    Align(alignment: Alignment.centerLeft, child: Text("UI/UX", style: context.textTheme.krSubtitle2)),
                    const SizedBox(height: 24),
                    Text(context.localization.strength_2, style: context.textTheme.krBody1),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                decoration: BoxDecoration(
                  color: context.colorTheme.foregroundColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(4, 0),
                    ),
                  ],
                ),
                width: 400,
                child: Column(
                  children: [
                    Lottie.asset('assets/json/cross_platform_lottie.json', fit: BoxFit.fill, height: 200),
                    const SizedBox(height: 16),
                    Align(alignment: Alignment.centerLeft, child: Text("Knowledge", style: context.textTheme.krSubtitle2)),
                    const SizedBox(height: 24),
                    Text(context.localization.strength_3, style: context.textTheme.krBody1),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                decoration: BoxDecoration(
                  color: context.colorTheme.foregroundColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(4, 0),
                    ),
                  ],
                ),
                width: 400,
                child: Column(
                  children: [
                    Lottie.asset('assets/json/uiux_lottie.json', fit: BoxFit.fill, height: 200),
                    const SizedBox(height: 16),
                    Align(alignment: Alignment.centerLeft, child: Text("UI/UX", style: context.textTheme.krSubtitle2)),
                    const SizedBox(height: 24),
                    Text(context.localization.strength_2, style: context.textTheme.krBody1),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
