import 'package:emotion_station/authentication_flow/bloc/authenticated_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmotionStationMainLayout extends StatelessWidget {
  const EmotionStationMainLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticatedCubit>(
      create: (_) => Injector.locateService<AuthenticatedCubit>(),
      child: EmotionStationAuthentication(child: child),
    );
  }
}

class EmotionStationAuthentication extends StatelessWidget {
  const EmotionStationAuthentication({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticatedCubit, BaseAuthenticatedState>(
      listenWhen: (previous, current) => !current.isAuthenticated,
      listener: (context, state) => context.goNamed(EmotionStationRoutes.loginScreen.path),
      child: child,
    );
  }
}
