import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_static_utility/flutter_static_utility.dart';

import '../../common/binding.dart';

class AnimatedDigit extends StatelessWidget {
  AnimatedDigit({super.key, required this.value, this.fontSize, required this.textStyle, this.fractionDigits, this.suffix, this.onChangeNumber = 1000, this.prefix});

  final num value;
  final double? fontSize;
  final TextStyle textStyle;
  final int? fractionDigits;
  final String? suffix;
  final String? prefix;
  final ValueNotifier<Brightness> updateBrightness = ValueNotifier(Brightness.light);
  final int onChangeNumber;

  changeBrightness(Brightness brightness) {
    updateBrightness.value = brightness;
  }

  @override
  Widget build(BuildContext context) {
    changeBrightness(Theme.of(context).brightness);
    return ValueListenableBuilder<Brightness>(
      valueListenable: updateBrightness,
      builder: (context, val, child) {
        return val == Brightness.light
            ? AnimatedDigitWidget(
                key: Key('${super.key}_1'),
                value: value >= onChangeNumber ? thousandToData(value.toInt()).data : value,
                fractionDigits: fractionDigits ?? (value >= onChangeNumber ? thousandToData(value.toInt()).fraction : 0),
                suffix: suffix ?? (value >= onChangeNumber ? thousandToData(value.toInt()).suffix : ""),
                textStyle: textStyle.copyWith(fontSize: fontSize, color: black),
                prefix: prefix ?? '',
                enableSeparator: true,
                duration: const Duration(milliseconds: 500),
              )
            : AnimatedDigitWidget(
                key: Key('${super.key}_2'),
                value: value >= onChangeNumber ? thousandToData(value.toInt()).data : value,
                fractionDigits: fractionDigits ?? (value >= onChangeNumber ? thousandToData(value.toInt()).fraction : 0),
                suffix: suffix ?? (value >= 10000000 ? thousandToData(value.toInt()).suffix : ""),
                textStyle: textStyle.copyWith(fontSize: fontSize, color: white),
                prefix: prefix ?? '',
                enableSeparator: true,
                duration: const Duration(milliseconds: 500),
              );
      },
    );
  }
}
