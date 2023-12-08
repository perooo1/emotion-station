part of 'info_screen_cubit.dart';

class InfoScreenState extends Equatable {
  const InfoScreenState({
    required this.currentUser,
    this.specialist,
  });

  final User currentUser;
  final Specialist? specialist;

  InfoScreenState copyWith({
    User? currentUser,
    Specialist? specialist,
  }) {
    return InfoScreenState(
      currentUser: currentUser ?? this.currentUser,
      specialist: specialist ?? this.specialist,
    );
  }

  @override
  List<Object?> get props => [currentUser, specialist];
}
