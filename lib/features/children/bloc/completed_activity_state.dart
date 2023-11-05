part of 'completed_activity_cubit.dart';

class CompletedActivityState extends Equatable {
  const CompletedActivityState({
    required this.activityRecord,
    this.homeTabBarChartData,
    this.homeTabLineChartData,
    this.homeTabRadarChartData,
  });

  final ActivityRecord activityRecord;
  final BarChartDataHolder? homeTabBarChartData;
  final LineChartDataHolder? homeTabLineChartData;
  final RadarChartDataHolder? homeTabRadarChartData;

  CompletedActivityState copyWith({
    ActivityRecord? activityRecord,
    BarChartDataHolder? homeTabBarChartData,
    LineChartDataHolder? homeTabLineChartData,
    RadarChartDataHolder? homeTabRadarChartData,
  }) {
    return CompletedActivityState(
      activityRecord: activityRecord ?? this.activityRecord,
      homeTabBarChartData: homeTabBarChartData ?? this.homeTabBarChartData,
      homeTabLineChartData: homeTabLineChartData ?? this.homeTabLineChartData,
      homeTabRadarChartData: homeTabRadarChartData ?? this.homeTabRadarChartData,
    );
  }

  @override
  List<Object?> get props => [
        activityRecord,
        homeTabBarChartData,
        homeTabLineChartData,
        homeTabRadarChartData,
      ];
}
