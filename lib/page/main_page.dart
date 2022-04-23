import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../theme_data.dart';
import '../translate.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  var translateController = Get.find<TranslateController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/logo_gyu.svg", color: primaryColorTheme(context)),

            // CustomTextWidget(text: translateController.testText.value, style: medium10TextStyle),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          translateController.translateStart(translateController.testText.value);
        },
        child: const Icon(Icons.g_translate),

      ),
    );
  }
}
