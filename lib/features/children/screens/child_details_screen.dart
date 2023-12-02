import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/bloc/child_details_cubit.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ChildDetailsScreen extends StatelessWidget {
  const ChildDetailsScreen({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildDetailsCubit>(
      create: (_) => GetIt.I.get<ChildDetailsCubit>(param1: child),
      child: const _ChildDetailsView(),
    );
  }
}

class _ChildDetailsView extends StatelessWidget {
  const _ChildDetailsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildDetailsCubit, ChildDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(state.child.fullName), centerTitle: true),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  color: state.child.isGenderMale
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.child.fullName),
                        Text(state.child.diagnosis),
                        Text(state.child.age.toString()),
                        Text('parent id: ${state.child.parentId}'),
                      ],
                    ),
                  ),
                ),
              ),

/*
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.pink,
                    title: Text(state.activityRecords?[index].timeOfActivity.toString() ?? 'null'),
                    onTap: () => context.goNamed(
                      EmotionStationRoutes.completedActivityDetails.routeName,
                      extra: ChildRouteData(
                        child: null,
                        activityRecord: state.activityRecords?[index],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemCount: state.activityRecords?.length ?? 0,
              ),
*/
            ],
          ),
        );
      },
    );
  }
}
