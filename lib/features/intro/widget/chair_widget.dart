import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/core.dart';
import 'package:lottie/lottie.dart';

class ChairWidget extends StatefulWidget {
  const ChairWidget({Key? key, required this.page, required this.status}) : super(key: key);

  final int page;
  final CommonStatus status;

  @override
  State<ChairWidget> createState() => _ChairWidgetState();
}

class _ChairWidgetState extends State<ChairWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: 1000.ms);
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  var page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setAnimation();
    return Positioned(
      bottom: 0,
      right: 0,
      child: SizedBox(
        width: context.isDesktop ? 160 : 120,
        height: context.isDesktop ? 160 : 120,
        child: Lottie.asset(
          'assets/json/chair_lottie_$page.json',
          animate: page != 0,
          controller: _animation,
          repeat: false,
        ),
      ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut),
    );
  }

  setAnimation() {
    if (widget.status == CommonStatus.loading) _controller.animateTo(0);
    if (widget.status == CommonStatus.success && widget.page != 0) {
      page = widget.page;
      _controller.animateTo(1);
    }
  }
}
