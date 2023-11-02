part of 'child_details_cubit.dart';

class ChildDetailsState extends Equatable {
  const ChildDetailsState({
    this.activityRecords,
    required this.child,
  });

  final List<ActivityRecord>? activityRecords;
  final Child child;

  ChildDetailsState copyWith({
    required List<ActivityRecord>? activityRecords,
    required Child? child,
  }) {
    return ChildDetailsState(
      activityRecords: activityRecords ?? this.activityRecords,
      child: child ?? this.child,
    );
  }

  @override
  List<Object?> get props => [activityRecords, child];
}
