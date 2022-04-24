import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/controller/main_controller.dart';
import 'package:giyeong_um_porfolio_page/widget/Intro_widget.dart';

import '../theme_data.dart';
import '../translate.dart';
import 'dart:math' as math;

import '../widget/custom_text.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  var translateController = Get.find<TranslateController>();
  var mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        controller: mainController.scrollController.value,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/logo_gyu.svg", color: primaryColorTheme(context),),
                ],
              ),
            ),
            IntroWidget(
                textList: [
                  translateController.introText_1.value,
                  translateController.introText_2.value,
                  translateController.introText_3.value
                ], direction: Direction.left,
              sideText: translateController.sideText_1.value,
            ),
            IntroWidget(
                textList: [
                  translateController.introText_4.value,
                  translateController.introText_5.value,
                  translateController.introText_6.value
                ], direction: Direction.right,
              sideText: translateController.sideText_2.value,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Obx(() => AnimatedOpacity(
          opacity: mainController.bottomBlink.value ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: FadeTransition(
            opacity: mainController.bottomAnimationController,
            child: Transform.rotate(
            angle: math.pi / 2,
            child: Icon(Icons.double_arrow),
            ),
          ),
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(var text in translateController.textClassList){
            translateController.translateStart(text);
          }
        },
        child: const Icon(Icons.g_translate),

      ),
    );
  }
}
