part of 'children_screen_cubit.dart';

class ChildrenScreenState extends Equatable {
  const ChildrenScreenState({required this.currentUser, this.children});

  final List<Child>? children;
  final User currentUser;

  ChildrenScreenState copyWith({
    List<Child>? children,
    User? currentUser,
  }) {
    return ChildrenScreenState(
      children: children ?? this.children,
      currentUser: currentUser ?? this.currentUser,
    );
  }

  ChildrenScreenState copyWithCurrentUser({
    User? currentUser,
  }) {
    return ChildrenScreenState(
      children: children,
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  List<Object?> get props => [children, currentUser];
}
