import 'dart:async';

import 'package:domain_models/domain_models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

abstract class IAuthenticationManager {
  bool get isAuthenticatedInFirebaseRepo;
  bool get isAuthenticated;
  String? get currentUserId;

  Stream<BaseAuthenticatedEvent> get authenticatedChanged;

  Future<void> register({required String email, required String password});
  Future<bool> signIn({required String email, required String password});
  //Future<void> signIn({required String email, required String password});
  Future<void> signOut();
}

@Singleton(as: IAuthenticationManager)
class AuthenticationManager implements IAuthenticationManager {
  AuthenticationManager({required this.authenticationRepository}) {
    _initListeners();
  }

  final IAuthenticationRepository authenticationRepository;
  late final StreamSubscription<firebase_auth.User?> _firebaseUserAuthListener;

  User currentUser = User.empty;
  BaseAuthenticatedEvent _authenticatedState = UnauthenticatedEvent();

////////

  final StreamController<BaseAuthenticatedEvent> _authenticatedChangedController =
      StreamController<BaseAuthenticatedEvent>.broadcast();

  @override
  Stream<BaseAuthenticatedEvent> get authenticatedChanged => _authenticatedChangedController.stream;

////////

  @override
  bool get isAuthenticated => _authenticatedState.isAuthenticated;

  @override
  bool get isAuthenticatedInFirebaseRepo => authenticationRepository.isUserAuthenticated;

  @override
  String? get currentUserId => authenticationRepository.currentUserId;

  @override
  Future<void> signOut() async => await authenticationRepository.signOut();

  @override
  Future<void> register({required String email, required String password}) async =>
      await authenticationRepository.register(email: email, password: password);
/*
  @override
  Future<void> signIn({required String email, required String password}) async =>
      authenticationRepository.signIn(email: email, password: password);
*/

  @override
  Future<bool> signIn({required String email, required String password}) async {
    return await authenticationRepository.signIn(email: email, password: password);
  }

  void _setAuthenticatedState(BaseAuthenticatedEvent event) {
    _authenticatedState = event;
    _authenticatedChangedController.add(event);
  }

  void _initListeners() {
    _firebaseUserAuthListener = authenticationRepository.user.listen(
      (firebase_auth.User? firebaseUser) {
        if (firebaseUser == null) {
          _setAuthenticatedState(UnauthenticatedEvent());
          currentUser = User.empty;
        } else {
          _setAuthenticatedState(AuthenticatedEvent(user: firebaseUser.toUser));
          currentUser = firebaseUser.toUser;
        }
        //currentUser = firebaseUser == null ? User.empty : firebaseUser.toUser;
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
