import 'package:get/get.dart';
import 'dart:async';

import 'model/text_class.dart';


class TranslateController extends GetxController {
  // var testText = TextClass(textMap: {
  //   "kr": TextStatus(text: "테스트 텍스트입니다.", currentLength: 11.obs),
  //   "en": TextStatus(text: "This is test text.", currentLength: 0.obs)},
  //     canTranslate: true.obs, isKr: true.obs).obs;
  var introText_1 = TextClass(textMap: {
    "kr": TextStatus(text: "안녕하세요!", currentLength: "안녕하세요!".length.obs),
    "en": TextStatus(text: "Hello there!", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_2 = TextClass(textMap: {
    "kr": TextStatus(text: "크로스 플랫폼 모바일 개발자", currentLength: "크로스 플랫폼 모바일 개발자".length.obs),
    "en": TextStatus(text: "a cross-platform mobile developer", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_3 = TextClass(textMap: {
    "kr": TextStatus(text: "엄기영입니다!", currentLength: "엄기영입니다!".length.obs),
    "en": TextStatus(text: "GiYeongUM", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var sideText_1 = TextClass(textMap: {
    "kr": TextStatus(text: "I'm", currentLength: "I'm".length.obs),
    "en": TextStatus(text: "저는", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_4 = TextClass(textMap: {
    "kr": TextStatus(text: "창의적, 효율적으로", currentLength: "창의적, 효율적으로".length.obs),
    "en": TextStatus(text: "Creatively and efficiently", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_5 = TextClass(textMap: {
    "kr": TextStatus(text: "AOS, iOS 모두", currentLength: "AOS, iOS 모두".length.obs),
    "en": TextStatus(text: "both AOS and iOS", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_6 = TextClass(textMap: {
    "kr": TextStatus(text: "심지어 Flutter 까지!", currentLength: "심지어 Flutter 까지!".length.obs),
    "en": TextStatus(text: "even Flutter!", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;


  var sideText_2 = TextClass(textMap: {
    "kr": TextStatus(text: "Developer", currentLength: "Developer".length.obs),
    "en": TextStatus(text: "개발자입니다.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var textClassList = <TextClass>[];

  @override
  void onInit() {
    textClassList = [
      introText_1.value,
      introText_2.value,
      introText_3.value,
      introText_4.value,
      introText_5.value,
      introText_6.value,
      sideText_1.value,
      sideText_2.value
    ];
    super.onInit();
  }

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