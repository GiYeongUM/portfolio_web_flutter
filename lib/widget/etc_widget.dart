
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/text_class.dart';
import '../theme_data.dart';
import '../translate.dart';
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
                text: translateController.troubleTitle.value,
                style: tileBoldTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Center(
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleTitle_1.value,
                        style: tilePrimaryRegularTextStyle,
                        textAlign: TextAlign.right,
                      ),

                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleSubTitle_1.value,
                        style: medium10TextStyle,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10,),
                      troubleWidget(translateController, translateController.troubleContent_1_1.value, translateController.troubleContent_1_2.value),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Center(
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleTitle_2.value,
                        style: tilePrimaryRegularTextStyle,
                        textAlign: TextAlign.right,
                      ),

                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleSubTitle_2.value,
                        style: medium10TextStyle,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10,),
                      troubleWidget(translateController, translateController.troubleContent_2_1.value, translateController.troubleContent_2_2.value),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Center(
                  child: Column(
                    children: [

                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleSubTitle_2_1.value,
                        style: medium10TextStyle,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10,),
                      troubleWidget(translateController, translateController.troubleContent_2_3.value, translateController.troubleContent_2_4.value),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Center(
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleTitle_3.value,
                        style: tilePrimaryRegularTextStyle,
                        textAlign: TextAlign.right,
                      ),

                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleSubTitle_3.value,
                        style: medium10TextStyle,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10,),
                      troubleWidget(translateController, translateController.troubleContent_3_1.value, translateController.troubleContent_3_2.value),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Center(
                  child: Column(
                    children: [

                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleSubTitle_3_1.value,
                        style: medium10TextStyle,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10,),
                      troubleWidget(translateController, translateController.troubleContent_3_3.value, translateController.troubleContent_3_4.value),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Center(
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleTitle_4.value,
                        style: tilePrimaryRegularTextStyle,
                        textAlign: TextAlign.right,
                      ),

                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: translateController.troubleSubTitle_4.value,
                        style: medium10TextStyle,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10,),
                      troubleWidget(translateController, translateController.troubleContent_4_1.value, translateController.troubleContent_4_2.value),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget troubleWidget(TranslateController translateController, TextClass text1, TextClass text2){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 11.sp),
        child: CustomTextWidget(
          text: translateController.troubleSub_1.value,
          style: regular12TextStyle,
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 11.sp),
        child: CustomTextWidget(
          text: text1,
          style: regular10TextStyle,
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
      const SizedBox(height: 10,),
      Container(
        margin: EdgeInsets.only(left: 11.sp),
        child: CustomTextWidget(
          text: translateController.troubleSub_2.value,
          style: regular12TextStyle,
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 11.sp),
        child: CustomTextWidget(
          text: text2,
          style: regular10TextStyle,
          textAlign: TextAlign.left,
          maxLines: 5,
        ),
      ),

    ],
  );
}
