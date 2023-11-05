part of 'completed_activity_cubit.dart';

class CompletedActivityState extends Equatable {
  const CompletedActivityState({
    required this.activityRecord,
    this.lineChartDataHolder,
    this.homeFirstChartBarGroups,
  });

  final ActivityRecord activityRecord;
  final List<BarChartGroupData>? homeFirstChartBarGroups;
  final LineChartDataHolder? lineChartDataHolder;

  CompletedActivityState copyWith({
    ActivityRecord? activityRecord,
    List<BarChartGroupData>? homeFirstChartBarGroups,
    LineChartDataHolder? lineChartDataHolder,
  }) {
    return CompletedActivityState(
      activityRecord: activityRecord ?? this.activityRecord,
      homeFirstChartBarGroups: homeFirstChartBarGroups ?? this.homeFirstChartBarGroups,
      lineChartDataHolder: lineChartDataHolder ?? this.lineChartDataHolder,
    );
  }

  @override
  List<Object?> get props => [
        activityRecord,
        homeFirstChartBarGroups,
        lineChartDataHolder,
      ];
}
