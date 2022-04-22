import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/theme_data.dart';

import '../controller/splash_controller.dart';
import '../translate.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  var splashController = Get.put(SplashController());
  var translateController = Get.find<TranslateController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(testText[translateController.language.value]!.substring(0, 10), style: medium10TextStyle),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          translateController.translate();
        },
        child: const Icon(Icons.g_translate),

      ),
    );
  }
}
