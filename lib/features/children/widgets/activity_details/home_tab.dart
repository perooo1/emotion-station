import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompletedActivityCubit>();

    return SingleChildScrollView(
      child: Padding(
        //padding: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 16.0,
          bottom: 75.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeTabBarChart(
              maxY: cubit.state.homeTabBarChartData?.maxY ?? 20.0,
              barGroups: cubit.state.homeTabBarChartData?.dataGroups,
            ),
            const SizedBox(height: 12.0),
            HomeTabLineChart(
              axisBorderValues: cubit.state.homeTabLineChartData?.maxAxisValues ?? [],
              spots: cubit.state.homeTabLineChartData?.spots ?? [],
            ),
            const SizedBox(height: 12.0),
            HomeTabRadarChart(dataSets: cubit.state.homeTabRadarChartData?.radarDataset ?? []),
          ],
        ),
      ),
    );
  }
}
