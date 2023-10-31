import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

part 'generated/style.g.dart';

const krFontFamily = 'LINESeedKR';
const lightBackground = Color(0xffFFFFFF);
const foreground = Color(0xffF9F9F9);
const darkBackground = Color(0xff171717);
const darkForeground = Color(0xff262626);
const borderColor = Color(0xffEFEFEF);
const activeBorderColor = Color(0xffB3C5E5);
const black = Colors.black;
const black1 = Color(0xff2D2D35);
const white = Colors.white;
const white2 = Color(0xffF5F5F5);
const gray1 = Color(0xffDDDDDD);
const gray2 = Color(0xff8c8c8c);
const blue1 = Color(0xff086BFF);
const blue2 = Color(0xff0A90FB);
const blue3 = Color(0xff85BFDA);
const purple1 = Color(0xff4243E7);
const green1 = Color(0xff00FD0A);
const red1 = Color(0xffF76363);

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  KRTextTheme get textTheme => (theme.extension<KRTextTheme>() ?? const KRTextTheme());

  ColorTheme get colorTheme => (theme.extension<ColorTheme>() ?? const ColorTheme());
}

@immutable
@CopyWith()
class ColorTheme extends ThemeExtension<ColorTheme> {
  const ColorTheme({
    this.stepColor,
    this.buttonColor,
    this.activeButtonColor,
    this.disableButtonColor,
    this.disableButtonTextColor,
    this.foregroundColor,
  });

  final Color? stepColor;
  final Color? buttonColor;
  final Color? activeButtonColor;
  final Color? disableButtonColor;
  final Color? disableButtonTextColor;
  final Color? foregroundColor;

  @override
  ThemeExtension<ColorTheme> lerp(ThemeExtension<ColorTheme>? other, double t) {
    if (other is! ColorTheme) {
      return this;
    }
    return ColorTheme(activeButtonColor: Color.lerp(activeButtonColor, other.activeButtonColor, t) ?? activeButtonColor);
  }

  @override
  ThemeExtension<ColorTheme> copyWith() => $ColorThemeCopyWith(this).copyWith();

  static ColorTheme light = const ColorTheme(
    stepColor: purple1,
    buttonColor: white,
    activeButtonColor: blue1,
    disableButtonColor: gray1,
    disableButtonTextColor: gray2,
    foregroundColor: foreground,
  );

  static ColorTheme dark = const ColorTheme(
    stepColor: white,
    buttonColor: darkBackground,
    activeButtonColor: darkForeground,
    disableButtonColor: gray2,
    disableButtonTextColor: gray1,
    foregroundColor: darkForeground,
  );
}

@immutable
@CopyWith()
class KRTextTheme extends ThemeExtension<KRTextTheme> {
  const KRTextTheme({
    this.krPoint1 = const TextStyle(),
    this.krButton1 = const TextStyle(),
    this.krSubtitle1 = const TextStyle(),
    this.krSubtitle2 = const TextStyle(),
    this.krBody1 = const TextStyle(),
    this.krBody2 = const TextStyle(),
    this.krBody3 = const TextStyle(),
    this.krBody4 = const TextStyle(),
    this.krBody5 = const TextStyle(),
    this.krSubtext1 = const TextStyle(),
    this.krSubtext2 = const TextStyle(),
    this.krBottom = const TextStyle(),
  });

  final TextStyle krPoint1;
  final TextStyle krButton1;
  final TextStyle krSubtitle1;
  final TextStyle krSubtitle2;
  final TextStyle krBody1;
  final TextStyle krBody2;
  final TextStyle krBody3;
  final TextStyle krBody4;
  final TextStyle krBody5;
  final TextStyle krSubtext1;
  final TextStyle krSubtext2;
  final TextStyle krBottom;

  @override
  ThemeExtension<KRTextTheme> copyWith() => $KRTextThemeCopyWith(this).copyWith();

  @override
  ThemeExtension<KRTextTheme> lerp(ThemeExtension<KRTextTheme>? other, double t) {
    if (other is! KRTextTheme) {
      return this;
    }
    return const KRTextTheme();
  }

  static const light = KRTextTheme(
    krPoint1: TextStyle(fontFamily: krFontFamily, fontSize: 24, fontWeight: FontWeight.w700, color: black1),
    krButton1: TextStyle(fontFamily: krFontFamily, fontSize: 20, fontWeight: FontWeight.w700, color: black1),
    krSubtitle1: TextStyle(fontFamily: krFontFamily, fontSize: 18, fontWeight: FontWeight.w700, color: black1),
    krSubtitle2: TextStyle(fontFamily: krFontFamily, fontSize: 18, fontWeight: FontWeight.w400, color: black1),
    krBody1: TextStyle(fontFamily: krFontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: black1),
    krBody2: TextStyle(fontFamily: krFontFamily, fontSize: 14, fontWeight: FontWeight.w700, color: black1),
    krBody3: TextStyle(fontFamily: krFontFamily, fontSize: 14, fontWeight: FontWeight.w300, color: black1),
    krBody4: TextStyle(fontFamily: krFontFamily, fontSize: 16, fontWeight: FontWeight.w400, color: black1),
    krBody5: TextStyle(fontFamily: krFontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: black1),
    krSubtext1: TextStyle(fontFamily: krFontFamily, fontSize: 10, fontWeight: FontWeight.w400, color: black1),
    krSubtext2: TextStyle(fontFamily: krFontFamily, fontSize: 13, fontWeight: FontWeight.w700, color: black1),
    krBottom: TextStyle(fontFamily: krFontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: black1),
  );

  static const dark = KRTextTheme(
    krPoint1: TextStyle(fontFamily: krFontFamily, fontSize: 24, fontWeight: FontWeight.w700, color: white),
    krButton1: TextStyle(fontFamily: krFontFamily, fontSize: 20, fontWeight: FontWeight.w700, color: white),
    krSubtitle1: TextStyle(fontFamily: krFontFamily, fontSize: 18, fontWeight: FontWeight.w700, color: white),
    krSubtitle2: TextStyle(fontFamily: krFontFamily, fontSize: 18, fontWeight: FontWeight.w400, color: white),
    krBody1: TextStyle(fontFamily: krFontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: white),
    krBody2: TextStyle(fontFamily: krFontFamily, fontSize: 14, fontWeight: FontWeight.w700, color: white),
    krBody3: TextStyle(fontFamily: krFontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: white),
    krBody4: TextStyle(fontFamily: krFontFamily, fontSize: 16, fontWeight: FontWeight.w400, color: white),
    krBody5: TextStyle(fontFamily: krFontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: white),
    krSubtext1: TextStyle(fontFamily: krFontFamily, fontSize: 10, fontWeight: FontWeight.w400, color: white),
    krSubtext2: TextStyle(fontFamily: krFontFamily, fontSize: 13, fontWeight: FontWeight.w700, color: white),
    krBottom: TextStyle(fontFamily: krFontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: white),
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String? hexColor) {
    if (hexColor == null) return int.parse('FF000000', radix: 16);
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String? hexColor) : super(_getColorFromHex(hexColor));
}

class ColorHex extends StringBuffer {
  static String _getHexFromColor(Color? color) {
    if (color == null) return '000000';
    return color.toString().replaceAll(RegExp(r'Color\(|\)|0xff'), '').toUpperCase();
  }

  ColorHex(final Color? hexColor) : super(_getHexFromColor(hexColor));
}

class TextColor extends Color {
  static int _getTextColor(Color? backgroundColor) => (backgroundColor ?? white).computeLuminance() > 0.5 ? black.value : white.value;

  TextColor(final Color? bgColor) : super(_getTextColor(bgColor));
}
