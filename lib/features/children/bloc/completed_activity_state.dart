part of 'completed_activity_cubit.dart';

class CompletedActivityState extends Equatable {
  const CompletedActivityState({
    required this.activityRecord,
    this.homeFirstChartBarGroups,
    this.homeFirstChartTitlesData,
  });

  final ActivityRecord activityRecord;
  final List<BarChartGroupData>? homeFirstChartBarGroups;
  final FlTitlesData? homeFirstChartTitlesData;

  CompletedActivityState copyWith({
    ActivityRecord? activityRecord,
    List<BarChartGroupData>? homeFirstChartBarGroups,
    FlTitlesData? homeFirstChartTitlesData,
  }) {
    return CompletedActivityState(
      activityRecord: activityRecord ?? this.activityRecord,
      homeFirstChartBarGroups: homeFirstChartBarGroups ?? this.homeFirstChartBarGroups,
      homeFirstChartTitlesData: homeFirstChartTitlesData ?? this.homeFirstChartTitlesData,
    );
  }

  @override
  List<Object?> get props => [
        activityRecord,
        homeFirstChartBarGroups,
        homeFirstChartTitlesData,
      ];
}
