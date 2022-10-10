import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/before/birth_color_page.dart';
import 'package:giyeong_um_porfolio_page/before/career_widget.dart';
import 'package:giyeong_um_porfolio_page/before/theme_data.dart';
import 'package:giyeong_um_porfolio_page/before/translate.dart';
import 'package:giyeong_um_porfolio_page/before/whole_page.dart';
import 'package:giyeong_um_porfolio_page/controller/main_controller.dart';
import 'package:giyeong_um_porfolio_page/page/career_page.dart';
import 'package:giyeong_um_porfolio_page/page/home_page.dart';
import 'package:giyeong_um_porfolio_page/page/main_page.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'controller/responsive_controller.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final translateController = Get.put(TranslateController());
  final _responsiveController = Get.put(ResponsiveController());
  final mainController = Get.put(MainController());
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
              return GetPageRoute(page: () => MainPage());
            case '/showmycolor':
              return GetPageRoute(page: () => const BirthColorPage());
            case '/mainpage':
              return GetPageRoute(page: () => MainPage(), transition: Transition.noTransition
              );
            case '/careerpage':
              return GetPageRoute(page: () => CareerPage(), transition: Transition.noTransition);
            default:
              return GetPageRoute(page: () => MainPage());
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
        home: LayoutBuilder(
            builder: (context, constraints) {
              if(constraints.maxWidth < _responsiveController.mobileWidth && !kIsWeb){
                _responsiveController.platform.value = Platform.mobile;
                /// 스마트폰 앱
              } else if (constraints.maxWidth < _responsiveController.mobileWidth && kIsWeb){
                _responsiveController.platform.value = Platform.desktopMobile;
                /// 스마트폰 웹
              } else if (constraints.maxWidth < _responsiveController.desktopWidth && !kIsWeb){
                _responsiveController.platform.value = Platform.tablet;
                /// 태블릿 앱
              } else {
                _responsiveController.platform.value = Platform.desktop;
                /// 웹, 태블릿 웹
              }
              return MainPage();
            }
        ),
      ),
    );
  }
}
