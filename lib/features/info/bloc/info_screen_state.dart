part of 'info_screen_cubit.dart';

class InfoScreenState extends Equatable {
  const InfoScreenState({
    required this.currentUser,
  });

  final User currentUser;

  InfoScreenState copyWith({
    User? currentUser,
  }) {
    return InfoScreenState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  List<Object?> get props => [currentUser];
}
