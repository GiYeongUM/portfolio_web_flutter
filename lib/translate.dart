import 'package:get/get.dart';
import 'dart:async';

var testText = {'kr': "테스트 텍스트입니다.", 'en': "This is test text."};

class TranslateController extends GetxController {
  var language = "kr".obs;
  var textLength = testText["kr"]!.length.obs;
  var translateEnd = true.obs;


  void translateStart(){
    if(language.value == "kr") {
      Timer.periodic(const Duration(milliseconds: 20), (timer) {
        if(textLength.value == 0){
          language.value = "en";
          timer.cancel();
          Timer.periodic(const Duration(milliseconds: 20), (timerEnd) {
            if (textLength.value == testText['en']!.length) {
              translateEnd.value = true;
              timerEnd.cancel();
            } else {
              textLength.value++;
            }
          });
        } else {
          textLength.value--;
        }
      });
    } else {
      Timer.periodic(const Duration(milliseconds: 20), (timer) {
        if(textLength.value == 0){
          language.value = "kr";
          timer.cancel();
          Timer.periodic(const Duration(milliseconds: 20), (timerEnd) {
            if (textLength.value == testText['kr']!.length) {
              translateEnd.value = true;
              timerEnd.cancel();
            } else {
              textLength.value++;
            }
          });
        } else {
          textLength.value--;
        }
      });
    }
  }


}