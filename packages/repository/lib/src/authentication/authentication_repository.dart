import 'package:domain_models/domain_models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';

abstract class IAuthenticationRepository {
  Stream<firebase_auth.User?> get user;
  //Stream<User> get user;

  bool get isUserAuthenticated;
  String? get currentUserId;

  Future<void> register({required String email, required String password});
  Future<bool> signIn({required String email, required String password});
  //Future<void> signIn({required String email, required String password});
  Future<void> signOut();
  //Future<firebase_auth.UserCredential> signIn({required String email, required String password});
/*
  Future<void> createUserDocumentInCollection({
    required String email,
    required String password,
    required String name,
  });
*/
}

@Singleton(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  late final _auth = firebase_auth.FirebaseAuth.instance; // be careful of late?

/*
  @override
  Stream<User> get user {
    return _auth.authStateChanges().map(
      (firebaseUser) {
        final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
        return user;
      },
    );
  }
*/

  @override
  Stream<firebase_auth.User?> get user {
    return _auth.authStateChanges().map((event) => event);
  }

  @override
  String? get currentUserId => _auth.currentUser?.uid ?? '';

  @override
  bool get isUserAuthenticated => _auth.currentUser != null;

/*
  @override
  Future<void> createUserDocumentInCollection({
    required String email,
    required String password,
    required String name,
  }) {
    // TODO: implement createUserDocumentInCollection
    throw UnimplementedError();
  }
*/
  @override
  Future<void> register({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

/*
  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }

/*
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
*/
  }
*/
  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (response.user?.uid != null) {
        return true;
      } else {
        return false;
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  @override
  Future<void> signOut() async => await _auth.signOut();
}

/*
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
*/