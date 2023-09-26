// Dart imports:
import 'dart:async';

// Package imports:
import 'package:domain_models/domain_models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:repository/repository.dart';

abstract class IAuthenticationManager {
  //ovdje jos dodat boolean je li doktor
  String? get currentUserId;

  bool get isAuthenticated;
  bool get isAuthenticatedInFirebaseRepo;

  Stream<BaseAuthenticatedEvent> get authenticatedChanged;

  User getCurrentUser();
  Future<bool> registerUserInDatabase({required User user});
  Future<bool> registerUserWithEmailAndPassword({required String email, required String password});
  Future<bool> signIn({required String email, required String password});
  Future<void> signOut();
}

@Singleton(as: IAuthenticationManager)
class AuthenticationManager implements IAuthenticationManager {
  AuthenticationManager({
    required this.authenticationRepository,
    required this.databaseRepository,
  }) {
    _initListeners();
  }

  final IAuthenticationRepository authenticationRepository;
  final IDatabaseRepository databaseRepository;

  User _currentUser = User.empty;
  BaseAuthenticatedEvent _authenticatedState = UnauthenticatedEvent();

  final StreamController<BaseAuthenticatedEvent> _authenticatedChangedController =
      StreamController<BaseAuthenticatedEvent>.broadcast();

  @override
  User getCurrentUser() => _currentUser;

  @override
  Stream<BaseAuthenticatedEvent> get authenticatedChanged => _authenticatedChangedController.stream;

  @override
  bool get isAuthenticated => _authenticatedState.isAuthenticated;

  @override
  bool get isAuthenticatedInFirebaseRepo => authenticationRepository.isUserAuthenticated;

  @override
  String? get currentUserId => authenticationRepository.currentUserId;

  @override
  Future<void> signOut() async => await authenticationRepository.signOut();

  @override
  Future<bool> registerUserWithEmailAndPassword(
          {required String email, required String password}) async =>
      await authenticationRepository.register(
        email: email,
        password: password,
      );

  @override
  Future<bool> registerUserInDatabase({required User user}) async {
    if (user is Parent) {
      return await databaseRepository.registerParent(parent: user);
    } else if (user is Specialist) {
      return await databaseRepository.registerSpecialist(specialist: user);
    } else {
      print('auth manager - register user in db is false');
      return false;
    }
  }

  @override
  Future<bool> signIn({required String email, required String password}) async {
    return await authenticationRepository.signIn(email: email, password: password);
  }

  void _setAuthenticatedState(BaseAuthenticatedEvent event) {
    _authenticatedState = event;
    _authenticatedChangedController.add(event);
  }

  void _initListeners() {
    authenticationRepository.user.listen(
      (firebase_auth.User? firebaseUser) {
        if (firebaseUser == null) {
          _setAuthenticatedState(UnauthenticatedEvent());
          _currentUser = User.empty;
        } else {
          _setAuthenticatedState(AuthenticatedEvent(user: firebaseUser.toUser));
          _currentUser = firebaseUser.toUser;
        }
      },
    );
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
    );
  }
}
