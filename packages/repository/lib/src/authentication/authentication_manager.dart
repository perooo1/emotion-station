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
    //getCurrentUser(); jel ovo ima smisla?
  }

  final IAuthenticationRepository authenticationRepository;
  final IDatabaseRepository databaseRepository;

  User _currentUser = User.empty;
  BaseAuthenticatedEvent _authenticatedState = UnauthenticatedEvent();

  final StreamController<BaseAuthenticatedEvent> _authenticatedChangedController =
      StreamController<BaseAuthenticatedEvent>.broadcast();

  @override
  User getCurrentUser() =>
      _currentUser; //ovo bi trebalo vratiti ili Parent ili Specialist, ovisno o tome šta je postaljeno u sign in funkciji i onda u svakom cubitu moram provjeravat

/*
  @override
  Future<User> getCurrentUser() async {
    return _currentUser
            .isSpecialist // ovdje mi pravi problem jer ona exstenzija dolje mi stavlja odma po defaultu da je null
        ? await databaseRepository.getSpecialistFromDatabase(userId: _currentUser.id)
        : await databaseRepository.getParentFromDatabase(userId: _currentUser.id);

  }
*/

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
      final a = await databaseRepository.registerParent(parent: user);
      //ovdje isto postavit neki current user na taj objekt ili odmah sign out pa sign in

      if (a == true) {
        _currentUser = await databaseRepository.getParentFromDatabase(userId: user.id);
        return true;
      }
      return false;
    } else if (user is Specialist) {
      final b = await databaseRepository.registerSpecialist(specialist: user);

      if (b == true) {
        _currentUser = await databaseRepository.getSpecialistFromDatabase(userId: user.id);
        return true;
      }
      return false;
    } else {
      print('auth manager - register user in db is false');
      return false;
    }

/*
    if (user is Parent) {
      return await databaseRepository.registerParent(parent: user);
      //ovdje isto postavit neki current user na taj objekt ili odmah sign out pa sign in

    } else if (user is Specialist) {
      return await databaseRepository.registerSpecialist(specialist: user);
    } else {
      print('auth manager - register user in db is false');
      return false;
    }
*/
  }

/////////////////////////////
/*
  @override
  Future<bool> signIn({required String email, required String password}) async {
/*
    return await authenticationRepository.signIn(
      email: email,
      password: password,
    );
*/
    final isSignInSuccess = await authenticationRepository.signIn(email: email, password: password);

    if (isSignInSuccess == false) {
      print('AUTH MANAGER - signIn() : sign in succes je false : ${isSignInSuccess.toString()}');
      return false;
    } else {
      // nađi user id i prođi kroz jendnu kolekciju kolekciu. ako ne postoji u njoj prođi kroz drugu,
      // nađi, serilaliziraj objekt i postavi ga u neku "current user" varijablu u manageru
      // onda svaki put u cubitu moram provjeravat iz managera je li logiran parent ili specialist

      //prvo ćemo proći kroz specijaliste
      //delay cisto iz razloga da ako je uspjesno authentikaxija prosla da se stigne postavit ova moja _current user varijabla iz koje vadim id da ne bi bilo gresaka

      await Future.delayed(
        Duration(seconds: 2),
        () async {
          print(
              'AUTH MANAGER - signIn() : inside delay funcktion, current user id is: ${_currentUser.id}');
          final specialac =
              await databaseRepository.getSpecialistFromDatabase(userId: _currentUser.id);
          if (specialac.id.isNotEmpty) {
            _currentUser = specialac;
            return true;
          } else {
            print('AUTH MANAGER - signIn() : specialac id is empty : ${specialac.id}');
            //znači nije pronađen korisnik u kolekciji specijalisti, dakle mora bit u kolekciji parent
            final mater = await databaseRepository.getParentFromDatabase(userId: _currentUser.id);

            if (mater.id.isNotEmpty) {
              _currentUser = mater;
              return true;
            } else {
              //znači nije pronađen korisnik u kolekciji parents, nesta gadno ne stima!!
              print('AUTH MANAGER - signIn() : mater id is empty : ${mater.id}');
              return false;
            }
          }
        },
      );

      return true;
    }
    // ako je sve u redu, do ove dvije linije ne bi trebao doci
  }
*/

///////////////////////////

  @override
  Future<bool> signIn({required String email, required String password}) async {
/*
    return await authenticationRepository.signIn(
      email: email,
      password: password,
    );
*/
    final isSignInSuccess = await authenticationRepository.signIn(email: email, password: password);

    if (isSignInSuccess == false) {
      print('AUTH MANAGER - signIn() : sign in succes je false : ${isSignInSuccess.toString()}');
      return false;
    } else {
      final specialac = await databaseRepository.getSpecialistFromDatabase(userId: _currentUser.id);
      if (specialac.id.isNotEmpty) {
        _currentUser = specialac;
        return true;
      } else {
        print('AUTH MANAGER - signIn() : specialac id is empty : ${specialac.id}');
        //znači nije pronađen korisnik u kolekciji specijalisti, dakle mora bit u kolekciji parent
        final mater = await databaseRepository.getParentFromDatabase(userId: _currentUser.id);

        if (mater.id.isNotEmpty) {
          _currentUser = mater;
          return true;
        } else {
          //znači nije pronađen korisnik u kolekciji parents, nesta gadno ne stima!!
          print('AUTH MANAGER - signIn() : mater id is empty : ${mater.id}');
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
/*
  Parent toParent({required String? assignedSpecialistId, required List<Child>? children}) {
    return Parent(
      id: uid,
      isSpecialist: false,
      name: parentName,
      lastName: parentLastName,
      email: email,
      password: pwd,
      assignedSpecialistId: assignedSpecialistId,
      children: children,
    );
  }

  Specialist toSpecialist({
    List<String>? connectedParents,
    required List<String>? assignedhildren,
  }) {
    return Specialist(
      id: uid,
      isSpecialist: true,
      name: specialistName,
      lastName: specialistLastName,
      email: email,
      password: pwd,
      assignedChildren: assignedhildren,
      connectedParents: connectedParents,
    );
  }

*/
}
