// Dart imports:
import 'dart:async';

// Package imports:
import 'package:domain_models/domain_models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:repository/repository.dart';

abstract class IAuthenticationManager {
  String? get currentUserId;

  bool get isAuthenticated;
  bool get isAuthenticatedInFirebaseRepo;

  Stream<BaseAuthenticatedEvent> get authenticatedChanged;

  User getCurrentUser();
  Future<bool> registerUserInDatabase({required User user});
  Future<bool> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  });
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
  BaseAuthenticatedEvent _authenticatedState = const UnauthenticatedEvent();

  final StreamController<BaseAuthenticatedEvent>
      _authenticatedChangedController =
      StreamController<BaseAuthenticatedEvent>.broadcast();

  @override
  User getCurrentUser() => _currentUser;

  @override
  Stream<BaseAuthenticatedEvent> get authenticatedChanged =>
      _authenticatedChangedController.stream;

  @override
  bool get isAuthenticated => _authenticatedState.isAuthenticated;

  @override
  bool get isAuthenticatedInFirebaseRepo =>
      authenticationRepository.isUserAuthenticated;

  @override
  String? get currentUserId => authenticationRepository.currentUserId;

  @override
  Future<void> signOut() async => await authenticationRepository.signOut();

  @override
  Future<bool> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await authenticationRepository.register(
        email: email,
        password: password,
      );

  @override
  Future<bool> registerUserInDatabase({required User user}) async {
    if (user is Parent) {
      final parentRegisterSuccess =
          await databaseRepository.registerParent(parent: user);
      if (parentRegisterSuccess == true) {
        _currentUser =
            await databaseRepository.getParentFromDatabase(userId: user.id);
        return true;
      }
      return false;
    } else if (user is Specialist) {
      final specialistRegisterSuccess =
          await databaseRepository.registerSpecialist(specialist: user);
      if (specialistRegisterSuccess == true) {
        _currentUser =
            await databaseRepository.getSpecialistFromDatabase(userId: user.id);
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

  @override
  Future<bool> signIn({required String email, required String password}) async {
    final isSignInSuccess =
        await authenticationRepository.signIn(email: email, password: password);

    if (isSignInSuccess == false) {
      return false;
    } else {
      // first search through specialist collection and return true if document exists
      final specialist = await databaseRepository.getSpecialistFromDatabase(
          userId: _currentUser.id);
      if (specialist.id.isNotEmpty) {
        _currentUser = specialist;
        return true;
      } else {
        //if not in specialist, search through parents collection and return if document exists
        final parent = await databaseRepository.getParentFromDatabase(
            userId: _currentUser.id);
        if (parent.id.isNotEmpty) {
          _currentUser = parent;
          return true;
        } else {
          //user not found in either collection, something went wrong
          return false;
        }
      }
    }
  }

  void _setAuthenticatedState(BaseAuthenticatedEvent event) {
    _authenticatedState = event;
    _authenticatedChangedController.add(event);
  }

  void _initListeners() {
    authenticationRepository.user.listen(
      (firebase_auth.User? firebaseUser) {
        if (firebaseUser == null) {
          _setAuthenticatedState(const UnauthenticatedEvent());
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
