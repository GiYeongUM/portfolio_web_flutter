import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/common_event.dart';
import '../../features.dart';
import '../bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: kDebugMode ? 1 : 0);
    return BlocProvider(
      create: (context) => MainBloc()..add(const Initial()),
      child: BlocConsumer<MainBloc, MainState>(
        listenWhen: (previous, current) => previous.page != current.page,
        listener: (context, state) {
          pageController.animateToPage(
            state.page,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutCubic,
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                EntrancePage(onNext: () {
                  context.read<MainBloc>().add(const PageChanged(page: 1));
                }),
                const IntroPage(),
              ],
            ),
          );
        },
      ),
    );
  }
}
