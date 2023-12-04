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
            decoration: BoxDecoration(color: context.colorTheme.pointBackgroundColor),
            child: Stack(
              alignment: Alignment.center,
              children: [
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
                EntranceWallWidget(animation: _animation),
              ],
            ),
          );
        },
      ),
    );
  }
}
