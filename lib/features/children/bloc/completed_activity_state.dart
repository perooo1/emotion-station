part of 'completed_activity_cubit.dart';

class CompletedActivityState extends Equatable {
  const CompletedActivityState({
    required this.activityRecord,
    this.homeTabBarChartData,
    this.homeTabLineChartData,
    this.homeTabRadarChartData,
    this.recognitionTabComprehensionData,
    this.recognitionTabDurationData,
    this.textualTabComprehensionData,
    this.textualTabDurationData,
    this.visualTabComprehensionData,
    this.visualTabDurationData,
  });

  final ActivityRecord activityRecord;
  final BarChartDataHolder? homeTabBarChartData;
  final LineChartDataHolder? homeTabLineChartData;
  final RadarChartDataHolder? homeTabRadarChartData;

  final BarChartDataHolder? recognitionTabComprehensionData;
  final BarChartDataHolder? recognitionTabDurationData;

  final BarChartDataHolder? textualTabComprehensionData;
  final BarChartDataHolder? textualTabDurationData;

  final BarChartDataHolder? visualTabComprehensionData;
  final BarChartDataHolder? visualTabDurationData;

  CompletedActivityState copyWith({
    ActivityRecord? activityRecord,
    BarChartDataHolder? homeTabBarChartData,
    LineChartDataHolder? homeTabLineChartData,
    RadarChartDataHolder? homeTabRadarChartData,
    BarChartDataHolder? recognitionTabComprehensionData,
    BarChartDataHolder? recognitionTabDurationData,
    BarChartDataHolder? textualTabComprehensionData,
    BarChartDataHolder? textualTabDurationData,
    BarChartDataHolder? visualTabComprehensionData,
    BarChartDataHolder? visualTabDurationData,
  }) {
    return CompletedActivityState(
      activityRecord: activityRecord ?? this.activityRecord,
      homeTabBarChartData: homeTabBarChartData ?? this.homeTabBarChartData,
      homeTabLineChartData: homeTabLineChartData ?? this.homeTabLineChartData,
      homeTabRadarChartData: homeTabRadarChartData ?? this.homeTabRadarChartData,
      recognitionTabComprehensionData:
          recognitionTabComprehensionData ?? this.recognitionTabComprehensionData,
      recognitionTabDurationData: recognitionTabDurationData ?? this.recognitionTabDurationData,
      textualTabComprehensionData: textualTabComprehensionData ?? this.textualTabComprehensionData,
      textualTabDurationData: textualTabDurationData ?? this.textualTabDurationData,
      visualTabComprehensionData: visualTabComprehensionData ?? this.visualTabComprehensionData,
      visualTabDurationData: visualTabDurationData ?? this.visualTabDurationData,
    );
  }

  @override
  List<Object?> get props => [
        activityRecord,
        homeTabBarChartData,
        homeTabLineChartData,
        homeTabRadarChartData,
        recognitionTabComprehensionData,
        recognitionTabDurationData,
        textualTabComprehensionData,
        textualTabDurationData,
        visualTabComprehensionData,
        visualTabDurationData,
      ];
}
