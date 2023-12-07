//home state

part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.currentUser,
    this.children,
    this.selectedChild,
    this.specialistConnectionDialogShown = false,
  });

  final List<Child>? children;
  final User currentUser;
  final Child? selectedChild;
  final bool specialistConnectionDialogShown;

  HomeState copyWith({
    User? currentUser,
    List<Child>? children,
    Child? selectedChild,
    bool? specialistConnectionDialogShown,
  }) {
    return HomeState(
      children: children ?? this.children,
      currentUser: currentUser ?? this.currentUser,
      selectedChild: selectedChild ?? this.selectedChild,
      specialistConnectionDialogShown:
          specialistConnectionDialogShown ?? this.specialistConnectionDialogShown,
    );
  }

  @override
  List<Object?> get props => [
        children,
        currentUser,
        selectedChild,
        specialistConnectionDialogShown,
      ];
}
