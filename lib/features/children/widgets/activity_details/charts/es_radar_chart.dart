import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ESRadarChart extends StatelessWidget {
  const ESRadarChart({required this.dataSets, super.key});

  final List<RadarDataSet> dataSets;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 46),
          //padding: EdgeInsets.all(8.0),
          child: RadarChart(
            RadarChartData(
              titlePositionPercentageOffset: 0.2,
              radarBorderData: const BorderSide(color: Colors.transparent),
              borderData: FlBorderData(show: false),
              radarBackgroundColor: Colors.transparent,
              getTitle: (index, angle) {
                switch (index) {
                  case 0:
                    return RadarChartTitle(text: 'Recognition');
                  case 2:
                    return RadarChartTitle(text: 'visual');
                  case 1:
                    return RadarChartTitle(text: 'text');
                  default:
                    return const RadarChartTitle(text: '');
                }
              },
              tickCount: 1,
              ticksTextStyle: const TextStyle(color: Colors.transparent, fontSize: 10),
              tickBorderData: const BorderSide(color: Colors.transparent),
              gridBorderData: const BorderSide(width: 2),
              dataSets: dataSets,
            ),
          ),
        ),
      ),
    );
  }
}
