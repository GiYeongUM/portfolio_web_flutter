import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'l10n/app_localizations.dart';

part 'generated/style.g.dart';

const fontFamily = 'NotoSansKR';
const pointFontFamily = 'Sharpie';
const lightBackground = Color(0xffFFFEFB);
const pointLightBackground = Color(0xffFFE607);
const pointLightBackground2 = Color(0xFFFFCA28);
const pointLightBackground3 = Color(0xFFFFD54F);
const foreground = Color(0xffF5F2FD);
const darkBackground = Color(0xff1D1B20);
const pointDarkBackground = Color(0xff141218);
const black = Colors.black;
const black1 = Color(0xff1D1B20);
const black2 = Color(0xff211F26);
const black3 = Color(0xff2D2D35);
const black4 = Color(0xff3d3d41);
const white = Colors.white;
const white2 = Color(0xffF5F5F5);
const gray1 = Color(0xffDDDDDD);
const gray2 = Color(0xff8c8c8c);
const blue1 = Color(0xff0058AB);
const blue2 = Color(0xff0A90FB);
const blue3 = Color(0xff85BFDA);
const purple1 = Color(0xff4243E7);
const green1 = Color(0xff00F5A0);
const green2 = Color(0xffBDEBEA);
const red1 = Color(0xffF76363);
const violet = Color(0xff5222D0);
const floor = Color(0xffD7DCDE);
const wood = Color(0xFF884326);

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  KRTextTheme get textTheme => (theme.extension<KRTextTheme>() ?? const KRTextTheme());

  ColorTheme get colorTheme => (theme.extension<ColorTheme>() ?? const ColorTheme());

  TargetPlatform get targetPlatform => Theme.of(this).platform;

  bool get isMobile => Theme.of(this).platform == TargetPlatform.android || Theme.of(this).platform == TargetPlatform.iOS;

  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;

  AppLocalizations get localization => AppLocalizations.of(this)!;

  double get stepHeight => MediaQuery.of(this).size.height / 4;
}

@immutable
@CopyWith()
class ColorTheme extends ThemeExtension<ColorTheme> {
  const ColorTheme({
    this.foregroundColor,
    this.backgroundColor,
    this.wallColor,
    this.primaryColor,
    this.reversePrimaryColor,
    this.pointBackgroundColor,
    this.pointBackgroundGradient = const [],
    this.floorColor,
    this.foregroundTextColor,
    this.reverseColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? pointBackgroundColor;
  final List<Color>? pointBackgroundGradient;
  final Color? wallColor;
  final Color? reversePrimaryColor;
  final Color? primaryColor;
  final Color? floorColor;
  final Color? foregroundTextColor;
  final Color? reverseColor;

  @override
  ThemeExtension<ColorTheme> lerp(ThemeExtension<ColorTheme>? other, double t) {
    if (other is! ColorTheme) {
      return this;
    }
    return ColorTheme(primaryColor: Color.lerp(primaryColor, other.primaryColor, t) ?? primaryColor);
  }

  @override
  ThemeExtension<ColorTheme> copyWith() => $ColorThemeCopyWith(this).copyWith();

  static ColorTheme light = const ColorTheme(
    foregroundColor: foreground,
    backgroundColor: lightBackground,
    pointBackgroundColor: pointLightBackground,
    pointBackgroundGradient: [
      pointLightBackground3,
      pointLightBackground2,
      pointLightBackground,
    ],
    wallColor: blue1,
    primaryColor: blue1,
    reversePrimaryColor: white,
    floorColor: floor,
    foregroundTextColor: blue1,
    reverseColor: black1,
  );

  static ColorTheme dark = const ColorTheme(
    foregroundColor: black4,
    backgroundColor: darkBackground,
    pointBackgroundColor: pointDarkBackground,
    pointBackgroundGradient: [
      black2,
      black1,
      pointDarkBackground,
    ],
    wallColor: blue1,
    primaryColor: green1,
    reversePrimaryColor: blue1,
    floorColor: black3,
    foregroundTextColor: white,
    reverseColor: white,
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
    krPoint1: TextStyle(fontFamily: pointFontFamily, fontSize: 24, fontWeight: FontWeight.w800, color: black3),
    krButton1: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: black3),
    krSubtitle1: TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w700, color: black3),
    krSubtitle2: TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.w700, color: black3),
    krBody1: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: black3),
    krBody2: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w700, color: black3),
    krBody3: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w300, color: black3),
    krBody4: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w400, color: black3),
    krBody5: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: black3),
    krSubtext1: TextStyle(fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w400, color: black3),
    krSubtext2: TextStyle(fontFamily: fontFamily, fontSize: 13, fontWeight: FontWeight.w700, color: black3),
    krBottom: TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: black3),
  );

  static const dark = KRTextTheme(
    krPoint1: TextStyle(fontFamily: pointFontFamily, fontSize: 24, fontWeight: FontWeight.w800, color: white),
    krButton1: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: white),
    krSubtitle1: TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w700, color: white),
    krSubtitle2: TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.w400, color: white),
    krBody1: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: white),
    krBody2: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w700, color: white),
    krBody3: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: white),
    krBody4: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w400, color: white),
    krBody5: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: white),
    krSubtext1: TextStyle(fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w400, color: white),
    krSubtext2: TextStyle(fontFamily: fontFamily, fontSize: 13, fontWeight: FontWeight.w700, color: white),
    krBottom: TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: white),
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
