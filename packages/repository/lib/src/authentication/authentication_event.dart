// Package imports:
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';

class BaseAuthenticatedEvent extends Equatable {
  const BaseAuthenticatedEvent();

  bool get isAuthenticated => false;

  @override
  List<Object?> get props => [isAuthenticated];
}

class AuthenticatedEvent extends BaseAuthenticatedEvent {
  AuthenticatedEvent({required this.user});

  final User user;

  bool get isAuthenticated => true;

  @override
  List<Object?> get props => [isAuthenticated, user];

  AuthenticatedEvent copyWith({User? user}) {
    return AuthenticatedEvent(user: user ?? this.user);
  }
}

class UnauthenticatedEvent extends BaseAuthenticatedEvent {
  const UnauthenticatedEvent();

  bool get isAuthenticated => false;
}
