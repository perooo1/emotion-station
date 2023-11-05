import 'package:fl_chart/fl_chart.dart';

class BarChartDataHolder {
  BarChartDataHolder({this.maxY = 20.0, required this.dataGroups});

  final double maxY;
  final List<BarChartGroupData>? dataGroups;
}
