part of 'child_details_cubit.dart';

class ChildDetailsState extends Equatable {
  const ChildDetailsState({
    this.activityRecords,
    required this.child,
    this.selectedEmotion = EmotionForecast.happy,
    this.selectedEmotionAddDialog = EmotionForecast.happy,
    this.selectedEmotionDateAddDialog,
    this.emotionForecast,
    this.emotionsInCalendar = EmotionsInCalendar.all,
    this.stationOfHappinessRecords,
    this.stationOfSadnessRecords,
    this.stationOfAngerRecords,
    this.stationOfFearRecords,
    this.overviewBarChartData,
    this.overviewRadarChartData,
  });

  final List<ActivityRecord>? activityRecords;
  final Child child;
  final EmotionForecast selectedEmotion;
  final EmotionForecast selectedEmotionAddDialog;
  final DateTime? selectedEmotionDateAddDialog;
  final Map<DateTime, EmotionForecast>? emotionForecast;
  final EmotionsInCalendar emotionsInCalendar;

  final List<ActivityRecord>? stationOfHappinessRecords;
  final List<ActivityRecord>? stationOfSadnessRecords;
  final List<ActivityRecord>? stationOfAngerRecords;
  final List<ActivityRecord>? stationOfFearRecords;

  final BarChartDataHolder? overviewBarChartData;
  final RadarChartDataHolder? overviewRadarChartData;

  ChildDetailsState copyWith({
    List<ActivityRecord>? activityRecords,
    Child? child,
    EmotionForecast? selectedEmotion,
    EmotionForecast? selectedEmotionAddDialog,
    DateTime? selectedEmotionDateAddDialog,
    Map<DateTime, EmotionForecast>? emotionForecast,
    EmotionsInCalendar? emotionsInCalendar,
  }) {
    return ChildDetailsState(
      activityRecords: activityRecords ?? this.activityRecords,
      child: child ?? this.child,
      selectedEmotion: selectedEmotion ?? this.selectedEmotion,
      selectedEmotionAddDialog: selectedEmotionAddDialog ?? this.selectedEmotionAddDialog,
      selectedEmotionDateAddDialog:
          selectedEmotionDateAddDialog ?? this.selectedEmotionDateAddDialog,
      emotionForecast: emotionForecast ?? this.emotionForecast,
      emotionsInCalendar: emotionsInCalendar ?? this.emotionsInCalendar,
      stationOfHappinessRecords: stationOfHappinessRecords,
      stationOfSadnessRecords: stationOfSadnessRecords,
      stationOfFearRecords: stationOfFearRecords,
      stationOfAngerRecords: stationOfAngerRecords,
      overviewBarChartData: overviewBarChartData,
      overviewRadarChartData: overviewRadarChartData,
    );
  }

  ChildDetailsState copyWithActivitiesOverviewData({
    List<ActivityRecord>? stationOfHappinessRecords,
    List<ActivityRecord>? stationOfSadnessRecords,
    List<ActivityRecord>? stationOfAngerRecords,
    List<ActivityRecord>? stationOfFearRecords,
    BarChartDataHolder? overviewBarChartData,
    RadarChartDataHolder? overviewRadarChartData,
  }) {
    return ChildDetailsState(
      activityRecords: activityRecords,
      child: child,
      selectedEmotion: selectedEmotion,
      selectedEmotionAddDialog: selectedEmotionAddDialog,
      selectedEmotionDateAddDialog: selectedEmotionDateAddDialog,
      emotionForecast: emotionForecast,
      emotionsInCalendar: emotionsInCalendar,
      stationOfHappinessRecords: stationOfHappinessRecords ?? this.stationOfHappinessRecords,
      stationOfSadnessRecords: stationOfSadnessRecords ?? this.stationOfSadnessRecords,
      stationOfAngerRecords: stationOfAngerRecords ?? this.stationOfAngerRecords,
      stationOfFearRecords: stationOfFearRecords ?? this.stationOfFearRecords,
      overviewBarChartData: overviewBarChartData ?? this.overviewBarChartData,
      overviewRadarChartData: overviewRadarChartData ?? this.overviewRadarChartData,
    );
  }

  @override
  List<Object?> get props => [
        activityRecords,
        child,
        selectedEmotion,
        selectedEmotionAddDialog,
        selectedEmotionDateAddDialog,
        emotionForecast,
        emotionsInCalendar,
        stationOfHappinessRecords,
        stationOfSadnessRecords,
        stationOfAngerRecords,
        stationOfFearRecords,
        overviewBarChartData,
        overviewRadarChartData,
      ];
}

enum EmotionsInCalendar { all, sad, happy, angry }
