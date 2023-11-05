part of 'completed_activity_cubit.dart';

class CompletedActivityState extends Equatable {
  const CompletedActivityState({
    required this.activityRecord,
    this.homeTabBarChartData,
    this.homeTabLineChartData,
    //this.homeFirstChartBarGroups,
  });

  final ActivityRecord activityRecord;
  //final List<BarChartGroupData>? homeFirstChartBarGroups;
  final BarChartDataHolder? homeTabBarChartData;
  final LineChartDataHolder? homeTabLineChartData;

  CompletedActivityState copyWith({
    ActivityRecord? activityRecord,
    //List<BarChartGroupData>? homeFirstChartBarGroups,
    BarChartDataHolder? homeTabBarChartData,
    LineChartDataHolder? homeTabLineChartData,
  }) {
    return CompletedActivityState(
      activityRecord: activityRecord ?? this.activityRecord,
      //homeFirstChartBarGroups: homeFirstChartBarGroups ?? this.homeFirstChartBarGroups,
      homeTabBarChartData: homeTabBarChartData ?? this.homeTabBarChartData,
      homeTabLineChartData: homeTabLineChartData ?? this.homeTabLineChartData,
    );
  }

  @override
  List<Object?> get props => [
        activityRecord,
        //homeFirstChartBarGroups,
        homeTabBarChartData,
        homeTabLineChartData,
      ];
}
