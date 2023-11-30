import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/config.dart';
import '../../features.dart';
import '../../global/bloc/global_bloc.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key}) : super(key: key);

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final AnimationController _gifAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final AnimationController _afterController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () async {
      await _controller.forward().then((value) => _afterController.forward());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: context.colorTheme.pointBackgroundColor,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: context.colorTheme.pointBackgroundGradient ??
                    [
                      pointLightBackground3,
                      pointLightBackground2,
                      pointLightBackground,
                    ],
              ),
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
                EntranceTextWidget(
                  animation: _animation,
                  afterController: _afterController,
                  onNext: () {
                    context.go('/intro');
                  },
                  locale: state.locale,
                  onLocaleChanged: (locale) {
                    context.read<GlobalBloc>().add(SetLocale(locale: locale));
                  },
                  gifController: _gifAnimationController,
                ),
                EntranceFloorWidget(animation: _animation),
                EntranceWallWidget(animation: _animation),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage('assets/images/cloud_animation.gif'), context, onError: (exception, stackTrace) {
      logger.e('Error while precaching image: $exception');
    });
    precacheImage(const AssetImage('assets/images/ui_ux.png'), context, onError: (exception, stackTrace) {
      logger.e('Error while precaching image: $exception');
    });
    precacheImage(const AssetImage('assets/images/knowledge.png'), context, onError: (exception, stackTrace) {
      logger.e('Error while precaching image: $exception');
    });
    precacheImage(const AssetImage('assets/images/ability.png'), context, onError: (exception, stackTrace) {
      logger.e('Error while precaching image: $exception');
    });
  }
}
