import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/page/splash_page.dart';

import '../controller/main_controller.dart';
import '../theme_data.dart';
import '../translate.dart';
import '../widget/Intro_widget.dart';
import '../widget/career_widget.dart';
import '../widget/etc_widget.dart';
import '../widget/profile_widget.dart';
import '../widget/trouble_widget.dart';

class WholePage extends StatelessWidget {
  WholePage({Key? key}) : super(key: key);

  var translateController = Get.find<TranslateController>();
  var mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const SizedBox(height: 50),
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
