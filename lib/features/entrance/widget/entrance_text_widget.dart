import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/core.dart';

import '../../../main.dart';

class EntranceTextWidget extends StatelessWidget {
  const EntranceTextWidget({Key? key, required this.animation, required this.onNext, required this.locale, this.onLocaleChanged, required this.gifController, required this.afterController})
      : super(key: key);

  final Animation<double> animation;
  final AnimationController gifController;
  final AnimationController afterController;
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
                    const Spacer(),
                    Text(
                      'Hej!',
                      style:
                          context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor, fontSize: (context.textTheme.krSubtitle1.fontSize ?? 16) * (1 + 1.3 * animation.value)),
                    ),
                    const SizedBox(height: 16),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Get new perspectives",
                                style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor),
                              )
                                  .animate(controller: afterController, autoPlay: false)
                                  .fadeIn(duration: 500.ms, curve: Curves.easeInOut)
                                  .animate()
                                  .shimmer(duration: 1000.ms, delay: 3500.ms, color: context.colorTheme.reversePrimaryColor),
                              const SizedBox(height: 4),
                              Text(
                                "via GiYeong UM",
                                style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor),
                              )
                                  .animate(controller: afterController, autoPlay: false)
                                  .fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 300.ms)
                                  .animate()
                                  .shimmer(duration: 1000.ms, delay: 3500.ms, color: context.colorTheme.reversePrimaryColor),
                            ],
                          ),
                          InkWell(
                            onTap: () => onNext.call(),
                            child: Row(
                              children: [
                                Text(
                                  'Explore',
                                  style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.foregroundTextColor),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward,
                                  color: context.colorTheme.foregroundTextColor,
                                  size: 24,
                                ),
                              ],
                            )
                                .animate(controller: afterController, autoPlay: false)
                                .moveX(begin: -32, end: 0, duration: 500.ms, delay: 1.seconds, curve: Curves.easeInOut)
                                .fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 1.seconds)
                                .animate(onComplete: (controller) => controller.repeat())
                                .shimmer(duration: 1000.ms, delay: 2000.ms, color: context.colorTheme.reversePrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: floorHeight(context)),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: DropdownButtonHideUnderline(
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
                                style: context.textTheme.krBody5.copyWith(color: context.colorTheme.foregroundTextColor),
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
                      )),
                ).animate(autoPlay: false, controller: afterController).fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 1000.ms),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: context.colorTheme.wallColor,
                      image: const DecorationImage(image: AssetImage("assets/images/cloud_animation.gif")),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ).animate(autoPlay: false, controller: afterController).fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 1000.ms),
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
