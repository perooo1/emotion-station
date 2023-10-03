part of 'station_activity_screen_cubit.dart';

class StationActivityScreenState extends Equatable {
  const StationActivityScreenState({
    required this.currentUser,
  });

  final User currentUser;

  StationActivityScreenState copyWith({
    User? currentUser,
  }) {
    return StationActivityScreenState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  List<Object?> get props => [currentUser];
}
