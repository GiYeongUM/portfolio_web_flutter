import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/config/config.dart';
import 'package:giyeong_um_porfolio_page/features/features.dart';

class MainEntranceWidget extends StatefulWidget {
  const MainEntranceWidget({super.key});

  @override
  State<MainEntranceWidget> createState() => _MainEntranceWidgetState();
}

class _MainEntranceWidgetState extends State<MainEntranceWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          child: _animation.value == 1
                              ? InkWell(
                                  onTap: () {},
                                  child: FadingTextWidget(
                                    delay: const Duration(seconds: 1),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red,
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
                                          style: context.textTheme.krSubtext2.copyWith(color: Colors.red),
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
                          style: context.textTheme.krSubtitle1.copyWith(color: Colors.red, fontSize: (context.textTheme.krSubtitle1.fontSize ?? 16) * (1 + 1.3 * _animation.value)),
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
                                          textStyle: context.textTheme.krSubtitle1.copyWith(color: Colors.red),
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
                                  onTap: () {},
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
                                          Icons.arrow_forward,
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
                        color: Color(0xffCFC3B2),
                        border: Border(
                          top: BorderSide(color: wood, width: 40),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: MediaQuery.of(context).size.width,
                      height: 32,
                      decoration: BoxDecoration(color: white, boxShadow: [
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
                    width: (MediaQuery.of(context).size.width / 4.5) * (1 - _animation.value),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: context.colorTheme.wallColor,
                      border: const Border(
                        bottom: BorderSide(color: white, width: 20),
                      ),
                    ),
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
                      width: (MediaQuery.of(context).size.width / 4.5) * (1 - _animation.value),
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: context.colorTheme.wallColor,
                        border: const Border(
                          bottom: BorderSide(color: white, width: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  double floorHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height * (1.5 - _animation.value)) / 4;
  }
}

class WoodKnightBaseboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF8B4513) // 진한 나무색
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)), paint);

    // 나무 나이트 스타일 패턴 그리기
    paint.strokeWidth = 1.0;
    paint.color = Colors.brown; // 나뭇결의 색상

    for (double i = 0; i < size.width; i += 8) {
      for (double j = 0; j < size.height; j += 8) {
        // 나무 나이트 스타일의 나뭇결 패턴을 그립니다.
        canvas.drawRect(Rect.fromPoints(Offset(i, j), Offset(i + 4, j + 4)), paint);
        canvas.drawRect(Rect.fromPoints(Offset(i + 4, j + 4), Offset(i + 8, j + 8)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

double calculateHeightFactor(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double minFactor = 0.2;
  double maxFactor = 0.8;

  if (screenHeight > 2160) return maxFactor;
  if (screenHeight < 600) return minFactor;

  // Screen height-dependent calculation
  double heightFactor = minFactor + (maxFactor - minFactor) * (screenHeight / 2160);

  // Clamp the value to the specified range
  return heightFactor.clamp(minFactor, maxFactor);
}
