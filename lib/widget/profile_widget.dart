
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/text_class.dart';
import '../theme_data.dart';
import '../translate.dart';
import 'custom_text.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget ({Key? key}) : super(key: key);

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
                text: translateController.profileTitle.value,
                style: tileBoldTextStyleLarge,
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
                        text: translateController.profileSubTitle_1.value,
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
                      profileWidget(translateController, translateController.profileContent_1.value),
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
                        text: translateController.profileSubTitle_2.value,
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
                      profileWidget(translateController, translateController.profileContent_2.value),
                      const SizedBox(height: 50,),
                      profileWidget(translateController, translateController.profileContent_3.value),
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
                        text: translateController.profileSubTitle_3.value,
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
                      profileWidget(translateController, translateController.profileContent_4.value),
                      const SizedBox(height: 50,),
                      profileWidget(translateController, translateController.profileContent_5.value),
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
                        text: translateController.profileSubTitle_4.value,
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
                      profileWidget(translateController, translateController.profileContent_6.value),
                      const SizedBox(height: 50,),
                      profileWidget(translateController, translateController.profileContent_7.value),
                      const SizedBox(height: 50,),
                      profileWidget(translateController, translateController.profileContent_8.value),
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

Widget profileWidget(TranslateController translateController, TextClass text1){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 11.sp),
        child: CustomTextWidget(
          text: text1,
          style: regular10TextStyle,
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
    ],
  );
}
