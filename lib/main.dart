import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
          builder: (context, child) => ResponsiveBreakpoints.builder(
                child: Builder(
                  builder: (context) {
                    return Stack(
                      children: [
                        MaxWidthBox(
                          maxWidth: 1920,
                          background: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  Theme.of(context).brightness == Brightness.light
                                      ? 'https://images.unsplash.com/photo-1502175353174-a7a70e73b362?auto=format&fit=crop&q=80&w=4219&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                                      : 'https://images.unsplash.com/photo-1438401171849-74ac270044ee?auto=format&fit=crop&q=80&w=5125&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                                  Condition.equals(name: TABLET, value: 800),
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

  static Future init({required VoidCallback callback}) async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    callback();
  }
}
