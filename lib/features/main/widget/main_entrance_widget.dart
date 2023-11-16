import 'dart:math';

import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/config/style.dart';

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
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
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
                      child: Text(
                        'Hej!',
                        style: context.textTheme.krSubtitle1.copyWith(color: Colors.red, fontSize: (context.textTheme.krSubtitle1.fontSize ?? 16) * (1 + 1.3 * _animation.value)),
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height * (1.5 - _animation.value)) / 4,
                    decoration: BoxDecoration(
                      color: const Color(0xffCFC3B2),
                      border: Border(
                        top: BorderSide(color: context.colorTheme.backgroundColor ?? Colors.white, width: 20),
                      ),
                    ),
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
                    transform: Matrix4.skewY(-0.9),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: (MediaQuery.of(context).size.width / 4) * (1 - _animation.value),
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: context.colorTheme.wallColor,
                        border: Border(
                          bottom: BorderSide(color: context.colorTheme.backgroundColor ?? Colors.white, width: 20),
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
                      transform: Matrix4.skewY(-0.9),
                      child: Container(
                        width: (MediaQuery.of(context).size.width / 4) * (1 - _animation.value),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: context.colorTheme.wallColor,
                          border: Border(
                            bottom: BorderSide(color: context.colorTheme.backgroundColor ?? Colors.white, width: 20),
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
      ),
    );
  }
}
