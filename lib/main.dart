import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/page/main_page.dart';
import 'package:giyeong_um_porfolio_page/page/splash_page.dart';
import 'package:giyeong_um_porfolio_page/translate.dart';

import 'theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var translateController = Get.put(TranslateController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context) => GetMaterialApp(
        initialRoute: "/",
        title: "엄기영 | 포트폴리오",
        builder: EasyLoading.init(builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context),
            child: widget!,
          );
        }),
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,

        home: SplashPage(),
      ),
    );
  }
}
