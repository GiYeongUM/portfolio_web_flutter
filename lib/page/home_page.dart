import 'package:flutter/material.dart';

import 'base_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
