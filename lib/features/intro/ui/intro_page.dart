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
                    onPageChanged: (page) => context.read<IntroBloc>().add(PageChanged(page: page)),
                    children: [
                      IntroTitleWidget(
                        onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 1)),
                        onContact: () => launchUrl(Uri(
                          scheme: 'mailto',
                          path: 'eomky2005@gmail.com',
                        )),
                      ),
                      IntroStrengthWidget(
                        onPrevious: () => context.read<IntroBloc>().add(const PageChanged(page: 0)),
                        onNext: () => context.read<IntroBloc>().add(const PageChanged(page: 2)),
                      ),
                    ],
                  ),
                  ChairWidget(page: state.page),
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

/*

cloud

Blur(
              blur: 4,
              blurColor: context.colorTheme.backgroundColor ?? Colors.white,
              child: Container(
                width: 400,
                height: 400,
                margin: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorTheme.wallColor ?? Colors.white, width: 20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Gif(
                  image: const AssetImage("assets/images/cloud-4058_512.gif"),
                  autostart: Autostart.no,
                  placeholder: (context) => Container(
                    width: 400,
                    height: 400,
                    color: context.colorTheme.wallColor?.withOpacity(0.8),
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 500.ms, curve: Curves.easeInOut, delay: 500.ms)
                .animate(controller: _gifController)
                .moveY(end: -(MediaQuery.of(context).size.height), duration: 1000.ms, curve: Curves.easeInOut)
                .fadeOut(duration: 500.ms, curve: Curves.easeInOut),
 */
