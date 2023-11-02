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
                    return Stack(
                      children: [
                        MaxWidthBox(
                          maxWidth: 1600,
                          background: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  Theme.of(context).brightness == Brightness.light
                                      ? 'https://fastly.picsum.photos/id/430/5000/3333.jpg?hmac=IC4pC3JAgYu4spZL_e7jJ2XIOoPuBM1dIqetwsYKgAE'
                                      : 'https://fastly.picsum.photos/id/681/5000/2951.jpg?hmac=01BxiMvFITUx4h3xM_x0IUp2w5KyQHzUd1AVxm8FKG0',
                                ),
                                fit: BoxFit.cover,
                                opacity: 0.8,
                              ),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 8,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ResponsiveScaledBox(
                              width: ResponsiveValue<double>(
                                context,
                                conditionalValues: [
                                  Condition.equals(name: MOBILE, value: 450),
                                  Condition.equals(name: TABLET, value: 1200),
                                  // Condition.between(start: 1200, end: 1600, value: 1200),
                                  Condition.largerThan(name: DESKTOP, value: 1600),
                                ],
                              ).value,
                              child: child!,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 32,
                          bottom: 32,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: ResponsiveBreakpoints.of(context).isDesktop ? 1 : 0,
                            child: const Material(child: Text('Contents')),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 1200, name: TABLET),
                  const Breakpoint(start: 1200, end: 1600, name: DESKTOP),
                  const Breakpoint(start: 1600, end: double.infinity, name: DESKTOP),
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
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
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
