import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainController extends GetxController with GetSingleTickerProviderStateMixin {
  var scrollController = ScrollController().obs;
  late AnimationController bottomAnimationController;
  var bottomBlink = true.obs;


  @override
  void onInit() {

    bottomAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    bottomAnimationController.repeat(reverse: true);

    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels == scrollController.value.position.maxScrollExtent) {
        print("maxmax");
      }

      final direction = scrollController.value.position.userScrollDirection;
      print(direction);
      if (direction == ScrollDirection.reverse) {
        bottomAnimationController.stop();
        bottomBlink.value = false;
        Future.delayed(Duration(milliseconds: 1000), (){
        });
      } else {

      }
    });

    super.onInit();
  }

}