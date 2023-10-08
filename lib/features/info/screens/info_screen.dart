// Flutter imports:
import 'package:emotion_station/features/info/bloc/info_screen_cubit.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InfoScreenCubit>(
      create: (_) => Injector.locateService<InfoScreenCubit>(),
      child: const _InfoScreenView(),
    );
  }
}

class _InfoScreenView extends StatelessWidget {
  const _InfoScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final infoScreenCubit = context.read<InfoScreenCubit>();

    return BlocBuilder<InfoScreenCubit, InfoScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('this is a info screen'),
          ),
          body: Padding(
            //beware of const
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Text('current user full name: ${state.currentUser.fullName}'),
                  Text('current user email: ${state.currentUser.email}'),
                  Text(
                      ' is current user specialist? ${state.currentUser.isSpecialist.toString()} '),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: l10n.test_string_2,
            child: const Icon(Icons.logout),
            onPressed: () {
              infoScreenCubit.authenticationManager.signOut();
              context.goNamed(EmotionStationRoutes.loginScreen.routeName);
            },
          ),
        );
      },
    );
  }
}
