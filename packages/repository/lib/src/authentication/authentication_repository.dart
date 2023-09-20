import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthenticationRepository {
  bool get isUserAuthenticated;
  String? get currentUserId;

  Future<void> register({required String email, required String password});
  Future<UserCredential> signIn({required String email, required String password});
  Future<void> createUserDocumentInCollection({
    required String email,
    required String password,
    required String name,
  });
  Future<void> signOut();
}

@Singleton(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  late final _auth = FirebaseAuth.instance; // be careful of late?

  //TODO: istrazi Stream<User> za auth state changed

  @override
  String? get currentUserId => _auth.currentUser?.uid ?? '';

  @override
  bool get isUserAuthenticated => _auth.currentUser != null;

  @override
  Future<void> createUserDocumentInCollection({
    required String email,
    required String password,
    required String name,
  }) {
    // TODO: implement createUserDocumentInCollection
    throw UnimplementedError();
  }

  @override
  Future<void> register({required String email, required String password}) async =>
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

  @override
  Future<UserCredential> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  @override
  Future<void> signOut() async => await _auth.signOut();
}
