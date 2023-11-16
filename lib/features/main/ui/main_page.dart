import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/common_event.dart';
import '../../features.dart';
import '../bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      MainEntranceWidget(),
    ];
    return BlocProvider(
      create: (context) => MainBloc()..add(const Initial()),
      child: Scaffold(
        // appBar: const CustomAppBar(title: 'GiYeongUM'),
        body: MainEntranceWidget(),
        // body: ScrollConfiguration(
        //   behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        //   child: ListView.builder(
        //     itemCount: widgetList.length,
        //     itemBuilder: (context, index) {
        //       return widgetList[index];
        //     },
        //   ),
        // ),
      ),
    );
  }
}
