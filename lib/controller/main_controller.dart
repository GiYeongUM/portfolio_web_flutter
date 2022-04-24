import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var scrollController = ScrollController().obs;

  @override
  void onInit() {

    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels == scrollController.value.position.maxScrollExtent) {
        print("maxmax");
      }

      final direction = scrollController.value.position.userScrollDirection;
      print(direction);
      if (direction == ScrollDirection.forward) {
      } else {

      }
    });

    super.onInit();
  }

}