import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

enum mainViewType {
  icon,
  intro1,
  intro2,
  mainView
}


class MainController extends GetxController with GetSingleTickerProviderStateMixin {
  var scrollController = ScrollController().obs;
  late AnimationController bottomAnimationController;
  var bottomBlink = true.obs;
  var mainViewEnum = (mainViewType.icon).obs;
  var mainViewCanChange = true.obs;
  var mainViewAnimation = [false, false, false, false].obs;

  @override
  void onInit() {

    bottomAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    bottomAnimationController.repeat(reverse: true);

    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels == scrollController.value.position.maxScrollExtent) {

      }

      final direction = scrollController.value.position.userScrollDirection;

      if (scrollController.value.position.pixels == scrollController.value.position.maxScrollExtent) {
        bottomAnimationController.stop();
        bottomBlink.value = false;
        if(mainViewCanChange.value && mainViewEnum.value != mainViewType.mainView){
          mainViewCanChange.value = false;
          switch(mainViewEnum.value){
            case mainViewType.icon:
              mainViewAnimation[0] = true;

              Future.delayed(const Duration(seconds: 1), (){
                mainViewEnum.value = mainViewType.intro1;
                Future.delayed(const Duration(milliseconds: 500), (){
                  mainViewAnimation[1] = true;
                  scrollController.value.animateTo(
                      scrollController.value.position.minScrollExtent,
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.easeOut);
                });
              });
              break;
            case mainViewType.intro1:
              mainViewAnimation[1] = false;
              Future.delayed(const Duration(seconds: 1), (){
                mainViewEnum.value = mainViewType.intro2;
                Future.delayed(const Duration(milliseconds: 500), (){
                  mainViewAnimation[2] = true;
                  scrollController.value.animateTo(
                      scrollController.value.position.minScrollExtent,
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.easeOut);
                });
              });
              break;
            case mainViewType.intro2:
              mainViewAnimation[2] = false;
              Future.delayed(const Duration(seconds: 1), (){
                mainViewEnum.value = mainViewType.mainView;
                Future.delayed(const Duration(milliseconds: 500), (){
                  mainViewAnimation[3] = true;
                  scrollController.value.animateTo(
                      scrollController.value.position.minScrollExtent,
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.easeOut);
                });
              });
              break;
            case mainViewType.mainView:
              // TODO: Handle this case.
              break;
          }
          Future.delayed(const Duration(milliseconds: 2700), (){
            mainViewCanChange.value = true;
          });
        }

      } else {

      }
    });

    super.onInit();
  }

}