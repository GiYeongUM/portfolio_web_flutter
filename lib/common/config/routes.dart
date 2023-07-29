import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter setRouter = GoRouter(
    // errorBuilder: (context, state) {
    //   return const ErrorPage();
    // },
    // initialLocation: '/',
    routes: [],
  );

  final GoRouter setDesktopRouter = GoRouter(
    // errorBuilder: (context, state) => const ErrorPage(),
    initialLocation: '/',
    routes: [],
  );
}
