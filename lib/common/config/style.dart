import 'package:flutter/material.dart';

const enFontFamily = "CabinetGrotesk";
const krFontFamily = "LINESeedKR";
const lightBackground = Color(0xffF8F9FB);
const darkBackground = Color(0xff171717);
const darkForeground = Color(0xff262626);
const black = Colors.black;
const white = Colors.white;
const black2 = Color(0xff1E1E1E);
const gray1 = Color(0xff4F4F4F);
const gray2 = Color(0xff828282);
const gray3 = Color(0xffBDBDBD);
const gray4 = Color(0xffCECECE);
const gray5 = Color(0xffDDDDDD);
const gray6 = Color(0xffE8E8E8);
const gray7 = Color(0xffF0F0F0);
const gray8 = Color(0xffF6F6F6);
const gray9 = Color(0xffFBFBFB);
const neonGreen = Color(0xff53FF9A);
const neonGreen2 = Color(0xff40EA86);
const neonBlue = Color(0xff41C1F7);
const neonBlue2 = Color(0xff0E5DDC);
const neonBlue3 = Color(0xff407BDD);
const neonPink = Color(0xffFF7CF2);
const neonPink2 = Color(0xffFF36B4);
const borderColor = Color(0xffFEFEFE);
const dropShadowColor_1 = Color.fromRGBO(92, 77, 77, 0.25);
const dropShadowColor_2 = Color.fromRGBO(0, 0, 0, 0.05);
const dropShadowColor_3 = Color.fromRGBO(0, 0, 0, 0.2);
const dropShadowColor_4 = Color.fromRGBO(0, 0, 0, 0.4);
const lightSurfaceColor = Color.fromRGBO(255, 255, 255, 0.9);
const darkSurfaceColor = Color.fromRGBO(60, 60, 60, 0.7);

KRTextTheme textTheme(BuildContext context) => Theme.of(context).extension<KRTextTheme>() ?? const KRTextTheme();

ColorTheme colorTheme(BuildContext context) => Theme.of(context).extension<ColorTheme>() ?? const ColorTheme();

@immutable
class ColorTheme extends ThemeExtension<ColorTheme> {
  const ColorTheme({
    this.primary = black,
    this.background = black,
    this.foreground = black,
    this.active = black,
    this.border = black,
    this.emotion = black,
    this.bottomNavigationBarSurface = black,
    this.activeButton = black,
  });

  final Color primary;
  final Color background;
  final Color foreground;
  final Color active;
  final Color border;
  final Color emotion;
  final Color bottomNavigationBarSurface;
  final Color activeButton;

  @override
  ThemeExtension<ColorTheme> copyWith({Color? background, Color? loginTextColor}) {
    return ColorTheme(
      background: background ?? this.background,
    );
  }

  @override
  ThemeExtension<ColorTheme> lerp(ThemeExtension<ColorTheme>? other, double t) {
    if (other is! ColorTheme) {
      return this;
    }
    return ColorTheme(background: Color.lerp(background, other.background, t) ?? background);
  }

  static const light = ColorTheme(
    primary: black,
    background: lightBackground,
    foreground: white,
    emotion: white,
    border: gray7,
    bottomNavigationBarSurface: lightSurfaceColor,
    active: neonGreen2,
    activeButton: black,
  );

  static const dark = ColorTheme(
    primary: white,
    background: darkBackground,
    foreground: darkForeground,
    emotion: gray1,
    border: black2,
    bottomNavigationBarSurface: darkSurfaceColor,
    active: white,
    activeButton: black2,
  );
}

@immutable
class KRTextTheme extends ThemeExtension<KRTextTheme> {
  const KRTextTheme({
    this.krTitle1 = const TextStyle(),
    this.krTitle2 = const TextStyle(),
    this.krTitle2R = const TextStyle(),
    this.krSubtitle1 = const TextStyle(),
    this.krSubtitle1R = const TextStyle(),
    this.krBody1 = const TextStyle(),
    this.krBody2 = const TextStyle(),
    this.krSubtext1 = const TextStyle(),
    this.krSubtext2 = const TextStyle(),
    this.bodyMedium = const TextStyle(),
    this.bodySmall = const TextStyle(),
  });

  final TextStyle krTitle1;
  final TextStyle krTitle2;
  final TextStyle krTitle2R;
  final TextStyle krSubtitle1;
  final TextStyle krSubtitle1R;
  final TextStyle krBody1;
  final TextStyle krBody2;
  final TextStyle krSubtext1;
  final TextStyle krSubtext2;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  @override
  ThemeExtension<KRTextTheme> copyWith({
    TextStyle? krTitle1,
    TextStyle? krTitle2,
    TextStyle? krTitle2R,
    TextStyle? krSubtitle1,
    TextStyle? krSubtitle1R,
    TextStyle? krBody1,
    TextStyle? krBody2,
    TextStyle? krSubtext1,
    TextStyle? krSubtext2,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
  }) {
    return KRTextTheme(
      krTitle1: krTitle1 ?? this.krTitle1,
      krTitle2: krTitle2 ?? this.krTitle2,
      krTitle2R: krTitle2R ?? this.krTitle2R,
      krSubtitle1: krSubtitle1 ?? this.krSubtitle1,
      krSubtitle1R: krSubtitle1R ?? this.krSubtitle1R,
      krBody1: krBody1 ?? this.krBody1,
      krBody2: krBody2 ?? this.krBody2,
      krSubtext1: krSubtext1 ?? this.krSubtext1,
      krSubtext2: krSubtext2 ?? this.krSubtext2,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
    );
  }

