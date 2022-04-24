import 'package:get/get.dart';
import 'dart:async';

import 'model/text_class.dart';


class TranslateController extends GetxController {
  // var testText = TextClass(textMap: {
  //   "kr": TextStatus(text: "테스트 텍스트입니다.", currentLength: 11.obs),
  //   "en": TextStatus(text: "This is test text.", currentLength: 0.obs)},
  //     canTranslate: true.obs, isKr: true.obs).obs;
  var scrollText = TextClass(textMap: {
    "kr": TextStatus(text: "스크롤로 내용보기", currentLength: "스크롤로 내용보기".length.obs),
    "en": TextStatus(text: "Scroll to view content", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;



  void translateStart(TextClass textData){
    if(!textData.canTranslate.value){
      return;
    }
    textData.canTranslate.value = false;
    Timer.periodic(const Duration(milliseconds: 15), (timer) {
      if(textData.textMap[textData.isKr.value ? "kr" : "en"]!.currentLength.value == 0){
        timer.cancel();
        textData.isKr.value = !textData.isKr.value;
        Timer.periodic(const Duration(milliseconds: 15), (timerEnd) {
          if (textData.textMap[textData.isKr.value ? "kr" : "en"]!.currentLength.value == textData.textMap[textData.isKr.value ? "kr" : "en"]!.text.length) {
            textData.canTranslate.value = true;
            timerEnd.cancel();
          } else {
            textData.textMap[textData.isKr.value ? "kr" : "en"]!.currentLength.value++;
          }
        });
      } else {
        textData.textMap[textData.isKr.value ? "kr" : "en"]!.currentLength.value--;
      }
    });

  }


}