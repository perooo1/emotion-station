import 'package:emotion_station/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';

class RadarChartDataHolder {
  RadarChartDataHolder({required this.rawData, required this.radarDataset});

  final List<RadarChartDataSet> rawData;
  final List<RadarDataSet> radarDataset;
}
