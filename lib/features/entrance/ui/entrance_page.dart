import 'package:flutter/material.dart';

import '../../features.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({Key? key, required this.onNext}) : super(key: key);

  final Function() onNext;

  @override
  Widget build(BuildContext context) {
    return EntranceWidget(onNext: onNext);
  }
}
