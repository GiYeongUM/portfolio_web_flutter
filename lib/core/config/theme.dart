import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config.dart';

final lightTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    ColorTheme.light,
    KRTextTheme.light,
  ],
  brightness: Brightness.light,
  scaffoldBackgroundColor: pointLightBackground,
  dividerColor: gray1,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: white),
  appBarTheme: AppBarTheme(
    backgroundColor: pointLightBackground,
    foregroundColor: black3,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: const IconThemeData(color: black3),
    titleTextStyle: KRTextTheme.dark.krBody4.copyWith(color: black3),
  ),
);

final darkTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    ColorTheme.dark,
    KRTextTheme.dark,
  ],
  brightness: Brightness.dark,
  scaffoldBackgroundColor: pointDarkBackground,
  dividerColor: black,
  appBarTheme: AppBarTheme(
    backgroundColor: pointDarkBackground,
    foregroundColor: white,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: const IconThemeData(color: white),
    titleTextStyle: KRTextTheme.dark.krBody4.copyWith(color: white),
  ),
);
