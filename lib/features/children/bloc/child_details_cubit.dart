import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/utils/helper_classes/helper_classes.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'child_details_state.dart';

@Injectable()
class ChildDetailsCubit extends Cubit<ChildDetailsState> {
  ChildDetailsCubit({
    @factoryParam required Child child,
    required this.authenticationManager,
    required this.databaseRepository,
  }) : super(ChildDetailsState(child: child)) {
    _startListening();
  }

  final IAuthenticationManager authenticationManager;
  final IDatabaseRepository databaseRepository;

  Stream<QuerySnapshot>? _activityRecordsStream;
  Stream<QuerySnapshot>? _singleChildStream;

  final Color stationOfHappinessColor = Colors.yellow;
  final Color stationOfSadnessColor = Colors.blue;
  final Color stationOfFearColor = Colors.purple;
  final Color stationOfAngerColor = Colors.red;

  void selectForecastEmotionToDisplay(EmotionsInCalendar emotion) {
    emit(state.copyWith(emotionsInCalendar: emotion));
  }

  void selectForecastEmotionAddDialog(EmotionForecast emotion) {
    emit(state.copyWith(selectedEmotionAddDialog: emotion));
  }

  void selectForecastDateAddDialog(DateTime date) {
    emit(state.copyWith(selectedEmotionDateAddDialog: DateTime(date.year, date.month, date.day)));
  }

  Future<void> updateChildEmotionForecast() async {
    final forecast = state.emotionForecast;
    if (forecast != null) {
      forecast[state.selectedEmotionDateAddDialog ?? DateTime.now()] =
          state.selectedEmotionAddDialog;

      final a = await databaseRepository.updateChildEmotionForecast(
        childId: state.child.id,
        forecast: forecast,
      );
    } else {
      final Map<DateTime, EmotionForecast> newForecast = {
        state.selectedEmotionDateAddDialog ?? DateTime.now(): state.selectedEmotionAddDialog
      };

      final a = await databaseRepository.updateChildEmotionForecast(
        childId: state.child.id,
        forecast: newForecast,
      );
    }
  }

  Future<void> addSpecialistNote(String specialistNote) async {
    final a = await databaseRepository.addSpecialistNote(
      childId: state.child.id,
      specialistNote: specialistNote,
    );
  }

  _startListening() {
    _activityRecordsStream =
        databaseRepository.getRecordedActivitiesStream(childId: state.child.id);

    _singleChildStream = databaseRepository.getSingleChildStream(childId: state.child.id);

    _activityRecordsStream?.listen(
      (querySnapshot) {
        final List<ActivityRecord> records = [];
        for (var doc in querySnapshot.docs) {
          records.add(ActivityRecord.fromJson(doc.data() as Map<String, dynamic>));
        }
        records.sort((a, b) => b.timeOfActivity.compareTo(a.timeOfActivity));
        emit(state.copyWith(activityRecords: records, child: null));
        //emit(state.copyWith(activityRecords: records));
        //now add aktivnosti za pojedinu stanicu, potencijalno izbacit izvan .listen i stavit unutar _startListening metode
        List<ActivityRecord> stationOfHappinessRecords = [];
        List<ActivityRecord> stationOfSadnessRecords = [];
        List<ActivityRecord> stationOfFearRecords = [];
        List<ActivityRecord> stationOfAngerRecords = [];

        stationOfHappinessRecords = records
            .where(
              (element) => element.emotionStation.activityType == ActivityType.stationOfHappiness,
            )
            .toList();

        stationOfSadnessRecords = records
            .where(
              (element) => element.emotionStation.activityType == ActivityType.stationOfSadness,
            )
            .toList();

        stationOfAngerRecords = records
            .where(
              (element) => element.emotionStation.activityType == ActivityType.stationOfAnger,
            )
            .toList();

        stationOfFearRecords = records
            .where(
              (element) => element.emotionStation.activityType == ActivityType.stationOfFear,
            )
            .toList();

        emit(
          state.copyWithActivitiesOverviewData(
            stationOfHappinessRecords: stationOfHappinessRecords,
            stationOfSadnessRecords: stationOfSadnessRecords,
            stationOfAngerRecords: stationOfAngerRecords,
            stationOfFearRecords: stationOfFearRecords,
          ),
        );
        _mapOverviewTabChart();
        _mapOverviewRadarChart();
      },
    );

    _singleChildStream?.listen(
      (querySnapshot) {
        //final DocumentSnapshot child = querySnapshot.docs[0];
        final Child child = Child.fromJson(querySnapshot.docs[0].data() as Map<String, dynamic>);

        emit(state.copyWith(emotionForecast: child.emotionForecast));
      },
    );
  }

  //Overview charts

  void _mapOverviewTabChart() {
    final stationOfHappinessData = _calculateAverageBarChartData(state.stationOfHappinessRecords);
    final stationOfSadnessData = _calculateAverageBarChartData(state.stationOfSadnessRecords);
    final stationOfFearData = _calculateAverageBarChartData(state.stationOfFearRecords);
    final stationOfAngerData = _calculateAverageBarChartData(state.stationOfAngerRecords);

    final barGroupHappiness = _createOverviewTabBarChartDataGroup(
      x: 0,
      y1: stationOfHappinessData['recognition'] ?? 0.0,
      y2: stationOfHappinessData['textual'] ?? 0.0,
      y3: stationOfHappinessData['visual'] ?? 0.0,
    );

    final barGroupSadness = _createOverviewTabBarChartDataGroup(
      x: 1,
      y1: stationOfSadnessData['recognition'] ?? 0.0,
      y2: stationOfSadnessData['textual'] ?? 0.0,
      y3: stationOfSadnessData['visual'] ?? 0.0,
    );

    final barGroupFear = _createOverviewTabBarChartDataGroup(
      x: 2,
      y1: stationOfFearData['recognition'] ?? 0.0,
      y2: stationOfFearData['textual'] ?? 0.0,
      y3: stationOfFearData['visual'] ?? 0.0,
    );

    final barGroupAnger = _createOverviewTabBarChartDataGroup(
      x: 3,
      y1: stationOfAngerData['recognition'] ?? 0.0,
      y2: stationOfAngerData['textual'] ?? 0.0,
      y3: stationOfAngerData['visual'] ?? 0.0,
    );

    emit(
      state.copyWithActivitiesOverviewData(
        overviewBarChartData: BarChartDataHolder(
          dataGroups: [
            barGroupHappiness,
            barGroupSadness,
            barGroupFear,
            barGroupAnger,
          ],
        ),
      ),
    );
  }

