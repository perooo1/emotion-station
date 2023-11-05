import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/utils/utils.dart';
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
    _mapActivityToBarChart(activityRecord: activityRecord);
    _mapActivityToLineChart(activityRecord: activityRecord);
  }

  int bottomTitlesIndex = 0;

  void _mapActivityToBarChart({required ActivityRecord activityRecord}) {
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

  void _mapActivityToLineChart({required ActivityRecord activityRecord}) {
    final activityFullDuration = activityRecord.recognitionAnswer1Duration +
        activityRecord.recognitionAnswer2Duration +
        activityRecord.understandingTextualAnswer1Duration +
        activityRecord.understandingTextualAnswer2Duration +
        activityRecord.understandingVisualAnswer1Duration +
        activityRecord.understandingVisualAnswer2Duration;

    final durations = [
      activityRecord.recognitionAnswer1Duration.inSeconds.toDouble(),
      activityRecord.recognitionAnswer2Duration.inSeconds.toDouble(),
      activityRecord.understandingTextualAnswer1Duration.inSeconds.toDouble(),
      activityRecord.understandingTextualAnswer2Duration.inSeconds.toDouble(),
      activityRecord.understandingVisualAnswer1Duration.inSeconds.toDouble(),
      activityRecord.understandingVisualAnswer2Duration.inSeconds.toDouble(),
    ];

    final maxY = durations.reduce(
      (currentMax, element) => element > currentMax ? element : currentMax,
    );

    final List<double> axisValues = [0.0, 6.0, 0.0, maxY];

    final List<FlSpot> spots = [
      FlSpot(1, activityRecord.recognitionAnswer1Duration.inSeconds.toDouble()),
      FlSpot(2, activityRecord.recognitionAnswer2Duration.inSeconds.toDouble()),
      FlSpot(3, activityRecord.understandingTextualAnswer1Duration.inSeconds.toDouble()),
      FlSpot(4, activityRecord.understandingTextualAnswer2Duration.inSeconds.toDouble()),
      FlSpot(5, activityRecord.understandingVisualAnswer1Duration.inSeconds.toDouble()),
      FlSpot(6, activityRecord.understandingVisualAnswer2Duration.inSeconds.toDouble()),
    ];

    emit(
      state.copyWith(
        lineChartDataHolder: LineChartDataHolder(
          fullActivityDuration: activityFullDuration,
          maxAxisValues: axisValues,
          spots: spots,
        ),
      ),
    );
  }
}
