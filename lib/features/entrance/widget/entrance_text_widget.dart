import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gif/gif.dart';

import '../../../core/core.dart';
import '../../../main.dart';

class EntranceTextWidget extends StatelessWidget {
  const EntranceTextWidget({Key? key, required this.animation, required this.onNext, required this.locale, this.onLocaleChanged}) : super(key: key);

  final Animation<double> animation;
  final Function() onNext;
  final Locale locale;
  final Function(Locale?)? onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: animation.value == 1
                          ? DropdownButtonHideUnderline(
                              child: DropdownButton2<Locale>(
                                isExpanded: false,
                                customButton: Row(
                                  mainAxisSize: MainAxisSize.min,
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
                                      style: context.textTheme.krSubtext2.copyWith(color: context.colorTheme.foregroundTextColor),
                                    ),
                                  ],
                                ),
                                items: AppConfig.to.locales
                                    .map((e) => DropdownMenuItem<Locale>(value: e, child: Text(localeToLanguageCode(e), style: context.textTheme.krBody1.copyWith(color: white))))
                                    .toList(),
                                value: locale,
                                onChanged: (Locale? value) => onLocaleChanged?.call(value),
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                    color: context.colorTheme.wallColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ).animate().fadeIn(duration: 1.seconds, curve: const Interval(0.0, 0.5, curve: Curves.easeInOut), delay: 1.seconds)
                          : Text(
                              '',
                              style: context.textTheme.krSubtext2.copyWith(color: Colors.red),
                            ),
                    ),
                    const Spacer(),
                    Text(
                      'Hej!',
                      style:
                          context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor, fontSize: (context.textTheme.krSubtitle1.fontSize ?? 16) * (1 + 1.3 * animation.value)),
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
                                      textStyle: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor),
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
                            style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor),
                          ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      alignment: Alignment.centerRight,
                      child: animation.value == 1
                          ? InkWell(
                              onTap: () => onNext.call(),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Explore',
                                    style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_circle_right_rounded,
                                    color: context.colorTheme.foregroundTextColor,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ).animate().fadeIn(duration: 1.seconds, curve: const Interval(0.0, 0.5, curve: Curves.easeInOut), delay: 1.seconds)
                          : Text(
                              '',
                              style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor),
                            ),
                    ),
                    SizedBox(height: floorHeight(context)),
                  ],
                ),
                if (animation.value == 1)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: context.colorTheme.wallColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Gif(
                          image: const AssetImage("assets/images/cloud_animation.gif"),
                          autostart: Autostart.loop,
                          placeholder: (context) => Container(
                            width: 80,
                            height: 80,
                            color: context.colorTheme.wallColor?.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 1200.ms),
                  ),
              ],
            ),
          );
        });
  }

  double floorHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height * (1.5 - animation.value)) / 4;
  }
}
