// Flutter imports:
import 'package:emotion_station/features/children/screens/screens.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/screens/screens.dart';
import 'package:emotion_station/features/home/screens/screens.dart';
import 'package:emotion_station/features/info/screens/screens.dart';
import 'package:emotion_station/navigation/navigation.dart';

abstract class IRouter {
  GoRouter get router;
}

@Singleton(as: IRouter)
class EmotionStationRouter extends IRouter {
  EmotionStationRouter({required this.authenticationManager});

  final IAuthenticationManager authenticationManager;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  GoRouter get router => _router;

  late final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: EmotionStationRoutes.homeScreen.path,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return EmotionStationMainLayout(
            authenticationManager: authenticationManager,
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                name: EmotionStationRoutes.homeScreen.routeName,
                path: EmotionStationRoutes.homeScreen.path,
                pageBuilder: (context, state) => const MaterialPage<void>(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: EmotionStationRoutes.childrenScreen.routeName,
                path: EmotionStationRoutes.childrenScreen.path,
                pageBuilder: (context, state) => const MaterialPage<void>(
                  child: ChildrenScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: EmotionStationRoutes.infoScreen.routeName,
                path: EmotionStationRoutes.infoScreen.path,
                pageBuilder: (context, state) => const MaterialPage<void>(
                  child: InfoScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
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
    ],
    redirect: (context, state) async {
      final isUserAuthenticated = authenticationManager.isAuthenticated;

      if (isUserAuthenticated == false &&
          state.matchedLocation == EmotionStationRoutes.homeScreen.path) {
        return EmotionStationRoutes.registerScreen.path;
      }
      return null;
    },
  );
}
