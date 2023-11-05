import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            AspectRatio(
              aspectRatio: 1,
              child: Card(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(
                        show: true,
                        //border: Border(right: BorderSide(width: 2)),
                        border: Border(left: BorderSide(), bottom: BorderSide()),
                      ),
                      gridData: const FlGridData(drawHorizontalLine: true),
                      minX: cubit.state.lineChartDataHolder?.maxAxisValues[0],
                      maxX: cubit.state.lineChartDataHolder?.maxAxisValues[1],
                      minY: cubit.state.lineChartDataHolder?.maxAxisValues[2],
                      maxY: cubit.state.lineChartDataHolder?.maxAxisValues[3],
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          axisNameWidget: Text('Vrijeme [s]'),
                          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                        ),
                        bottomTitles: AxisTitles(
                          axisNameWidget: Text('Redni broj i vrsta pitanja'),
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 42,
                            interval: 1,
                            getTitlesWidget: _bottomTitlesLine,
                          ),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          color: Theme.of(context).colorScheme.primary,
                          barWidth: 8,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                          spots: cubit.state.lineChartDataHolder?.spots ?? [],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            AspectRatio(
              aspectRatio: 1,
              child: Card(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 20.0,
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
                      barGroups: cubit.state.homeFirstChartBarGroups,
                      gridData: const FlGridData(show: false),
                    ),
                  ),
                ),
              ),
            ),
          ],
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

  Widget _bottomTitlesLine(double value, TitleMeta meta) {
    final titles = <String>['0', 'R1', 'R2', 'T1', 'T2', 'V1', 'V2'];

    final Widget text = Text(titles[value.toInt()]);

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
