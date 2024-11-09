import 'package:emotion_station/l10n/generated/l10n.dart';
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
    this.isGeneralOverview = false,
  });

  final bool isShowingDurationData;
  final bool isObservationCategoryChart;
  final bool isGeneralOverview;
  final String? yAxisName;
  final List<BarChartGroupData>? barGroups;
  final double maxY;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            if (isGeneralOverview)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.childDetailsScreenEmotionRecognition)
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.childDetailsScreenEmotionTextualUnderstanding)
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.childDetailsScreenEmotionVisualUnderstanding)
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            AspectRatio(
              aspectRatio: 1,
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
                            sideTitles: const SideTitles(
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
          ],
        ),
      ),
    );
  }

  Widget _bottomTitlesObservationCategoryChart(double value, TitleMeta meta) {
    final titles = <String>[
      'Pitanje 1',
      'Pitanje 2',
    ];

    final Widget text = Text(titles[value.toInt()]);
    return SideTitleWidget(
      space: 16.0,
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget _bottomTitlesOverviewChart(double value, TitleMeta meta) {
    if (isGeneralOverview == true) {
      //final titles = <String>['Happy', 'Sadness', 'Fear', 'Anger'];
      final titlesCroatian = <String>['Sreća', 'Tuga', 'Strah', 'Ljutnja'];

      final Widget text = Text(titlesCroatian[value.toInt()]);
      return SideTitleWidget(
        space: 16.0,
        axisSide: meta.axisSide,
        child: text,
      );
    } else {
      //final titles = <String>['Recognition', 'Textual', 'Visual'];
      final titlesCroatian = <String>['Prepoznavanje', 'Teskt', 'Vizualno'];

      final Widget text = Text(titlesCroatian[value.toInt()]);
      return SideTitleWidget(
        space: 16.0,
        axisSide: meta.axisSide,
        child: text,
      );
    }
  }

  Widget _leftTitlesComprehension(double value, TitleMeta meta) {
    String text;

    if (isGeneralOverview == true) {
      if (value == 0) {
        text = 'Nisko';
        //text = 'Low';
      } else if (value == 20) {
        text = 'Djelomično';
        //text = 'Partial';
      } else if (value == 39) {
        text = 'Visoko';
        //text = 'High';
      } else {
        return Container();
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 0,
        child: Text(text),
      );
    } else {
      if (value == 0) {
        text = 'Nisko';
        //text = 'Low';
      } else if (value == 10) {
        text = 'Djelomično';
        //text = 'Partial';
      } else if (value == 19) {
        text = 'Visoko';
        //text = 'High';
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
}
