import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ESLineChart extends StatelessWidget {
  const ESLineChart({required this.axisBorderValues, required this.spots, super.key});

  final List<double> axisBorderValues;
  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(
                show: true,
                //border: Border(right: BorderSide(width: 2)),
                border: const Border(left: BorderSide(), bottom: BorderSide()),
              ),
              gridData: const FlGridData(drawHorizontalLine: true),
              minX: axisBorderValues[0],
              maxX: axisBorderValues[1],
              minY: axisBorderValues[2],
              maxY: axisBorderValues[3],
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
                  //belowBarData: BarAreaData(show: false),
                  spots: spots,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomTitlesLine(double value, TitleMeta meta) {
    final titles = <String>['0', 'Prep1', 'Prep2', 'Txt1', 'Txt2', 'Viz1', 'Viz2'];

    final Widget text = Text(titles[value.toInt()]);

    return SideTitleWidget(
      space: 16.0,
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
