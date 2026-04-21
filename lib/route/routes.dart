// Created By Suresh M, 07/03/2025

import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/feature/auth/presentation/screen/login_screen.dart';
import 'package:fotocolab_admin/src/feature/calendar/presentation/screen/calendar_screen.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/screen/canvas_screen.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/screen/edit_image.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/screen/video_merge_screen.dart';
import 'package:fotocolab_admin/src/feature/canvas/presentation/screen/video_player_screen.dart';
import 'package:fotocolab_admin/src/feature/error/presentation/screen/error_screen.dart';
import 'package:fotocolab_admin/src/feature/home/presentation/screen/home_screen.dart';
import 'package:fotocolab_admin/src/feature/profile/presentation/screen/profile_screen.dart';
import 'package:fotocolab_admin/src/feature/splash/presentation/splash_screen.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/screen/create_subscription_screen.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/screen/edit_subscription_screen.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/screen/subscription_screen.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/screen/create_category_screen.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/screen/upload_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

    GoRoute(
      path: RouteName.error,
      builder: (context, state) => const ErrorScreen(),
    ),

    GoRoute(
      path: RouteName.login,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(path: RouteName.home, builder: (context, state) => HomeScreen()),

    GoRoute(
      path: RouteName.profile,
      builder: (context, state) => ProfileScreen(),
    ),

    GoRoute(
      path: RouteName.upload,
      builder: (context, state) => UploadScreen(),
    ),

    GoRoute(
      path: RouteName.subscription,
      builder: (context, state) => SubscriptionScreen(),
    ),

    GoRoute(
      path: RouteName.createSubscription,
      builder: (context, state) => CreateSubscriptionScreen(),
    ),

    GoRoute(
      path: RouteName.editSubscription,
      builder: (context, state) =>
          EditSubscriptionScreen(routeArgs: state.extra),
    ),

    GoRoute(
      path: RouteName.createCategory,
      builder: (context, state) => CreateCategoryScreen(routeArgs: state.extra),
    ),

    GoRoute(
      path: RouteName.calendar,
      builder: (context, state) => CalendarScreen(),
    ),

    GoRoute(
      path: RouteName.canvas,
      builder: (context, state) => CanvasScreen(),
    ),
    GoRoute(
      path: RouteName.editImage,
      builder: (context, state) => EditImage(routeArgs: state.extra),
    ),

    GoRoute(
      path: RouteName.videoMerge,
      builder: (context, state) => VideoMergeScreen(),
    ),
    
    GoRoute(
      path: RouteName.videoPlayer,
      builder: (context, state) => VideoPlayerScreen(routeArgs: state.extra),
    ),
  ],
);
