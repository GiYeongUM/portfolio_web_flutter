import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/config/config.dart';
import 'package:giyeong_um_porfolio_page/features/features.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class EntranceWidget extends StatefulWidget {
  const EntranceWidget({super.key, required this.onNext});

  final Function() onNext;

  @override
  State<EntranceWidget> createState() => _EntranceWidgetState();
}

class _EntranceWidgetState extends State<EntranceWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: yellow1,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_animation.value != 1)
            AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1 * (1 - _animation.value)),
                    ),
                  );
                }),
          AnimatedBuilder(
              animation: _animation,
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
                          child: _animation.value == 1
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
                          style: context.textTheme.krSubtitle1.copyWith(color: context.colorTheme.wallColor, fontSize: (context.textTheme.krSubtitle1.fontSize ?? 16) * (1 + 1.3 * _animation.value)),
                        ),
                        const SizedBox(height: 16),
                        _animation.value == 1
                            ? Row(
                                children: [
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(
                                    flex: 1,
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          'Jag är GiYeong',
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
                          child: _animation.value == 1
                              ? InkWell(
                                  onTap: () => widget.onNext.call(),
                                  child: FadingTextWidget(
                                    delay: const Duration(seconds: 1),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Gå och titta',
                                          style: context.textTheme.krSubtitle1.copyWith(color: Colors.red),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.play_circle_fill_outlined,
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
              }),
          AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  bottom: 0,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: floorHeight(context),
                        decoration: const BoxDecoration(
                          color: floor,
                          border: Border(
                            top: BorderSide(color: wood, width: 40),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width,
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, -3),
                          ),
                        ]),
                        child: CustomPaint(
                          painter: WoodKnightBaseboardPainter(),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          if (_animation.value != 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.skewY(-calculateHeightFactor(context)),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: calculateWallHeight(context) * (1 - _animation.value),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: context.colorTheme.wallColor,
                            border: const Border(
                              bottom: BorderSide(color: white, width: 20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(4, 0),
                              ),
                            ]),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Transform(
                        transform: Matrix4.skewY(-calculateHeightFactor(context)),
                        child: Container(
                          width: calculateWallHeight(context) * (1 - _animation.value),
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: context.colorTheme.wallColor,
                            border: const Border(
                              bottom: BorderSide(color: white, width: 20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(4, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }

  double floorHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height * (1.5 - _animation.value)) / 4;
  }

  double calculateWallHeight(BuildContext context) {
    if (!ResponsiveBreakpoints.of(context).isDesktop) return MediaQuery.of(context).size.width / 4.5;
    if (MediaQuery.of(context).size.width / 4 < MediaQuery.of(context).size.height / 3) {
      return MediaQuery.of(context).size.height / 4;
    } else {
      return MediaQuery.of(context).size.width / 4;
    }
  }

  double calculateHeightFactor(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double minFactor = 0.2;
    double maxFactor = 1.0;
    if (!ResponsiveBreakpoints.of(context).isDesktop) return 0.9;
    if (screenHeight > 2160) return maxFactor;
    if (screenHeight < 600) return minFactor;

    // Screen height-dependent calculation
    double heightFactor = minFactor + (maxFactor - minFactor) * (screenHeight / 2160);

    // Clamp the value to the specified range
    return heightFactor.clamp(minFactor, maxFactor);
  }
}
