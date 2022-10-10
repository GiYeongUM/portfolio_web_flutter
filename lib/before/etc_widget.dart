
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/before/theme_data.dart';
import 'package:giyeong_um_porfolio_page/before/translate.dart';

import '../model/text_class.dart';
import 'custom_text.dart';

class ETCWidget extends StatelessWidget {
  ETCWidget ({Key? key}) : super(key: key);

  var translateController = Get.find<TranslateController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: CustomTextWidget(
                text: translateController.etcTitle.value,
                style: tileBoldTextStyleLarge,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(height: 50,),
          etcWidget(translateController, translateController.etcContent_1.value),
          etcWidget(translateController, translateController.etcContent_2.value),
        ],
      ),
    );
  }
}

Widget etcWidget(TranslateController translateController, TextClass text1){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 30.sp),
        child: CustomTextWidget(
          text: text1,
          style: regular10TextStyle,
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
      const SizedBox(height: 10,),
    ],
  );
}
