// Flutter imports:
import 'package:emotion_station/features/parent/parent.dart';
import 'package:emotion_station/features/specialist/parents_overview/screens/screens.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/screens/screens.dart';
//import 'package:emotion_station/features/home/screens/screens.dart';
import 'package:emotion_station/features/common/children/screens/screens.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:emotion_station/features/common/info/info.dart';

abstract class IRouter {
  GoRouter get router;
}

@Singleton(as: IRouter)
class EmotionStationRouter extends IRouter {
  EmotionStationRouter({required this.authenticationManager});

  final IAuthenticationManager authenticationManager;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKeyParent = GlobalKey<NavigatorState>();
  final _shellNavigatorKeySpecialist = GlobalKey<NavigatorState>();

  @override
  GoRouter get router => _router;

  late final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: authenticationManager.getCurrentUser().isSpecialist
        ? EmotionStationRoutes.parentsOverviewScreen.path
        : EmotionStationRoutes.stationActivityScreen.path,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return EmotionStationMainLayout(
            authenticationManager: authenticationManager,
            navigationShell: navigationShell,
          );
        },
        branches: [
          authenticationManager.getCurrentUser().isSpecialist
              ? StatefulShellBranch(
                  navigatorKey: _shellNavigatorKeySpecialist,
                  routes: [
                    GoRoute(
                      name: EmotionStationRoutes.parentsOverviewScreen.routeName,
                      path: EmotionStationRoutes.parentsOverviewScreen.path,
                      pageBuilder: (context, state) => const MaterialPage<void>(
                        child: ParentsOverviewScreen(),
                      ),
                    ),
                  ],
                )
              : StatefulShellBranch(
                  navigatorKey: _shellNavigatorKeyParent,
                  routes: [
                    GoRoute(
                      name: EmotionStationRoutes.stationActivityScreen.routeName,
                      path: EmotionStationRoutes.stationActivityScreen.path,
                      pageBuilder: (context, state) => const MaterialPage<void>(
                        child: StationActivityScreen(),
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
          (state.matchedLocation == EmotionStationRoutes.parentsOverviewScreen.path ||
              state.matchedLocation == EmotionStationRoutes.stationActivityScreen.path)) {
        return EmotionStationRoutes.registerScreen.path;
      }
      return null;
    },
  );
}
