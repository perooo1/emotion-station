import 'package:emotion_station/intro/screens/screens.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

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
    initialLocation: EmotionStationRoutes.introScreen.path,
    routes: [
      GoRoute(
        name: EmotionStationRoutes.introScreen.routeName,
        path: EmotionStationRoutes.introScreen.path,
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: IntroScreen(),
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
