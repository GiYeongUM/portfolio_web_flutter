import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/controller/main_controller.dart';

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
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                      child: SvgPicture.asset("assets/images/logo_gyu.svg", color: primaryColorTheme(context),
                      ),
                  ),
                  Spacer(),
                  CustomTextWidget(text: translateController.testText.value, style: medium10TextStyle),
                  Transform.rotate(
                    alignment: Alignment.bottomCenter,
                    angle: math.pi / 2,
                    child: Icon(Icons.double_arrow, color: Colors.white, size: 25,),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  // CustomTextWidget(text: translateController.testText.value, style: medium10TextStyle),
                ],
              ),
            ),
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
