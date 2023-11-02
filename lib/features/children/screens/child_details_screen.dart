import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/bloc/child_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
  const _ChildDetailsView({super.key});

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
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.pink,
                    //title: Text(state.activityRecords?[index].emotionStation.stationName ?? 'Null' ),
                    title: Text(state.activityRecords?[index].timeOfActivity.toString() ?? 'null'),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemCount: state.activityRecords?.length ?? 0,
              ),
            ],
          ),
        );
      },
    );
/*
    return Scaffold(
      appBar: AppBar(title: Text(child.fullName), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Card(
              color: child.isGenderMale
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.tertiaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(child.fullName),
                    Text(child.diagnosis),
                    Text(child.age.toString()),
                    Text('parent id: ${child.parentId}'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
    */
  }
}
