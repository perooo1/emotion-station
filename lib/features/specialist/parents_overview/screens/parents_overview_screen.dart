// Flutter imports:
import 'package:emotion_station/features/parent/station_activity/bloc/station_activity_screen_cubit.dart';
import 'package:emotion_station/features/specialist/parents_overview/bloc/parents_overview_screen_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';

class ParentsOverviewScreen extends StatelessWidget {
  const ParentsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ParentsOverviewScreenCubit>(
      create: (_) => Injector.locateService<ParentsOverviewScreenCubit>(),
      child: const _ParentsOverviewScreenView(),
    );
  }
}

class _ParentsOverviewScreenView extends StatelessWidget {
  const _ParentsOverviewScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final parentsOverviewScreenCubit = context.read<ParentsOverviewScreenCubit>();

    return BlocBuilder<ParentsOverviewScreenCubit, ParentsOverviewScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.test_string_2),
          ),
          body: Padding(
            //beware of const
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.supervisor_account,
                    size: 75.0,
                    color: Colors.purple,
                  ),
                  const Text('This screen should only bee seen as specialist!!'),
                  Text('Current logged in user id: ${state.currentUser.id}'),
                  Text('Current logged in user email: ${state.currentUser.email}'),
                  Text('Current logged in full name: ${state.currentUser.fullName}'),
                  Text(
                      'Is current logged in user specialist : ${state.currentUser.isSpecialist.toString()}'),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              parentsOverviewScreenCubit.signSpecialistOut();
              context.goNamed(EmotionStationRoutes.loginScreen.routeName);
            },
            tooltip: l10n.test_string_2,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
