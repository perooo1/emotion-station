import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ESBarChart extends StatelessWidget {
  const ESBarChart({
    required this.barGroups,
    this.yAxisName,
    this.isObservationCategoryChart = false,
    this.isShowingDurationData = false,
    required this.maxY,
    super.key,
  });

  final bool isShowingDurationData;
  final bool isObservationCategoryChart;
  final String? yAxisName;
  final List<BarChartGroupData>? barGroups;
  final double maxY;

  @override
  Widget build(BuildContext context) {
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
                    getTitlesWidget: isObservationCategoryChart
                        ? _bottomTitlesObservationCategoryChart
                        : _bottomTitlesOverviewChart,
                  ),
                ),
                leftTitles: isShowingDurationData
                    ? AxisTitles(
                        axisNameWidget: Text(yAxisName ?? ''),
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 45,
                        ),
                      )
                    : AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 45,
                          getTitlesWidget: _leftTitlesComprehension,
                        ),
                      ),
              ),
              barGroups: barGroups,
              gridData: isShowingDurationData
                  ? const FlGridData(drawHorizontalLine: true)
                  : const FlGridData(show: false),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomTitlesObservationCategoryChart(double value, TitleMeta meta) {
    final titles = <String>[
      'Question 1',
      'Question 2',
    ];

    final Widget text = Text(titles[value.toInt()]);
    return SideTitleWidget(
      space: 16.0,
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget _bottomTitlesOverviewChart(double value, TitleMeta meta) {
    final titles = <String>['Recognition', 'Textual', 'Visual'];

    final Widget text = Text(titles[value.toInt()]);
    return SideTitleWidget(
      space: 16.0,
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget _leftTitlesComprehension(double value, TitleMeta meta) {
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
