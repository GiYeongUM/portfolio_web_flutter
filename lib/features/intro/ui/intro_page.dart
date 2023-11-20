import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../features.dart';
import '../bloc/intro_bloc.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return BlocProvider(
      create: (context) => IntroBloc(),
      child: BlocConsumer<IntroBloc, IntroState>(
        listenWhen: (previous, current) => previous.page != current.page,
        listener: (context, state) {
          pageController.animateToPage(state.page, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        },
        builder: (context, state) {
          return PageView(
            pageSnapping: context.isMobile,
            controller: pageController,
            allowImplicitScrolling: context.isMobile,
            physics: getScrollPhysics(context, state.page),
            scrollDirection: Axis.vertical,
            onPageChanged: (page) => context.isMobile ? context.read<IntroBloc>().add(PageChanged(page: page)) : null,
            children: [
              IntroTitleWidget(
                onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 1)),
              ),
              IntroStepWidget(
                onPrevious: () => context.read<IntroBloc>().add(const PageChanged(page: 0)),
              ),
            ],
          );
        },
      ),
    );
  }

  ScrollPhysics? getScrollPhysics(BuildContext context, int page) {
    if (context.isMobile) return null;
    return const NeverScrollableScrollPhysics();
  }
}
