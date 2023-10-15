part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.currentUser,
    this.children,
    this.selectedChild,
  });

  final List<Child>? children;
  final User currentUser;
  final Child? selectedChild;

  HomeState copyWith({
    User? currentUser,
    List<Child>? children,
    Child? selectedChild,
  }) {
    return HomeState(
      children: children ?? this.children,
      currentUser: currentUser ?? this.currentUser,
      selectedChild: selectedChild ?? this.selectedChild,
    );
  }

  @override
  List<Object?> get props => [
        children,
        currentUser,
        selectedChild,
      ];
}
