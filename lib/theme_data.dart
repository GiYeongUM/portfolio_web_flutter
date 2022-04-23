import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


// (Theme.of(context).brightness == Brightness.dark? gray_3a3a3aColor: white_efefefColor),
double _mediumFontSize2x = 15.sp;
double _mediumFontSize3x = 18.sp;
double _mediumFontSize4x = 23.sp;
double _mediumFontSize = 14.sp;
double _smallFontSize2X = 12.sp;
double _smallFontSize = 10.sp;
double _buttonDefaultSize = 16.sp;
double _largeFontSize2x = 32.sp;
double _largeFontSize = 25.sp;


const TextStyle _defaultTextStyle = TextStyle(fontFamily: 'NotoSans');
const TextStyle _hanTextStyle = TextStyle(fontFamily: 'BlackHan');
const _textColorDark = Colors.white;
const _textColorLight = Colors.black;


const gray_3a3a3aColor = Color(0xff3a3a3a); // 다크모드 배경색
const white_efefefColor = Color(0xffffffff); // 라이트모드 배경색
const textInput_light = Color(0xfff3f3f3);
const textInput_dark = Color(0xff676767);
const disable_color = Color(0xff8d8d8d);

const textInput_border_disable = Color(0xffE0E0E0);
const textInput_border_disable_dark = Color(0xff828282);
const textInput_border_enable = Color(0xff9762E6);

const primaryColor = Color(0xff742ddd);
const secondColor = Color(0xffb6ff90);

Color backGroundColorTheme(context){
  return Theme.of(context).brightness == Brightness.light ? white_efefefColor : gray_3a3a3aColor;
}
Color primaryColorTheme(context){
  return Theme.of(context).brightness == Brightness.light ? primaryColor : white_efefefColor;
}

const kakaoColor = Color(0xffFFE812);
const naverColor = Color(0xff3BAE37);
const facebookColor = Color(0xff374C85);



TextStyle medium24TextStyle = _defaultTextStyle.copyWith(fontSize: _largeFontSize2x, fontWeight: FontWeight.w500);
TextStyle medium14TextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize, fontWeight: FontWeight.w500);
TextStyle medium12TextStyle = _defaultTextStyle.copyWith(fontSize: _smallFontSize2X, fontWeight: FontWeight.w500);
TextStyle medium10TextStyle = _defaultTextStyle.copyWith(fontSize: _smallFontSize, fontWeight: FontWeight.w500);

TextStyle regular14TextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize, fontWeight: FontWeight.w400);
TextStyle regular12TextStyle = _defaultTextStyle.copyWith(fontSize: _smallFontSize2X, fontWeight: FontWeight.w400);
TextStyle regular10TextStyle = _defaultTextStyle.copyWith(fontSize: _smallFontSize, fontWeight: FontWeight.w400);

TextStyle nickNameBoldTextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize4x, fontWeight: FontWeight.bold);
TextStyle tileBoldTextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize2x, fontWeight: FontWeight.bold);
TextStyle tileBoldTextStyleLarge = _defaultTextStyle.copyWith(fontSize: _mediumFontSize3x, fontWeight: FontWeight.bold);
TextStyle tileRegularTextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize);
TextStyle tilePrimaryRegularTextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize, fontWeight: FontWeight.bold, color: primaryColor);
TextStyle clothesBoldTextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize2x, fontWeight: FontWeight.bold);
TextStyle clothesRegularTextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize);
TextStyle clothesPrimaryTextStyle = _defaultTextStyle.copyWith(fontSize: _mediumFontSize2x, fontWeight: FontWeight.bold, color: primaryColor);



TextStyle buttonPrimaryTextStyle = _defaultTextStyle.copyWith(fontSize: _buttonDefaultSize, fontWeight: FontWeight.bold, color: Colors.white);
TextStyle buttonTextStyle = _defaultTextStyle.copyWith(fontSize: _buttonDefaultSize, fontWeight: FontWeight.bold);
TextStyle buttonPrimaryBoldTextStyle = _defaultTextStyle.copyWith(fontSize: _buttonDefaultSize, color: primaryColor, fontWeight: FontWeight.bold);
TextStyle appBarTextStyle = _defaultTextStyle.copyWith(fontSize: _largeFontSize, fontWeight: FontWeight.bold, color: Colors.white);

TextStyle hanStyleCount = _defaultTextStyle.copyWith(fontSize: _mediumFontSize2x, fontWeight: FontWeight.bold);

TextStyle hanStyleDark = _hanTextStyle.copyWith(fontSize: _largeFontSize, color: _textColorDark);
TextStyle hanStyleLight = _hanTextStyle.copyWith(fontSize: _largeFontSize,  color: _textColorLight);

class Themes {

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: gray_3a3a3aColor,
        selectedIconTheme: IconThemeData(color: Colors.white, opacity: 1),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          opacity: 0.5,
        ),
      ),
      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.black),
          color: Colors.black,
          shadowColor: Colors.black.withOpacity(0.8),
          elevation: 5,
          titleTextStyle: appBarTextStyle,
          iconTheme: const IconThemeData(
            color: Colors.white,
          )),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
        disabledColor: Colors.grey,
      ));
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: white_efefefColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: primaryColor, opacity: 1),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 0.7,
        ),
      ),
      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: primaryColor),
          color: primaryColor,
          titleTextStyle: appBarTextStyle,
          iconTheme: const IconThemeData(
            color: Colors.white,
          )),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
        disabledColor: Colors.grey,
      ));



}


