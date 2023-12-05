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
    //_mapOverviewTabCharts();
  }

  final IAuthenticationManager authenticationManager;
  final IDatabaseRepository databaseRepository;

  Stream<QuerySnapshot>? _activityRecordsStream;
  Stream<QuerySnapshot>? _singleChildStream;

  void selectForecastEmotionToDisplay(EmotionsInCalendar emotion) {
    emit(state.copyWith(emotionsInCalendar: emotion));
  }

/*
  void selectForecastEmotionToDisplay(EmotionForecast emotion) {
    emit(state.copyWith(selectedEmotion: emotion));
  }
*/
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
        _mapOverviewTabCharts();
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

  void _mapOverviewTabCharts() {
    final stationOfHappinessData = _calculateAverageData(state.stationOfHappinessRecords);
    final stationOfSadnessData = _calculateAverageData(state.stationOfSadnessRecords);
    final stationOfFearData = _calculateAverageData(state.stationOfFearRecords);
    final stationOfAngerData = _calculateAverageData(state.stationOfAngerRecords);
//bar grupe ce biti stanice

    final barGroupHappiness = _createOverviewTabBarChartDataGroup(
      x: 0,
      y1: stationOfHappinessData['recognition'] ?? 0.0,
      y2: stationOfHappinessData['textual'] ?? 0.0,
      y3: stationOfHappinessData['visual'] ?? 0.0,
    );

    final barGroupSadness = _createOverviewTabBarChartDataGroup(
      x: 0,
      y1: stationOfSadnessData['recognition'] ?? 0.0,
      y2: stationOfSadnessData['textual'] ?? 0.0,
      y3: stationOfSadnessData['visual'] ?? 0.0,
    );

    final barGroupFear = _createOverviewTabBarChartDataGroup(
      x: 0,
      y1: stationOfFearData['recognition'] ?? 0.0,
      y2: stationOfFearData['textual'] ?? 0.0,
      y3: stationOfFearData['visual'] ?? 0.0,
    );

    final barGroupAnger = _createOverviewTabBarChartDataGroup(
      x: 0,
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

  Map<String, double> _calculateAverageData(List<ActivityRecord>? stationRecords) {
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
    print(recognitionData);
    print(textualData);
    print(visualData);

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
          color: y1 == 19.0
              ? Colors.greenAccent
              : y1 == 10.0
                  ? Colors.orangeAccent
                  : Colors.redAccent,
          width: 7,
        ),
        if (y2 != 0.0)
          BarChartRodData(
            toY: y2,
            color: y2 == 19.0
                ? Colors.greenAccent
                : y2 == 10.0
                    ? Colors.orangeAccent
                    : Colors.redAccent,
            width: 7,
          ),
        if (y3 != 0.0)
          BarChartRodData(
            toY: y3,
            color: y3 == 19.0
                ? Colors.greenAccent
                : y3 == 10.0
                    ? Colors.orangeAccent
                    : Colors.redAccent,
            width: 7,
          ),
      ],
    );
  }
}
