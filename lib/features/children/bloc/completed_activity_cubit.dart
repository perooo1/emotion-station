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
    _mapOverviewTabCharts(activityRecord: activityRecord);
    _mapObservationCategoriesTabCharts(activityRecord: activityRecord);
  }

//OverviewTab

  void _mapOverviewTabCharts({required ActivityRecord activityRecord}) {
    _mapActivityToOverviewTabBarChart(activityRecord: activityRecord);
    _mapActivityToOverviewTabLineChart(activityRecord: activityRecord);
    _mapActivityToOverviewTabRadarChart(activityRecord: activityRecord);
  }

  void _mapActivityToOverviewTabBarChart({required ActivityRecord activityRecord}) {
    final barGroupRecognition = _createOverviewTabBarChartDataGroup(
      x: 0,
      y1: activityRecord.recognitionAnswer1.toBarChartData(),
      y2: activityRecord.recognitionAnswer2.toBarChartData(),
    );
    final barGroupTextualUnderstanding = _createOverviewTabBarChartDataGroup(
      x: 1,
      y1: activityRecord.understandingTextualAnswer1.toBarChartData(),
      y2: activityRecord.understandingTextualAnswer2.toBarChartData(),
    );
    final barGroupVisualUnderstanding = _createOverviewTabBarChartDataGroup(
      x: 2,
      y1: activityRecord.understandingVisualAnswer1.toBarChartData(),
      y2: activityRecord.understandingVisualAnswer2.toBarChartData(),
    );

    emit(
      state.copyWith(
        homeTabBarChartData: BarChartDataHolder(
          dataGroups: [
            barGroupRecognition,
            barGroupTextualUnderstanding,
            barGroupVisualUnderstanding,
          ],
        ),
      ),
    );
  }

  BarChartGroupData _createOverviewTabBarChartDataGroup({
    required int x,
    required double y1,
    required double y2,
  }) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
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

  void _mapActivityToOverviewTabLineChart({required ActivityRecord activityRecord}) {
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
        homeTabLineChartData: LineChartDataHolder(
          fullActivityDuration: activityFullDuration,
          maxAxisValues: axisValues,
          spots: spots,
        ),
      ),
    );
  }

  void _mapActivityToOverviewTabRadarChart({required ActivityRecord activityRecord}) {
    final List<RadarChartDataSet> lista = [
      RadarChartDataSet(
        title: 'Emotion Comprehension Level ',
        color: Colors.red,
        values: [
          (activityRecord.recognitionAnswer1.toRadarChartData() +
                  activityRecord.recognitionAnswer2.toRadarChartData()) /
              2.0,
          (activityRecord.understandingTextualAnswer1.toRadarChartData() +
                  activityRecord.understandingTextualAnswer2.toRadarChartData()) /
              2.0,
          (activityRecord.understandingVisualAnswer1.toRadarChartData() +
                  activityRecord.understandingVisualAnswer2.toRadarChartData()) /
              2.0,
        ],
      ),
    ];

    final List<RadarDataSet> radarDataset = lista.asMap().entries.map((entry) {
      final dataset = entry.value;

      return RadarDataSet(
        fillColor: Colors.pink.withOpacity(0.2),
        borderColor: Colors.pink,
        entryRadius: 3,
        dataEntries: dataset.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: 2.3,
      );
    }).toList();

    emit(
      state.copyWith(
        homeTabRadarChartData: RadarChartDataHolder(rawData: lista, radarDataset: radarDataset),
      ),
    );
  }

