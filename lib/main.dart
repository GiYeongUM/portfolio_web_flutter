import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/page/birth_color_page.dart';
import 'package:giyeong_um_porfolio_page/page/splash_page.dart';
import 'package:giyeong_um_porfolio_page/page/whole_page.dart';
import 'package:giyeong_um_porfolio_page/translate.dart';

import 'theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      builder: (BuildContext context, child) => GetMaterialApp(
        initialRoute: "/",
        title: "GiYeongUm",
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return GetPageRoute(page: () => WholePage());
            case '/showmycolor':
              return GetPageRoute(page: () => const BirthColorPage());
            default:
              return GetPageRoute(page: () => WholePage());
          }
        },
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
        home: WholePage(),
      ),
    );
  }
}
