part of 'completed_activity_cubit.dart';

class CompletedActivityState extends Equatable {
  const CompletedActivityState({
    required this.activityRecord,
    this.homeFirstChartBarGroups,
  });

  final ActivityRecord activityRecord;
  final List<BarChartGroupData>? homeFirstChartBarGroups;

  CompletedActivityState copyWith({
    ActivityRecord? activityRecord,
    List<BarChartGroupData>? homeFirstChartBarGroups,
  }) {
    return CompletedActivityState(
      activityRecord: activityRecord ?? this.activityRecord,
      homeFirstChartBarGroups: homeFirstChartBarGroups ?? this.homeFirstChartBarGroups,
    );
  }

  @override
  List<Object?> get props => [activityRecord, homeFirstChartBarGroups];
}
