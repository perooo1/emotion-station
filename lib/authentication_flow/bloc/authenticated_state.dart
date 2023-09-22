part of 'authenticated_cubit.dart';

abstract class BaseAuthenticatedState extends Equatable {
  bool get isAuthenticated;

  @override
  List<Object?> get props => [isAuthenticated];
}

class AuthenticatedState extends BaseAuthenticatedState {
  @override
  bool get isAuthenticated => true;
}

class UnauthenticatedState extends BaseAuthenticatedState {
  @override
  bool get isAuthenticated => false;
}
