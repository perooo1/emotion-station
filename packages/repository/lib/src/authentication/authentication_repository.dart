// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthenticationRepository {
  Stream<User?> get user;

  bool get isUserAuthenticated;
  String? get currentUserId;

  Future<bool> register({required String email, required String password});
  Future<bool> signIn({required String email, required String password});
  Future<void> signOut();
}

@Singleton(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository();

  late final _auth = FirebaseAuth.instance;

  @override
  Stream<User?> get user {
    return _auth.authStateChanges().map((event) => event);
  }

  @override
  String? get currentUserId => _auth.currentUser?.uid ?? '';

  @override
  bool get isUserAuthenticated => _auth.currentUser != null;

  @override
  Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
        //the user is signed in autmatically
        email: email,
        password: password,
      );
      return response.user?.uid != null ? true : false;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return response.user?.uid != null ? true : false;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  @override
  Future<void> signOut() async => await _auth.signOut();
}
