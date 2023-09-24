part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({required this.currentUser});

  final User currentUser;

  HomeState copyWith({User? currentUser}) {
    return HomeState(currentUser: currentUser ?? this.currentUser);
  }

  @override
  List<Object?> get props => [currentUser];
}
