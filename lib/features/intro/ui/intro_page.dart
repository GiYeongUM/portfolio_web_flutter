
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';
import '../../features.dart';
import '../bloc/intro_bloc.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key, this.onPop});

  final Function()? onPop;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return BlocProvider(
      create: (context) => IntroBloc(),
      child: BlocConsumer<IntroBloc, IntroState>(
        listenWhen: (previous, current) => previous.page != current.page,
        listener: (context, state) {
          pageController.animateToPage(state.page, duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc).then((value) {
            context.read<IntroBloc>().add(const Done());
          });
        },
        buildWhen: (previous, current) => previous.status != current.status || previous.page != current.page,
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              pageSnapping: context.isMobile,
              controller: pageController,
              physics: getScrollPhysics(context, state.status),
              scrollDirection: Axis.vertical,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IntroTitleWidget(
                      onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 1)),
                      onContact: () => launchUrl(Uri(
                        scheme: 'mailto',
                        path: 'eomky2005@gmail.com',
                      )),
                    ),
                    Positioned(
                      bottom: 48,
                      child: Hero(
                          tag: 'arrow',
                          child: SvgImage(
                            'assets/icons/ic_arrow_forward.svg',
                            width: context.isDesktop ? 104 : 64,
                            height: context.isDesktop ? 104 : 64,
                            color: context.colorTheme.reverseColor,
                          ).animate().rotate(begin: 0, end: 0.25)
                              .animate(onComplete: (controller) => controller.repeat())
                              .moveY(begin: 0, end: 30, duration: 500.ms, delay: 1.seconds, curve: Curves.easeInOut)
                              .moveY(begin: 30, end: 0, duration: 500.ms, delay: 1500.ms, curve: Curves.easeInOut)

                      ),
                    ),
                  ],
                ),

                IntroStepWidget(
                  color: context.colorTheme.pointBackgroundColor,
                  onPrevious: () => context.read<IntroBloc>().add(const PageChanged(page: 0)),
                  onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 2)),
                  child: const IntroStrengthWidget(),
                ),
                IntroStepWidget(
                  color: context.colorTheme.backgroundColor,
                  onPrevious: () => context.read<IntroBloc>().add(const PageChanged(page: 1)),
                  onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 3)),
                  child: IntroSkillsWidget(
                    onItemClick: (item) => context.read<IntroBloc>().add(ItemChanged(item: item)),
                  ),
                ),
                IntroStepWidget(
                  color: context.colorTheme.backgroundColor,
                  onPrevious: () => context.read<IntroBloc>().add(const PageChanged(page: 2)),
                  onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 4)),
                  child: const IntroStrengthWidget(),
                ),
              ],
            ),
          );
        },
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
