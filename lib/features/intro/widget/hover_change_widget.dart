import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class HoverChangeWidget extends StatefulWidget {
  const HoverChangeWidget({Key? key, required this.firstChild, required this.secondChild, required this.delay, this.route = ''}) : super(key: key);

  final Widget firstChild;
  final Widget secondChild;
  final Duration delay;
  final String route;

  @override
  State<HoverChangeWidget> createState() => _HoverChangeWidgetState();
}

class _HoverChangeWidgetState extends State<HoverChangeWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.linear, reverseCurve: Curves.bounceIn));

  var isHover = false;

  @override
  void initState() {
    _hoverAnimation(firstDelay: widget.delay + 300.ms);
    super.initState();
  }

  _hoverAnimation({Duration firstDelay = const Duration(milliseconds: 500), Duration secondDelay = const Duration(seconds: 1), bool route = false}) {
    Future.delayed(firstDelay, () async {
      if (!isHover) {
        setState(() {
          isHover = true;
        });
        await _controller.forward().then((value) async {
          if (route) context.go(widget.route);
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

  @override
  void dispose() {
    isHover = false;
    _controller.dispose();
    super.dispose();
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
            context.go(widget.route);
          } else {
            _hoverAnimation(firstDelay: 0.ms, route: true);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.firstChild,
            AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Row(
                    children: [
                      if (_animation.value != 0)
                        Transform.translate(
                            offset: Offset(-24 + _animation.value * 24, 0),
                            child: SizedBox(width: _animation.value * 24, child: Opacity(opacity: _animation.value, child: const Icon(Icons.arrow_forward)))),
                      const SizedBox(width: 8),
                      widget.secondChild,
                    ],
                  );
                }),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: widget.delay).moveY(duration: 500.ms, curve: Curves.easeInOut, begin: 100, end: 0, delay: widget.delay);
  }
}
