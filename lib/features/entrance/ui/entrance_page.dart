import 'package:flutter/material.dart';

import '../../../core/config/config.dart';
import '../../features.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key, required this.onNext}) : super(key: key);

  final Function() onNext;

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> with SingleTickerProviderStateMixin {
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
          EntranceTextWidget(animation: _animation, onNext: widget.onNext),
          EntranceFloorWidget(animation: _animation),
          EntranceWallWidget(animation: _animation),
        ],
      ),
    );
  }
}
