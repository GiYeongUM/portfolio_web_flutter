import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
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
        routerConfig: router.setRouter,
        builder: (context, child) => ResponsiveWrapper.builder(child,
            minWidth: 428,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.resize(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: white2)),
      ),
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
    callback();
  }
}
