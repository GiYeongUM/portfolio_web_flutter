import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class EntranceTextWidget extends StatelessWidget {
  const EntranceTextWidget({Key? key, required this.animation, required this.onNext}) : super(key: key);

  final Animation<double> animation;
  final Function() onNext;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: animation.value == 1
                        ? InkWell(
                            onTap: () {},
                            onHover: (value) {},
                            child: FadingTextWidget(
                              delay: const Duration(seconds: 1),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: context.colorTheme.wallColor,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.g_translate_outlined,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Language',
                                    style: context.textTheme.krSubtext2.copyWith(color: context.colorTheme.wallColor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(
                            '',
                            style: context.textTheme.krSubtext2.copyWith(color: Colors.red),
                          ),
                  ),
                  const Spacer(),
                  Text(
                    'Hej!',
                    style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.wallColor, fontSize: (context.textTheme.krSubtitle1.fontSize ?? 16) * (1 + 1.3 * animation.value)),
                  ),
                  const SizedBox(height: 16),
                  animation.value == 1
                      ? Row(
                          children: [
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                              flex: 1,
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    "Get new perspectives",
                                    textStyle: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.wallColor),
                                    speed: const Duration(milliseconds: 50),
                                    cursor: '',
                                  ),
                                ],
                                pause: const Duration(milliseconds: 100),
                                totalRepeatCount: 1,
                                displayFullTextOnTap: true,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          '',
                          style: context.textTheme.krSubtitle1.copyWith(color: Colors.red),
                        ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    alignment: Alignment.centerRight,
                    child: animation.value == 1
                        ? InkWell(
                            onTap: () => onNext.call(),
                            child: FadingTextWidget(
                              delay: const Duration(seconds: 1),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Explore',
                                    style: context.textTheme.krSubtitle1.copyWith(color: Colors.red),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.arrow_circle_right_rounded,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(
                            '',
                            style: context.textTheme.krSubtitle1.copyWith(color: Colors.red),
                          ),
                  ),
                  SizedBox(height: floorHeight(context)),
                ],
              ),
            ),
          );
        });
  }

  double floorHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height * (1.5 - animation.value)) / 4;
  }
}
