part of 'completed_activity_cubit.dart';

class CompletedActivityState extends Equatable {
  const CompletedActivityState({required this.activityRecord});
  final ActivityRecord activityRecord;

  CompletedActivityState copyWith({required ActivityRecord? activityRecord}) {
    return CompletedActivityState(activityRecord: activityRecord ?? this.activityRecord);
  }

  @override
  List<Object?> get props => [activityRecord];
}
