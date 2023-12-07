// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.authenticationManager,
    required this.databaseRepository,
  }) : super(HomeState(currentUser: User.empty)) {
    _getCurrentUserAndSetState();
    _startListening();
  }

  final IAuthenticationManager authenticationManager;
  final IDatabaseRepository databaseRepository;

  Stream<QuerySnapshot>? _childrenStream;

  void onChildSelected(Child selectedChild) {
    emit(state.copyWith(selectedChild: selectedChild));
  }

  Future<void> signOutHome() async {
    try {
      await authenticationManager.signOut();
    } on firebase_auth.FirebaseAuthException catch (error) {
      emit(state.copyWith(currentUser: User(id: 'sign out error')));
    }
  }

  Future<void> declineSpecialistConnection() async {
    emit(state.copyWith(specialistConnectionDialogShown: true));
    await databaseRepository.declineSpecialistConnection(parentId: state.currentUser.id);
    //potencijalni ponovni emit current usera?
  }

  Future<void> approveSpecialistConnection() async {
    emit(state.copyWith(specialistConnectionDialogShown: true));
    await databaseRepository.approveSpecialistConnection(parentId: state.currentUser.id);
    //potencijalni ponovni emit current usera?
  }

  void _getCurrentUserAndSetState() {
    try {
      final currentUser = authenticationManager.getCurrentUser();

      if (currentUser is Specialist) {
        emit(state.copyWith(
          currentUser: currentUser,
        ));
      } else {
        emit(state.copyWith(
          currentUser: currentUser,
        ));
      }
    } catch (e) {
      print('error home cubit - getCurrentUserAndSetState');
    }
  }

  void _startListening() {
    if (authenticationManager.getCurrentUser() is Specialist) {
      // kod specialista ne trebam tu listu u home screenu

/*
      _childrenStream = databaseRepository.getChildrenStream(
        specialistId: authenticationManager.getCurrentUser().id,
      );

      _childrenStream?.listen(
        (querySnapshot) {
          final List<Child> children = [];
          for (var doc in querySnapshot.docs) {
            children.add(Child.fromJson(doc.data() as Map<String, dynamic>));
          }
          emit(state.copyWith(children: children));
        },
      );
*/
    } else {
      _childrenStream = databaseRepository.getChildrenStream(
        parentId: authenticationManager.getCurrentUser().id,
      );

      _childrenStream?.listen(
        (querySnapshot) {
          final List<Child> children = [];
          for (var doc in querySnapshot.docs) {
            children.add(Child.fromJson(doc.data() as Map<String, dynamic>));
          }
          emit(state.copyWith(children: children, selectedChild: children.first));
        },
      );
    }
  }
}
