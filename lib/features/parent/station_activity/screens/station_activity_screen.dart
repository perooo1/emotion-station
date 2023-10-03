// Flutter imports:
import 'package:emotion_station/features/parent/station_activity/bloc/station_activity_screen_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';

class StationActivityScreen extends StatelessWidget {
  const StationActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StationActivityScreenCubit>(
      create: (_) => Injector.locateService<StationActivityScreenCubit>(),
      child: const _StationActivityScreenView(),
    );
  }
}

class _StationActivityScreenView extends StatelessWidget {
  const _StationActivityScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final stationActivityScreenCubit = context.read<StationActivityScreenCubit>();

    return BlocBuilder<StationActivityScreenCubit, StationActivityScreenState>(
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
                    Icons.train,
                    size: 75.0,
                    color: Colors.amber,
                  ),
                  const Text('This screen should only bee seen as parent!!'),
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
              stationActivityScreenCubit.signParentOut();
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
