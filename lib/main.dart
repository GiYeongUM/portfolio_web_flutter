import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'common/binding.dart';

main() {
  AppConfig.init(
    () {
      if (kIsWeb && (defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows)) {
        runApp(DesktopWeb());
      } else {
        runApp(Web());
      }
    },
  );
}

class Web extends StatelessWidget {
  Web({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'GiYeongUM',
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
            routerConfig: _router.setRouter,
            builder: (context, child) {
              ErrorWidget.builder = (errorData) {
                Widget error = Text('$errorData');
                if (child is Scaffold || child is Navigator) {
                  error = Scaffold(body: SafeArea(child: error));
                }
                return error;
              };
              return ResponsiveWrapper.builder(child,
                  maxWidth: (defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows) ? 720 : null,
                  minWidth: 428,
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.resize(480, name: MOBILE),
                    const ResponsiveBreakpoint.resize(800, name: TABLET),
                  ],
                  background: Container(color: const Color(0xFFF5F5F5)));
            }),
      ),
    );
  }
}

class DesktopWeb extends StatelessWidget {
  DesktopWeb({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'GiYeongUM',
          darkTheme: lightTheme,
          theme: lightTheme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          locale: const Locale('ko', 'KR'),
          themeMode: ThemeMode.system,
          routerConfig: _router.setDesktopRouter,
          builder: (context, child) => ResponsiveWrapper.builder(child,
              defaultScale: true,
              minWidth: 0,
              breakpoints: [
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP, scaleFactor: 1.0),
                const ResponsiveBreakpoint.autoScale(600, name: TABLET, scaleFactor: 0.5),
                const ResponsiveBreakpoint.autoScale(480, name: MOBILE, scaleFactor: 0.4),
                const ResponsiveBreakpoint.autoScale(428, name: MOBILE, scaleFactor: 0.35),
                const ResponsiveBreakpoint.autoScaleDown(240, name: MOBILE, scaleFactor: 0.2),
                const ResponsiveBreakpoint.autoScaleDown(10, name: MOBILE, scaleFactor: 0.1),
              ],
              background: Container(color: const Color(0xFFF5F5F5))),
        ),
      ),
    );
  }
}

class AppConfig {
  static AppConfig get to => AppConfig();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  static late final SharedPreferences _shared;

  FlutterSecureStorage get storage => _storage;

  SharedPreferences get shared => _shared;

  DeviceInfoPlugin get deviceInfoPlugin => _deviceInfoPlugin;

  static Future init(VoidCallback callback) async {
    WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    await _shared.setString('app_version', packageInfo.version);
    callback();
  }
}
