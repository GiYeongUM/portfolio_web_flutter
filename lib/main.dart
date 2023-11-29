import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/bloc/common_event.dart';
import 'core/config/config.dart';
import 'features/global/bloc/global_bloc.dart';

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
      child: BlocProvider(
        create: (context) => GlobalBloc()..add(const Initial()),
        child: BlocBuilder<GlobalBloc, GlobalState>(
          builder: (context, state) {
            return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'GiYeongUM | ${state.locale}',
                darkTheme: darkTheme,
                theme: lightTheme,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: router.setRouter,
                locale: state.locale,
                builder: (context, child) => ResponsiveBreakpoints.builder(
                      child: Builder(
                        builder: (context) {
                          return Container(
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
                                  Condition.between(start: 2160, end: 3840, value: 2160)
                                ],
                              ).value,
                              child: child!,
                            ),
                          );
                        },
                      ),
                      breakpoints: [
                        const Breakpoint(start: 0, end: 450, name: MOBILE),
                        const Breakpoint(start: 451, end: 1200, name: TABLET),
                        const Breakpoint(start: 1200, end: 1600, name: DESKTOP),
                        const Breakpoint(start: 1600, end: 2160, name: DESKTOP),
                        const Breakpoint(start: 2160, end: double.infinity, name: DESKTOP),
                      ],
                    ));
          },
        ),
      ),
    );
  }
}

class AppConfig {
  static AppConfig get to => AppConfig();
  static final List<Locale> _locales = [const Locale('ko'), const Locale('en')];

  List<Locale> get locales => _locales;

  static Future init({required VoidCallback callback}) async {
    setPathUrlStrategy();
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
