import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:giyeong_um_porfolio_page/before/birth_color_page.dart';
// import 'package:giyeong_um_porfolio_page/controller/main_controller.dart';
import 'package:giyeong_um_porfolio_page/view/career_page.dart';
import 'package:giyeong_um_porfolio_page/view/dev_page.dart';
import 'package:giyeong_um_porfolio_page/view/home_page.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:giyeong_um_porfolio_page/view/project_page.dart';

// import 'before/theme_data.dart';
// import 'controller/responsive_controller.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // final translateController = Get.put(TranslateController());
  // final _responsiveController = Get.put(ResponsiveController());
  // final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (BuildContext context, child) => MaterialApp(
        initialRoute: "/",
        title: "GiYeongUm",
        onGenerateRoute: (settings) {
          print(settings.name);
          switch (settings.name) {
            case '/':
              return _createRoute(HomePage());
            case '/HomePage':
              return _createRoute(HomePage());
            case '/CareerPage':
              return _createRoute(CareerPage());
            case '/ProjectPage':
              return _createRoute(ProjectPage());
            case '/DevPage':
              return _createRoute(DevPage());
            default:
              return _createRoute(HomePage());
          }
        },
        builder: EasyLoading.init(builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context),
            child: widget!,
          );
        }),
        // theme: Themes.lightTheme,
        // darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

Route _createRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
