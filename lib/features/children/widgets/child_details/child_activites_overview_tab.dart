import 'package:emotion_station/features/children/bloc/child_details_cubit.dart';
import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildActivitesOverviewTab extends StatelessWidget {
  const ChildActivitesOverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChildDetailsCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 16.0,
          bottom: 75.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ESRadarChart(
              dataSets: cubit.state.overviewRadarChartData?.radarDataset ?? [],
            ),
            ESBarChart(
              barGroups: cubit.state.overviewBarChartData?.dataGroups,
              maxY: 40.0,
              isGeneralOverview: true,
            ),
          ],
        ),
      ),
    );
  }
}
