import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/config.dart';

final router = AppRouter();

main() {
  AppConfig.init(
    callback: () {
      runApp(const App());
      return;
    },
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: '엄기영 | 포트폴리오',
          darkTheme: darkTheme,
          theme: lightTheme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          locale: const Locale('ko', 'KR'),
          routerConfig: router.setRouter,
          builder: (context, child) => ResponsiveBreakpoints.builder(
                child: Builder(
                  builder: (context) {
                    return MaxWidthBox(
                      maxWidth: 1200,
                      background: Container(color: const Color(0xFFF5F5F5)),
                      child: ResponsiveScaledBox(
                        width: ResponsiveValue<double>(
                          context,
                          conditionalValues: [
                            Condition.equals(name: MOBILE, value: 450),
                            Condition.between(start: 800, end: 1100, value: 800),
                            Condition.between(start: 1000, end: 1200, value: 1000),
                          ],
                        ).value,
                        child: child!,
                      ),
                    );
                  },
                ),
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              )),
    );
  }
}

class AppConfig {
  static AppConfig get to => AppConfig();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static late final SharedPreferences _shared;

  FlutterSecureStorage get storage => _storage;

  SharedPreferences get shared => _shared;

  static Future init({required VoidCallback callback}) async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _shared = await SharedPreferences.getInstance();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    await _shared.setString('app_version', packageInfo.version);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    callback();
  }
}
