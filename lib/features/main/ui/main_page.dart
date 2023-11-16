import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/common_event.dart';
import '../../features.dart';
import '../bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc()..add(const Initial()),
      child: const Scaffold(
        body: MainEntranceWidget(),
      ),
    );
  }
}
