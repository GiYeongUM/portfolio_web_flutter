import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../features.dart';
import '../../global/bloc/global_bloc.dart';
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
          pageController.animateToPage(state.page, duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc).then((value) {
            context.read<IntroBloc>().add(const Done());
          });
        },
        builder: (context, state) {
          return PageView(
            pageSnapping: context.isMobile,
            controller: pageController,
            physics: getScrollPhysics(context, state.status),
            scrollDirection: Axis.vertical,
            onPageChanged: (page) => context.read<IntroBloc>().add(PageChanged(page: page)),
            children: [
              IntroTitleWidget(
                onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 1)),
                onContact: () => BlocProvider.of<GlobalBloc>(context).add(const SetLocale(locale: Locale('ko'))),
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
