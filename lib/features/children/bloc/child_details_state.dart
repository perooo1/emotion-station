part of 'child_details_cubit.dart';

class ChildDetailsState extends Equatable {
  const ChildDetailsState({required this.child});
  final Child child;

  @override
  List<Object?> get props => [child];
}
