import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/before/theme_data.dart';

import 'splash_controller.dart';
import 'custom_text.dart';
import 'before_main_page.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  var splashController = Get.put(SplashController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => splashController.splashEnd.value ? BeforeMainPage() : Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              margin: EdgeInsets.only(right: splashController.marginRight.value),
              child: AnimatedOpacity(
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
                opacity: splashController.opacity.value,
                child: SvgPicture.asset("assets/images/logo_gyu.svg", color: primaryColorTheme(context)),
              ),
            ),

            // CustomTextWidget(text: translateController.testText.value, style: medium10TextStyle),
          ],
        ),
      ),
      ),
    );
  }
}
