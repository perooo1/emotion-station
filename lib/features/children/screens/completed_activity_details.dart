import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CompletedActivityDetails extends StatelessWidget {
  const CompletedActivityDetails({super.key, required this.activityRecord});

  final ActivityRecord activityRecord;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompletedActivityCubit>(
      create: (_) => GetIt.I.get<CompletedActivityCubit>(param1: activityRecord),
      child: const _CompletedActivityDetailsView(),
    );
  }
}

class _CompletedActivityDetailsView extends StatelessWidget {
  const _CompletedActivityDetailsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedActivityCubit, CompletedActivityState>(
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(state.activityRecord.emotionStation.stationName),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Home',
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    text: 'Reckognition',
                    icon: Icon(Icons.visibility),
                  ),
                  Tab(
                    text: 'Understanding',
                    icon: Icon(Icons.psychology),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(child: Text('Home')),
                Center(child: Text('reckognition')),
                EmotionUnderstanding(),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.edit),
              label: Text('Add note'),
            ),
          ),
        );

/*
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Text('This is activity details'),
                Text('Record: ${state.activityRecord.timeOfActivity.toString()}'),
              ],
            ),
          ),
        );
*/
      },
    );

/*
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('This is activity details'),
            Text('Record: ${activityRecord.timeOfActivity.toString()}'),
          ],
        ),
      ),
    );
*/
  }
}