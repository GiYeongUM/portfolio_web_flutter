import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/features.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter setRouter = GoRouter(
    errorBuilder: (context, state) {
      return const ErrorPage();
    },
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const MainPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'intro',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: IntroPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
