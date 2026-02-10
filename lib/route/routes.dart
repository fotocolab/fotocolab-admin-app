// Created By Suresh M, 07/03/2025

import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/src/feature/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

    // GoRoute(
    //   path: RouteName.intro,
    //   builder: (context, state) => const IntroScreen(),
    // ),

    // GoRoute(
    //   path: RouteName.login,
    //   builder: (context, state) => LoginScreen(routeArgs: state.extra),
    // ),
  ],
);
