import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/bloc/home_cubit.dart';
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
        title: Text(l10n.test_string_2),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.train,
                size: 75.0,
                color: Colors.amber,
              ),
              Text('tihs should only bee seen by parent'),
              Text('is current user parent? ${parent.isParent.toString()}'),
              const SizedBox(height: 16.0),
              DropdownMenu<Child>(
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
              ElevatedButton(
                child: Text('Station of happiness test'),
                onPressed: () {
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
              ElevatedButton(
                child: Text('Station of sadness test'),
                onPressed: () {
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

/*
              Text('This is a home widget when logged in'),
              Text('Current logged in user id: ${state.currentUser.id}'),
              Text('Current logged in user email: ${state.currentUser.email}'),
              Text('Current logged in full name: ${state.currentUser.fullName}'),
              Text(
                  'Current logged in user specialist from user obj? : ${state.currentUser.isSpecialist.toString()}'),
*/
            ],
          ),
        ),
      ),
    );
  }
}
