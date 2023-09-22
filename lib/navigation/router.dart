// Flutter imports:
import 'package:emotion_station/authentication_flow/screens/emotion_station_main_layout.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/screens/screens.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:repository/repository.dart';

abstract class IRouter {
  GoRouter get router;
}

@Singleton(as: IRouter)
class EmotionStationRouter extends IRouter {
  EmotionStationRouter({required this.authenticationRepository});

  final IAuthenticationRepository authenticationRepository;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  GoRouter get router => _router;

  late final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: EmotionStationRoutes.loginScreen.path,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => EmotionStationMainLayout(child: child),
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
        ],
      )

      /*
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
*/
    ],
    redirect: (context, state) async {
      final isUserAuthenticated = authenticationRepository.isUserAuthenticated;
      //final isUserAuthenticated = authenticationRepository.isUserAuthenticated; potencijalan problem, možda drugačije provjera user.first.id ili nesta

      if (!isUserAuthenticated) {
        return EmotionStationRoutes.loginScreen.path;
      }
      return null;
    },
  );
}
