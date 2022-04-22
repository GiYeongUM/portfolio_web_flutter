
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/text_class.dart';
import '../translate.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({Key? key, required this.text, required this.style}) : super(key: key);

  final TextClass text;
  final TextStyle style;

  var translateController = Get.find<TranslateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(text.textMap[text.isKr.value ? "kr" : "en"]!
        .text.substring(0, text.textMap[text.isKr.value ? "kr" : "en"]!.currentLength.value),
        style: style));
  }
}
