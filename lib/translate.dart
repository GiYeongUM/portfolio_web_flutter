import 'package:get/get.dart';


var testText = {'kr': "테스트 텍스트입니다.", 'en': "This is test text."};

class TranslateController extends GetxController {
  var language = "kr".obs;


  void translate(){
    if(language.value == "kr") {
      language.value = "en";
    } else {
      language.value = "kr";
    }
  }

}