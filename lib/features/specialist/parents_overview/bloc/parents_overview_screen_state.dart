part of 'parents_overview_screen_cubit.dart';

class ParentsOverviewScreenState extends Equatable {
  const ParentsOverviewScreenState({
    required this.currentUser,
  });

  final User currentUser;

  ParentsOverviewScreenState copyWith({
    User? currentUser,
  }) {
    return ParentsOverviewScreenState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  List<Object?> get props => [currentUser];
}