//Opservation categories

  void _mapObservationCategoriesTabCharts({required ActivityRecord activityRecord}) {
    //Comprehension lvl data
    final List<BarChartGroupData> recognitionComprehensionData = [
      _createObservationCategoriesBarChartDataGroup(
        x: 0,
        y: activityRecord.recognitionAnswer1.toBarChartData(),
      ),
      _createObservationCategoriesBarChartDataGroup(
        x: 1,
        y: activityRecord.recognitionAnswer2.toBarChartData(),
      ),
    ];

    final List<BarChartGroupData> textualUnderstandingComprehensionData = [
      _createObservationCategoriesBarChartDataGroup(
        x: 0,
        y: activityRecord.understandingTextualAnswer1.toBarChartData(),
      ),
      _createObservationCategoriesBarChartDataGroup(
        x: 1,
        y: activityRecord.understandingTextualAnswer2.toBarChartData(),
      ),
    ];

    final List<BarChartGroupData> visualUnderstandingComprehensionData = [
      _createObservationCategoriesBarChartDataGroup(
        x: 0,
        y: activityRecord.understandingVisualAnswer1.toBarChartData(),
      ),
      _createObservationCategoriesBarChartDataGroup(
        x: 1,
        y: activityRecord.understandingVisualAnswer2.toBarChartData(),
      ),
    ];

    //Duration data

    final List<BarChartGroupData> recognitionDurationData = [
      _createObservationCategoriesBarChartDataGroup(
        x: 0,
        y: activityRecord.recognitionAnswer1Duration.inSeconds.toDouble(),
      ),
      _createObservationCategoriesBarChartDataGroup(
        x: 1,
        y: activityRecord.recognitionAnswer2Duration.inSeconds.toDouble(),
      ),
    ];

    final List<BarChartGroupData> textualUnderstandingDurationData = [
      _createObservationCategoriesBarChartDataGroup(
        x: 0,
        y: activityRecord.understandingTextualAnswer1Duration.inSeconds.toDouble(),
      ),
      _createObservationCategoriesBarChartDataGroup(
        x: 1,
        y: activityRecord.understandingTextualAnswer2Duration.inSeconds.toDouble(),
      ),
    ];

    final List<BarChartGroupData> visualUnderstandingDurationData = [
      _createObservationCategoriesBarChartDataGroup(
        x: 0,
        y: activityRecord.understandingVisualAnswer1Duration.inSeconds.toDouble(),
      ),
      _createObservationCategoriesBarChartDataGroup(
        x: 1,
        y: activityRecord.understandingVisualAnswer2Duration.inSeconds.toDouble(),
      ),
    ];

    emit(
      state.copyWith(
        recognitionTabComprehensionData:
            BarChartDataHolder(dataGroups: recognitionComprehensionData),
        textualTabComprehensionData:
            BarChartDataHolder(dataGroups: textualUnderstandingComprehensionData),
        visualTabComprehensionData:
            BarChartDataHolder(dataGroups: visualUnderstandingComprehensionData),
        recognitionTabDurationData: BarChartDataHolder(
          maxY:
              activityRecord.recognitionAnswer1Duration > activityRecord.recognitionAnswer2Duration
                  ? activityRecord.recognitionAnswer1Duration.inSeconds.toDouble()
                  : activityRecord.recognitionAnswer2Duration.inSeconds.toDouble(),
          dataGroups: recognitionDurationData,
        ),
        textualTabDurationData: BarChartDataHolder(
          maxY: activityRecord.understandingTextualAnswer1Duration >
                  activityRecord.understandingTextualAnswer2Duration
              ? activityRecord.understandingTextualAnswer1Duration.inSeconds.toDouble()
              : activityRecord.understandingTextualAnswer2Duration.inSeconds.toDouble(),
          dataGroups: textualUnderstandingDurationData,
        ),
        visualTabDurationData: BarChartDataHolder(
          maxY: activityRecord.understandingVisualAnswer1Duration >
                  activityRecord.understandingVisualAnswer2Duration
              ? activityRecord.understandingVisualAnswer1Duration.inSeconds.toDouble()
              : activityRecord.understandingVisualAnswer2Duration.inSeconds.toDouble(),
          dataGroups: visualUnderstandingDurationData,
        ),
      ),
    );
  }

  BarChartGroupData _createObservationCategoriesBarChartDataGroup({
    required int x,
    required double y,
  }) {
    return BarChartGroupData(
      x: x,
      barsSpace: 4,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y == 19.0
              ? Colors.greenAccent
              : y == 10.0
                  ? Colors.orangeAccent
                  : Colors.redAccent,
          width: 7,
        ),
      ],
    );
  }
}
