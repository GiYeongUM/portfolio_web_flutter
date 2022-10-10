
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/before/translate.dart';

import '../model/text_class.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({Key? key, required this.text, required this.style, required this.textAlign, this.maxLines = 1}) : super(key: key);

  final TextClass text;
  final TextStyle style;
  final TextAlign textAlign;
  final int? maxLines;

  var translateController = Get.find<TranslateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AutoSizeText(text.textMap[text.isKr.value ? "kr" : "en"]!.text.substring(0, text.textMap[text.isKr.value ? "kr" : "en"]!.currentLength.value),
            style: style, maxLines: maxLines, textAlign: textAlign
        )
    );
  }
}
