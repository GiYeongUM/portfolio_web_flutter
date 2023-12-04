import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';

class HoverChangeWidget extends StatefulWidget {
  const HoverChangeWidget({super.key, this.header, this.animatedChild, this.delay, this.route, this.type = HoverType.arrow, this.onClick, this.onInitialAnimation = true});

  final Widget? header;
  final Widget? animatedChild;
  final Duration? delay;
  final String? route;
  final HoverType type;
  final Function()? onClick;
  final bool onInitialAnimation;

  @override
  State<HoverChangeWidget> createState() => HoverChangeWidgetState();
}

class HoverChangeWidgetState extends State<HoverChangeWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.linear, reverseCurve: Curves.bounceIn));

  var isHover = false;

  @override
  void initState() {
    if (widget.onInitialAnimation) {
      _hoverAnimation(firstDelay: (widget.delay ?? 0.ms) + 300.ms);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
          _controller.forward();
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
          _controller.reverse();
        });
      },
      child: InkWell(
        onTap: () {
          if (isHover) {
            _onClick(widget.route);
          } else {
            _hoverAnimation(firstDelay: 0.ms, route: true);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.header ?? const SizedBox(),
            _switchHoverType(widget.type, animatedChild: widget.animatedChild, animation: _animation),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: widget.delay).moveY(duration: 500.ms, curve: Curves.easeInOut, begin: 100, end: 0, delay: widget.delay);
  }

  _onClick(String? route) {
    if (widget.onClick != null) widget.onClick?.call();
    if (route == null) return;
    if (route.contains('http')) {
      launchUrl(Uri.parse(route));
    } else {
      context.go(route);
    }
  }

  _hoverAnimation({Duration firstDelay = const Duration(milliseconds: 500), Duration secondDelay = const Duration(seconds: 1), bool route = false}) {
    Future.delayed(firstDelay, () async {
      if (!isHover) {
        setState(() {
          isHover = true;
        });
        await _controller.forward().then((value) async {
          if (route) _onClick(widget.route);
          Future.delayed(secondDelay, () {
            if (isHover && _controller.status != AnimationStatus.dismissed) {
              setState(() {
                isHover = false;
              });
              _controller.reverse();
            }
          });
        });
      }
    });
  }

  _switchHoverType(HoverType type, {Widget? animatedChild = const SizedBox(), required Animation<double> animation}) {
    switch (type) {
      case HoverType.arrow:
        return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Row(
                children: [
                  if (_animation.value != 0)
                    Transform.translate(
                        offset: Offset(-24 + _animation.value * 24, 0),
                        child: SizedBox(width: _animation.value * 24, child: Opacity(opacity: _animation.value, child: const Icon(Icons.arrow_forward)))),
                  const SizedBox(width: 8),
                  animatedChild ?? const SizedBox(),
                ],
              );
            });
      case HoverType.zoom:
        return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: 1 + _animation.value * 0.1,
                child: child,
              );
            },
            child: animatedChild);
      case HoverType.shadow:
        return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(-_animation.value * 2, -_animation.value * 7),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(_animation.value * 0.5), // 그림자 색상
                          spreadRadius: _animation.value, // 그림자 퍼짐 정도
                          blurRadius: _animation.value, // 그림자 흐림 정도
                          offset: Offset(_animation.value * 2, _animation.value * 7), // 그림자 위치
                        ),
                      ],
                    ),
                    child: child),
              );
            },
            child: animatedChild);
    }
  }

  @override
  void dispose() {
    isHover = false;
    _controller.dispose();
    super.dispose();
  }
}
