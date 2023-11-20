import 'dart:ui';

import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/bloc/home_cubit.dart';
import 'package:emotion_station/features/home/widgets/widgets.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ParentTestWidget extends StatelessWidget {
  const ParentTestWidget({
    required this.parent,
    super.key,
  });

  final Parent parent;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Emotion Station'),
        //title: Text(l10n.test_string_2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  height: 200,
                  width: 200,
                  'assets/images/home_screen_hero.png',
                ),
                const SizedBox(height: 16.0),
                Text('Select a child for activity'),
                const SizedBox(height: 16.0),
                DropdownMenu<Child>(
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.outlineVariant,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),
                  initialSelection: cubit.state.selectedChild,
                  onSelected: (value) {
                    cubit.onChildSelected(value!);
                  },
                  dropdownMenuEntries: cubit.state.children?.map<DropdownMenuEntry<Child>>(
                        (Child value) {
                          return DropdownMenuEntry<Child>(value: value, label: value.name);
                        },
                      ).toList() ??
                      List.empty(),
                ),
                const SizedBox(height: 16.0),
                StationStartButton(
                  fillColor: Colors.yellow.shade100,
                  borderColor: Colors.yellow,
                  borderRadius: 12,
                  title: l10n.station_of_happiness,
                  onAction: () {
                    context.goNamed(
                      EmotionStationRoutes.activityScreen.routeName,
                      pathParameters: {
                        ActivityRouteParameters.childId: cubit.state.selectedChild!.id
                      },
                      queryParameters: {
                        ActivityRouteParameters.activityType: ActivityType.stationOfHappiness.name
                      },
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                StationStartButton(
                  fillColor: Theme.of(context).colorScheme.secondaryContainer,
                  borderColor: Theme.of(context).colorScheme.secondary,
                  borderRadius: 12,
                  title: l10n.station_of_sadness,
                  onAction: () {
                    context.goNamed(
                      EmotionStationRoutes.activityScreen.routeName,
                      pathParameters: {
                        ActivityRouteParameters.childId: cubit.state.selectedChild!.id
                      },
                      queryParameters: {
                        ActivityRouteParameters.activityType: ActivityType.stationOfSadness.name
                      },
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                StationStartButton(
                  fillColor: Theme.of(context).colorScheme.tertiaryContainer,
                  borderColor: Theme.of(context).colorScheme.tertiary,
                  borderRadius: 12,
                  title: l10n.station_of_fear,
                  onAction: () {
                    context.goNamed(
                      EmotionStationRoutes.activityScreen.routeName,
                      pathParameters: {
                        ActivityRouteParameters.childId: cubit.state.selectedChild!.id
                      },
                      queryParameters: {
                        ActivityRouteParameters.activityType: ActivityType.stationOfSadness.name
                      },
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                StationStartButton(
                  fillColor: Theme.of(context).colorScheme.errorContainer,
                  borderColor: Theme.of(context).colorScheme.error,
                  borderRadius: 12,
                  title: l10n.station_of_anger,
                  onAction: () {
                    context.goNamed(
                      EmotionStationRoutes.activityScreen.routeName,
                      pathParameters: {
                        ActivityRouteParameters.childId: cubit.state.selectedChild!.id
                      },
                      queryParameters: {
                        ActivityRouteParameters.activityType: ActivityType.stationOfSadness.name
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
