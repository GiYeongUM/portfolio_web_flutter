import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/before/birth_color_page.dart';
import 'package:giyeong_um_porfolio_page/controller/main_controller.dart';
import 'package:giyeong_um_porfolio_page/view/career_page.dart';
import 'package:giyeong_um_porfolio_page/view/dev_page.dart';
import 'package:giyeong_um_porfolio_page/view/home_page.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:giyeong_um_porfolio_page/view/project_page.dart';

import 'before/theme_data.dart';
import 'controller/responsive_controller.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // final translateController = Get.put(TranslateController());
  final _responsiveController = Get.put(ResponsiveController());
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (BuildContext context, child) => GetMaterialApp(
        initialRoute: "/",
        title: "GiYeongUm",
        onGenerateRoute: (settings) {
          print(settings.name);
          switch (settings.name) {
            case '/':
              return GetPageRoute(page: () => HomePage(), transition: Transition.noTransition);
            case '/showmycolor':
              return GetPageRoute(page: () => const BirthColorPage());
            case '/HomePage':
              return GetPageRoute(page: () => HomePage(), transition: Transition.noTransition);
            case '/CareerPage':
              return GetPageRoute(page: () => CareerPage(), transition: Transition.noTransition);
            case '/ProjectPage':
              return GetPageRoute(page: () => ProjectPage(), transition: Transition.noTransition);
            case '/DevPage':
              return GetPageRoute(page: () => DevPage(), transition: Transition.noTransition);
            default:
              return GetPageRoute(page: () => HomePage());
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
        home: HomePage(),
      ),
    );
  }
}
