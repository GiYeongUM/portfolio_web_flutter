import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final homeScrollController = ScrollController();

  @override
  void onInit() {
    homeScrollController.addListener(() {
      if(homeScrollController.offset != 0){

        print('offset = ${homeScrollController.offset.sp / Get.size.height }');
      }
    });
    super.onInit();
  }
}