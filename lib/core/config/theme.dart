import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config.dart';

final lightTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    ColorTheme.light,
    KRTextTheme.light,
  ],
  brightness: Brightness.light,
  scaffoldBackgroundColor: lightBackground,
  dividerColor: gray1,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: white),
  appBarTheme: AppBarTheme(
    backgroundColor: lightBackground,
    foregroundColor: black1,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: const IconThemeData(color: black1),
    titleTextStyle: KRTextTheme.dark.krBody4.copyWith(color: black1),
  ),
);

final darkTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    ColorTheme.dark,
    KRTextTheme.dark,
  ],
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBackground,
  dividerColor: black,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackground,
    foregroundColor: white,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: const IconThemeData(color: white),
    titleTextStyle: KRTextTheme.dark.krBody4.copyWith(color: white),
  ),
);
