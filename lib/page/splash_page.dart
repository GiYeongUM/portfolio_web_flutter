import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/theme_data.dart';

import '../controller/splash_controller.dart';
import '../translate.dart';
import '../widget/custom_text.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  var splashController = Get.put(SplashController());
  var translateController = Get.find<TranslateController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => CustomTextWidget(text: testText[translateController.language.value]!, style: medium10TextStyle, textLength: translateController.textLength.value,),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(translateController.translateEnd.value) {
            translateController.translateEnd.value = false;
            translateController.translateStart();
          }
        },
        child: const Icon(Icons.g_translate),

      ),
    );
  }
}