  @override
  ThemeExtension<KRTextTheme> lerp(ThemeExtension<KRTextTheme>? other, double t) {
    if (other is! KRTextTheme) {
      return this;
    }
    return const KRTextTheme();
  }

  static const light = KRTextTheme(
    krTitle1: TextStyle(fontFamily: krFontFamily, fontSize: 24, fontWeight: FontWeight.w700, color: black),
    krTitle2: TextStyle(fontFamily: krFontFamily, fontSize: 20, fontWeight: FontWeight.w700, color: black),
    krTitle2R: TextStyle(fontFamily: krFontFamily, fontSize: 20, fontWeight: FontWeight.w400, color: black),
    krSubtitle1: TextStyle(fontFamily: krFontFamily, fontSize: 18, fontWeight: FontWeight.w700, color: black),
    krSubtitle1R: TextStyle(fontFamily: krFontFamily, fontSize: 18, fontWeight: FontWeight.w400, color: black),
    krBody1: TextStyle(fontFamily: krFontFamily, fontSize: 16, fontWeight: FontWeight.w400, color: black),
    krBody2: TextStyle(fontFamily: krFontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: black),
    krSubtext1: TextStyle(fontFamily: krFontFamily, fontSize: 15, fontWeight: FontWeight.w400, color: black),
    krSubtext2: TextStyle(fontFamily: krFontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: black),
    bodyMedium: TextStyle(fontFamily: krFontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: gray1),
    bodySmall: TextStyle(fontFamily: krFontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: gray1),
  );

  static const dark = KRTextTheme(
    krTitle1: TextStyle(fontFamily: krFontFamily, fontSize: 24, fontWeight: FontWeight.w700, color: white),
    krTitle2: TextStyle(fontFamily: krFontFamily, fontSize: 20, fontWeight: FontWeight.w700, color: white),
    krTitle2R: TextStyle(fontFamily: krFontFamily, fontSize: 20, fontWeight: FontWeight.w400, color: white),
    krSubtitle1: TextStyle(fontFamily: krFontFamily, fontSize: 18, fontWeight: FontWeight.w700, color: white),
    krSubtitle1R: TextStyle(fontFamily: krFontFamily, fontSize: 18, fontWeight: FontWeight.w400, color: white),
    krBody1: TextStyle(fontFamily: krFontFamily, fontSize: 16, fontWeight: FontWeight.w400, color: white),
    krBody2: TextStyle(fontFamily: krFontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: white),
    krSubtext1: TextStyle(fontFamily: krFontFamily, fontSize: 15, fontWeight: FontWeight.w400, color: white),
    krSubtext2: TextStyle(fontFamily: krFontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: white),
    bodyMedium: TextStyle(fontFamily: krFontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: white),
    bodySmall: TextStyle(fontFamily: krFontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: white),
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String? hexColor) {
    if (hexColor != null) {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      return int.parse(hexColor, radix: 16);
    } else {
      return int.parse("FF000000", radix: 16);
    }
  }

  HexColor(final String? hexColor) : super(_getColorFromHex(hexColor));
}

class ColorHex extends StringBuffer {
  static String _getHexFromColor(Color? color) {
    if (color != null) {
      var colorText = color.toString().replaceAll('Color(', '').replaceAll(')', '').replaceAll('0xff', '').toUpperCase();
      return colorText;
    } else {
      return "000000";
    }
  }

  ColorHex(final Color? hexColor) : super(_getHexFromColor(hexColor));
}

class RandomColor extends Color {
  static int _getRandomColor(int number) {
    switch (number % 7) {
      case 0:
        return neonGreen2.value;
      case 1:
        return neonBlue2.value;
      case 2:
        return neonPink2.value;
      case 3:
        return neonBlue.value;
      case 4:
        return neonPink.value;
      case 5:
        return neonBlue3.value;
      case 6:
        return black.value;
      default:
        return black.value;
    }
  }

  RandomColor(final int number) : super(_getRandomColor(number));
}

class TextColorWithString extends Color {
  static int _getTextColor(String bgColor) => HexColor(bgColor).computeLuminance() > 0.5 ? black.value : white.value;

  TextColorWithString(final String? bgColor) : super(_getTextColor(bgColor ?? ""));
}

class TextColorWithColor extends Color {
  static int _getTextColor(Color bgColor) => bgColor.computeLuminance() > 0.5 ? black.value : white.value;

  TextColorWithColor(final Color bgColor) : super(_getTextColor(bgColor));
}

class BrandColor extends Color {
  static int _getBrandColor(String? color, String? id) {
    if (color != null) {
      return HexColor(color).value;
    } else {
      return RandomColor(int.parse(id ?? '0')).value;
    }
  }

  BrandColor(final String? color, String? id) : super(_getBrandColor(color, id));
}

class OnColor extends Color {
  static int _getOnColor(String? onColor, String? id) {
    if (onColor != null) {
      return HexColor(onColor).value;
    } else {
      return TextColorWithColor(RandomColor(int.parse(id ?? '0'))).value;
    }
  }

  OnColor(final String? onColor, String? id) : super(_getOnColor(onColor, id));
}
