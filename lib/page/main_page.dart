import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/controller/main_controller.dart';
import 'package:giyeong_um_porfolio_page/widget/Intro_widget.dart';

import '../theme_data.dart';
import '../translate.dart';
import 'dart:math' as math;

import '../widget/main_widget.dart';


class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  var translateController = Get.find<TranslateController>();
  var mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
        controller: mainController.scrollController.value,
        physics: mainController.mainViewCanChange.value ? const ScrollPhysics() : const NeverScrollableScrollPhysics() ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            mainNonScrollWidget(context, mainController, translateController),
            const SizedBox(height: 0.01,)
          ],
        ),
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
          if(!translateController.translateSleep.value){
            translateController.translateSleep.value = true;
            for(var text in translateController.translateList){
              translateController.translateStart(text);
            }
            Future.delayed(const Duration(milliseconds: 4000), (){
              translateController.translateSleep.value = false;
            });
          }

        },
        child: const Icon(Icons.g_translate),

      ),
    );
  }
}

Widget mainNonScrollWidget(BuildContext context, MainController mainController, TranslateController translateController) {
  switch(mainController.mainViewEnum.value) {
    case mainViewType.icon:
      return Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              margin: EdgeInsets.only(top: mainController.mainViewAnimation[0] ? 100 : 0),
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: mainController.mainViewAnimation[0] ? 0.0 : 1.0,
                child: SvgPicture.asset(
                  "assets/images/logo_gyu.svg",
                  color: primaryColorTheme(context),
                ),
              ),
            ),
          ],
        ),
      );
    case mainViewType.intro1:
      return AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        duration: Duration(seconds: 1),
        padding: EdgeInsets.only(bottom: mainController.mainViewAnimation[1] ? 100 : 0),
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: mainController.mainViewAnimation[1] ? 1.0 : 0.0,
          child: IntroWidget(
            textList: [
              translateController.introText_1.value,
              translateController.introText_2.value,
              translateController.introText_3.value
            ], direction: Direction.left,
            sideText: translateController.sideText_1.value,
          ),
        ),
      );
    case mainViewType.intro2:
      return AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        duration: Duration(seconds: 1),
        padding: EdgeInsets.only(bottom: mainController.mainViewAnimation[2] ? 100 : 0),
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: mainController.mainViewAnimation[2] ? 1.0 : 0.0,
          child: IntroWidget(
            textList: [
              translateController.introText_4.value,
              translateController.introText_5.value,
              translateController.introText_6.value
            ], direction: Direction.right,
            sideText: translateController.sideText_2.value,
          ),
        ),
      );

    case mainViewType.mainView:
      return AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: mainController.mainViewAnimation[3] ? 1.0 : 0.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainWidget(),
            Container(),
          ],
        ),
      );
  }
}