
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key, required this.text, required this.style, required this.textLength}) : super(key: key);

  final String text;
  final TextStyle style;
  final int textLength;


  @override
  Widget build(BuildContext context) {
    return Text(text.substring(0, textLength), style: style);
  }
}
