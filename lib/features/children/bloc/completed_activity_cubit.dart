import 'dart:math';

import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fl_chart/fl_chart.dart';

part 'completed_activity_state.dart';

@Injectable()
class CompletedActivityCubit extends Cubit<CompletedActivityState> {
  CompletedActivityCubit({@factoryParam required ActivityRecord activityRecord})
      : super(CompletedActivityState(activityRecord: activityRecord)) {
    _mapActivityToChartData(activityRecord: activityRecord);
  }

  int bottomTitlesIndex = 0;

  void _mapActivityToChartData({required ActivityRecord activityRecord}) {
    final barGroupRecognition = _makeGroupData(
      x: 0,
      y1: activityRecord.recognitionAnswer1.toDouble(),
      y2: activityRecord.recognitionAnswer2.toDouble(),
    );
    final barGroupTextualUnderstanding = _makeGroupData(
      x: 1,
      y1: activityRecord.understandingTextualAnswer1.toDouble(),
      y2: activityRecord.understandingTextualAnswer2.toDouble(),
    );
    final barGroupVisualUnderstanding = _makeGroupData(
      x: 2,
      y1: activityRecord.understandingVisualAnswer1.toDouble(),
      y2: activityRecord.understandingVisualAnswer2.toDouble(),
    );

    final chartItems = [
      barGroupRecognition,
      barGroupTextualUnderstanding,
      barGroupVisualUnderstanding,
    ];

    emit(state.copyWith(homeFirstChartBarGroups: chartItems));
  }

  BarChartGroupData _makeGroupData({required int x, required double y1, required double y2}) {
    return BarChartGroupData(
      barsSpace: 4,
      x: 0,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: y1 == 19.0
              ? Colors.greenAccent
              : y1 == 10.0
                  ? Colors.orangeAccent
                  : Colors.redAccent,
          width: 7,
        ),
        BarChartRodData(
          toY: y2,
          color: y2 == 19.0
              ? Colors.greenAccent
              : y2 == 10.0
                  ? Colors.orangeAccent
                  : Colors.redAccent,
          width: 7,
        ),
      ],
    );
  }
}
