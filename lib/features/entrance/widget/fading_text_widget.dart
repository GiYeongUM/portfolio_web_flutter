import 'package:flutter/material.dart';

class FadingTextWidget extends StatefulWidget {
  const FadingTextWidget({super.key, required this.child, required this.delay});

  final Widget child;
  final Duration delay;

  @override
  FadingTextWidgetState createState() => FadingTextWidgetState();
}

class FadingTextWidgetState extends State<FadingTextWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final Animation<double> _opacityAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
  ));

  var completed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (!completed) {
        _controller.forward();
        completed = true;
      }
    });
  }

  @override
  void dispose() {
    completed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: widget.child,
    );
  }
}
