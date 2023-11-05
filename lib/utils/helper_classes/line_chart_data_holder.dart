import 'package:fl_chart/fl_chart.dart';

class LineChartDataHolder {
  const LineChartDataHolder({
    required this.fullActivityDuration,
    required this.maxAxisValues,
    required this.spots,
  });

  final Duration fullActivityDuration;
  final List<double> maxAxisValues; //[minX, maxX, minY, maxY]
  final List<FlSpot> spots;
}
