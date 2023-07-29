import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'style.dart';

var lightTheme = ThemeData(
  extensions: const <ThemeExtension<dynamic>>[
    ColorTheme.light,
    KRTextTheme.light,
  ],
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorTheme.light.background,
  dividerColor: gray6,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: white),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorTheme.light.background,
    foregroundColor: black,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: const IconThemeData(color: gray1),
    titleTextStyle: KRTextTheme.light.krSubtitle1.copyWith(color: gray1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(color: gray7, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(color: neonGreen, width: 1.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(color: gray7, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(color: gray7, width: 1.0),
    ),
    contentPadding: const EdgeInsets.only(left: 24, right: 24, top: 22.5, bottom: 22.5),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: white.withOpacity(0),
    elevation: 0,
    selectedItemColor: black,
    unselectedItemColor: gray3,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(black),
      foregroundColor: MaterialStateProperty.all<Color>(white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
  ),
  primaryColor: black,
);

var darkTheme = ThemeData(
  extensions: const <ThemeExtension<dynamic>>[
    ColorTheme.dark,
    KRTextTheme.dark,
  ],
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorTheme.dark.background,
  dividerColor: ColorTheme.dark.foreground,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: darkForeground),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: white),
    backgroundColor: ColorTheme.dark.background,
    foregroundColor: white,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    titleTextStyle: KRTextTheme.dark.krSubtitle1,
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: gray2.withOpacity(0), width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: gray2.withOpacity(0), width: 2.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: gray2.withOpacity(0), width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: gray2.withOpacity(0), width: 1.0),
    ),
    contentPadding: const EdgeInsets.only(left: 24, right: 24, top: 22.5, bottom: 22.5),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: black.withOpacity(0),
    elevation: 0,
    selectedItemColor: white,
    unselectedItemColor: gray2,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(darkForeground),
      foregroundColor: MaterialStateProperty.all<Color>(white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
  ),
  primaryColor: white,
);
