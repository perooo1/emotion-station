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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ESBarChart(
          barGroups: cubit.state.overviewBarChartData?.dataGroups,
          maxY: 40.0,
          isGeneralOverview: true,
        )
      ],
    );
  }
}
