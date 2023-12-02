import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';
import '../../features.dart';
import '../bloc/intro_bloc.dart';
import '../widget/chair_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key, this.onPop}) : super(key: key);

  final Function()? onPop;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return PopScope(
      onPopInvoked: (pop) {
        onPop?.call();
      },
      child: Scaffold(
        backgroundColor: context.colorTheme.backgroundColor,
        body: BlocProvider(
          create: (context) => IntroBloc(),
          child: BlocConsumer<IntroBloc, IntroState>(
            listenWhen: (previous, current) => previous.page != current.page,
            listener: (context, state) {
              pageController.animateToPage(state.page, duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc).then((value) {
                context.read<IntroBloc>().add(const Done());
              });
            },
            builder: (context, state) {
              return Stack(
                children: [
                  PageView(
                    pageSnapping: context.isMobile,
                    controller: pageController,
                    physics: getScrollPhysics(context, state.status),
                    scrollDirection: Axis.vertical,
                    children: [
                      IntroTitleWidget(
                        onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 1)),
                        onContact: () => launchUrl(Uri(
                          scheme: 'mailto',
                          path: 'eomky2005@gmail.com',
                        )),
                      ),
                      IntroStepWidget(
                        onPrevious: () => context.read<IntroBloc>().add(const PageChanged(page: 0)),
                        onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 2)),
                        child: const IntroStrengthWidget(),
                      ),
                      IntroStepWidget(
                        onPrevious: () => context.read<IntroBloc>().add(const PageChanged(page: 1)),
                        onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 3)),
                        child: IntroSkillsWidget(
                          onItemClick: (item) => context.read<IntroBloc>().add(ItemChanged()),
                        ),
                      ),
                      IntroStepWidget(
                        onPrevious: () => context.read<IntroBloc>().add(const PageChanged(page: 2)),
                        onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 4)),
                        child: const IntroStrengthWidget(),
                      ),
                    ],
                  ),
                  ChairWidget(page: state.page, status: state.status),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  ScrollPhysics? getScrollPhysics(BuildContext context, CommonStatus status) {
    switch (status) {
      case CommonStatus.initial:
      case CommonStatus.ready:
      case CommonStatus.success:
      case CommonStatus.failure:
        return const ClampingScrollPhysics();
      case CommonStatus.loading:
        return const NeverScrollableScrollPhysics();
    }
  }
}
