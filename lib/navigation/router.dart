// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:emotion_station/login_flow/screens/screens.dart';
import 'package:emotion_station/navigation/navigation.dart';

abstract class IRouter {
  GoRouter get router;
}

@Singleton(as: IRouter)
class EmotionStationRouter extends IRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  GoRouter get router => _router;

  late final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: EmotionStationRoutes.loginScreen.path,
    routes: [
      GoRoute(
        name: EmotionStationRoutes.loginScreen.routeName,
        path: EmotionStationRoutes.loginScreen.path,
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        name: EmotionStationRoutes.registerScreen.routeName,
        path: EmotionStationRoutes.registerScreen.path,
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        name: EmotionStationRoutes.homeScreen.routeName,
        path: EmotionStationRoutes.homeScreen.path,
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: HomeScreen(),
        ),
      ),
/*
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Padding(padding: EdgeInsets.zero);
        },
        routes: [
          GoRoute(
            name: EmotionStationRoutes.introScreen.routeName,
            path: EmotionStationRoutes.introScreen.path,
            pageBuilder: (context, state) => const MaterialPage<void>(
              child: IntroScreen(),
            ),
          ),
        ],
      ),
*/
    ],
  );
}
