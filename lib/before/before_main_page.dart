import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/before/before_main_controller.dart';
import 'package:giyeong_um_porfolio_page/before/theme_data.dart';
import 'package:giyeong_um_porfolio_page/before/translate.dart';
import 'package:giyeong_um_porfolio_page/before/Intro_widget.dart';

import 'dart:math' as math;

import 'career_widget.dart';
import 'etc_widget.dart';
import 'profile_widget.dart';
import 'trouble_widget.dart';


class BeforeMainPage extends StatelessWidget {
  BeforeMainPage({Key? key}) : super(key: key);

  var translateController = Get.find<TranslateController>();
  var mainController = Get.put(BeforeMainController());
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
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Obx(() => AnimatedOpacity(
          opacity: mainController.bottomBlink.value ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: FadeTransition(
            opacity: mainController.bottomAnimationController,
            child: Transform.rotate(
            angle: math.pi / 2,
            child: const Icon(Icons.double_arrow),
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

Widget mainNonScrollWidget(BuildContext context, BeforeMainController mainController, TranslateController translateController) {
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
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.only(top: mainController.mainViewAnimation[0] ? 100 : 0),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
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
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.only(bottom: mainController.mainViewAnimation[1] ? 100 : 0),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
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
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.only(bottom: mainController.mainViewAnimation[2] ? 100 : 0),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
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
        duration: const Duration(milliseconds: 500),
        opacity: mainController.mainViewAnimation[3] ? 1.0 : 0.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CareerWidget(),
            const SizedBox(height: 50),
            Container(height: 0.5, width: MediaQuery.of(context).size.width * 0.8, color: Theme.of(context).brightness == Brightness.light ? gray_3a3a3aColor : Colors.white,),
            const SizedBox(height: 50),
            TroubleWidget(),
            const SizedBox(height: 50),
            Container(height: 0.5, width: MediaQuery.of(context).size.width * 0.8, color: Theme.of(context).brightness == Brightness.light ? gray_3a3a3aColor : Colors.white,),
            const SizedBox(height: 50),
            ProfileWidget(),
            const SizedBox(height: 50),
            Container(height: 0.5, width: MediaQuery.of(context).size.width * 0.8, color: Theme.of(context).brightness == Brightness.light ? gray_3a3a3aColor : Colors.white,),
            const SizedBox(height: 50),
            ETCWidget(),

          ],
        ),
      );
  }
}