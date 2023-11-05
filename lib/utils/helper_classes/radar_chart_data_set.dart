import 'package:flutter/material.dart';

class RadarChartDataSet {
  RadarChartDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
