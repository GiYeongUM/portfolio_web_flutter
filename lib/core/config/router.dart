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
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(animation),
                child: child,
              );
            },
            child: const EntrancePage(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'intro',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: child,
                  );
                },
                child: const IntroPage(),
              );
            },
          ),
          GoRoute(
            path: 'strength/:id',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: child,
                  );
                },
                child: StrengthPage(index: int.parse(state.pathParameters['id'] ?? '0')),
              );
            },
          ),
        ],
      ),
    ],
  );
}
