import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabBarChart extends StatelessWidget {
  const HomeTabBarChart({required this.maxY, required this.barGroups, super.key});

  final double maxY;
  final List<BarChartGroupData>? barGroups;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompletedActivityCubit>();

    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: BarChart(
            BarChartData(
              maxY: maxY,
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 42,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return _bottomTitles(value, meta, cubit);
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    reservedSize: 45,
                    getTitlesWidget: _leftTitles,
                  ),
                ),
              ),
              //barGroups: cubit.state.homeFirstChartBarGroups,
              barGroups: barGroups,
              //barGroups: cubit.state.homeTabBarChartData?.dataGroups,
              gridData: const FlGridData(show: false),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta, CompletedActivityCubit cubit) {
    final titles = <String>['Recognition', 'Textual', 'Visual'];

    final Widget text = Text(titles[cubit.bottomTitlesIndex]);
    if (cubit.bottomTitlesIndex == 2) {
      cubit.bottomTitlesIndex = 0;
    }
    cubit.bottomTitlesIndex += 1;
    return SideTitleWidget(
      space: 16.0,
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget _leftTitles(double value, TitleMeta meta) {
    String text;

    if (value == 0) {
      text = 'Low';
    } else if (value == 10) {
      text = 'Partial';
    } else if (value == 19) {
      text = 'High';
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text),
    );
  }
}