  Map<String, double> _calculateAverageBarChartData(List<ActivityRecord>? stationRecords) {
    double recognitionData = 0.0;
    double textualData = 0.0;
    double visualData = 0.0;

    final Map<String, double> results = {};

    stationRecords?.forEach(
      (element) {
        recognitionData += element.recognitionAnswer1.toBarChartData();
        recognitionData += element.recognitionAnswer2.toBarChartData();

        textualData += element.understandingTextualAnswer1.toBarChartData();
        textualData += element.understandingTextualAnswer2.toBarChartData();

        visualData += element.understandingVisualAnswer1.toBarChartData();
        visualData += element.understandingVisualAnswer2.toBarChartData();
      },
    );

    recognitionData = recognitionData / (stationRecords?.length ?? 1.0);
    textualData = textualData / (stationRecords?.length ?? 1.0);
    visualData = visualData / (stationRecords?.length ?? 1.0);

    results['recognition'] = recognitionData;
    results['textual'] = textualData;
    results['visual'] = visualData;

    return results;
  }

  BarChartGroupData _createOverviewTabBarChartDataGroup({
    required int x,
    required double y1,
    required double y2,
    required double y3,
  }) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.greenAccent,
          width: 7,
        ),
        if (y2 != 0.0)
          BarChartRodData(
            toY: y2,
            color: Colors.orangeAccent,
            width: 7,
          ),
        if (y3 != 0.0)
          BarChartRodData(
            toY: y3,
            color: Colors.redAccent,
            width: 7,
          ),
      ],
    );
  }

  void _mapOverviewRadarChart() {
    final stationOfHappinessData = _calculateAverageRadarChartData(state.stationOfHappinessRecords);
    final stationOfSadnessData = _calculateAverageRadarChartData(state.stationOfSadnessRecords);
    final stationOfFearData = _calculateAverageRadarChartData(state.stationOfFearRecords);
    final stationOfAngerData = _calculateAverageRadarChartData(state.stationOfAngerRecords);

    final List<RadarChartDataSet> rawDataSets = [];

    rawDataSets.add(
      _mapToRadarDataSet(
        stationOfHappinessData,
        stationOfHappinessColor,
        'Stanica sreće',
        //'Station of Happiness',
      ),
    );
    rawDataSets.add(
      _mapToRadarDataSet(
        stationOfSadnessData,
        stationOfSadnessColor,
        'Stanica tuge',
      ),
    );
    rawDataSets.add(
      _mapToRadarDataSet(
        stationOfFearData,
        stationOfFearColor,
        'Stanica straha',
        //'Station of Fear',
      ),
    );
    rawDataSets.add(
      _mapToRadarDataSet(
        stationOfAngerData,
        stationOfAngerColor,
        'Stanica ljutnje',
        //'Station of Anger',
      ),
    );

    final List<RadarDataSet> radarDataset = rawDataSets.asMap().entries.map(
      (entry) {
        final dataset = entry.value;

        return RadarDataSet(
          fillColor: dataset.color.withOpacity(0.2),
          borderColor: dataset.color,
          entryRadius: 3,
          dataEntries: dataset.values.map((e) => RadarEntry(value: e)).toList(),
          borderWidth: 2.3,
        );
      },
    ).toList();

    emit(
      state.copyWithActivitiesOverviewData(
        overviewRadarChartData: RadarChartDataHolder(
          rawData: rawDataSets,
          radarDataset: radarDataset,
        ),
      ),
    );
  }

  Map<String, double> _calculateAverageRadarChartData(List<ActivityRecord>? stationRecords) {
    double recognitionData = 0.0;
    double textualData = 0.0;
    double visualData = 0.0;

    final Map<String, double> results = {};

    stationRecords?.forEach(
      (element) {
        recognitionData += element.recognitionAnswer1.toRadarChartData();
        recognitionData += element.recognitionAnswer2.toRadarChartData();

        textualData += element.understandingTextualAnswer1.toRadarChartData();
        textualData += element.understandingTextualAnswer2.toRadarChartData();

        visualData += element.understandingVisualAnswer1.toRadarChartData();
        visualData += element.understandingVisualAnswer2.toRadarChartData();
      },
    );

    recognitionData = recognitionData / (stationRecords?.length ?? 1.0);
    textualData = textualData / (stationRecords?.length ?? 1.0);
    visualData = visualData / (stationRecords?.length ?? 1.0);

    results['recognition'] = recognitionData;
    results['textual'] = textualData;
    results['visual'] = visualData;

    return results;
  }

  RadarChartDataSet _mapToRadarDataSet(
    Map<String, double> averageData,
    Color color,
    String title,
  ) {
    return RadarChartDataSet(
      title: title,
      color: color,
      values: [
        averageData['recognition'] ?? 0.0,
        averageData['textual'] ?? 0.0,
        averageData['visual'] ?? 0.0,
      ],
    );
  }
}
