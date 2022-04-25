
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/text_class.dart';
import '../theme_data.dart';
import '../translate.dart';
import 'custom_text.dart';

class MainWidget extends StatelessWidget {
  MainWidget ({Key? key}) : super(key: key);

  var translateController = Get.find<TranslateController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: CustomTextWidget(
                text: translateController.mainTitle.value,
                style: tileBoldTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Center(
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: translateController.companyName_1.value,
                        style: tilePrimaryRegularTextStyle,
                        textAlign: TextAlign.right,
                      ),
                      CustomTextWidget(
                        text: translateController.companyDay_1.value,
                        style: medium10TextStyle,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      projectWidget(translateController.companyProject_1.value, translateController.companyProjectDay_1.value, translateController.companyProjectDesc_1.value, "assets/images/brandCareIcon.png", translateController.mainTech.value, translateController.companyProjectTech_1.value),
                      SizedBox(height: 50,),
                      projectWidget(translateController.companyProject_2.value, translateController.companyProjectDay_2.value, translateController.companyProjectDesc_2.value, "assets/images/allYIcon.png", translateController.mainTech.value, translateController.companyProjectTech_2.value),
                      SizedBox(height: 50,),
                      projectWidget(translateController.companyProject_3.value, translateController.companyProjectDay_3.value, translateController.companyProjectDesc_3_1.value, "assets/images/e-MilitaryIcon.png", translateController.mainTech.value, translateController.companyProjectTech_3.value),
                      SizedBox(height: 50,),
                      projectWidget(translateController.companyProject_4.value, translateController.companyProjectDay_4.value, translateController.companyProjectDesc_4.value, "assets/images/shareFitIcon.png", translateController.mainTech.value, translateController.companyProjectTech_4.value),
                      SizedBox(height: 50,),
                      projectWidget(translateController.companyProject_5.value, translateController.companyProjectDay_5.value, translateController.companyProjectDesc_5.value, "assets/images/porcheIcon.png", translateController.mainTech.value, translateController.companyProjectTech_5.value),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Center(
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: translateController.companyName_2.value,
                        style: tilePrimaryRegularTextStyle,
                        textAlign: TextAlign.right,
                      ),
                      CustomTextWidget(
                        text: translateController.companyDay_2.value,
                        style: medium10TextStyle,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      projectWidget(translateController.companyProject_6.value, translateController.companyProjectDay_6.value, translateController.companyProjectDesc_6.value, "assets/images/modakIcon.png", translateController.mainTech.value, translateController.companyProjectTech_6.value),
                      SizedBox(height: 50,),
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

Widget projectWidget(TextClass text1, TextClass text2, TextClass text3, String image, TextClass text4, TextClass text5){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
          Image.asset(
            image,
            width: 9.sp,
          ),
          SizedBox(width: 2.sp),
          CustomTextWidget(
            text: text1,
            style: medium12TextStyle,
            textAlign: TextAlign.left,
            maxLines: 2,
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(left: 11.sp),
        child: CustomTextWidget(
          text: text2,
          style: regular10TextStyle,
          textAlign: TextAlign.left,
          maxLines: 1,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 11.sp),
        child: CustomTextWidget(
          text: text3,
          style: regular10TextStyle,
          textAlign: TextAlign.left,
          maxLines: 5,
        ),
      ),
        SizedBox(height: 10,),
        Container(
          margin: EdgeInsets.only(left: 11.sp),
          child: CustomTextWidget(
            text: text4,
            style: regular12TextStyle,
            textAlign: TextAlign.left,
            maxLines: 1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 11.sp),
          child: CustomTextWidget(
            text: text5,
            style: regular10TextStyle,
            textAlign: TextAlign.left,
            maxLines: 2,
          ),
        )
    ],
  );
}
