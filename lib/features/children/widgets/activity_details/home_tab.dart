import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompletedActivityCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
          ],
        ),
      ),
    );
  }
}
