import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'info_screen_state.dart';

@Injectable()
class InfoScreenCubit extends Cubit<InfoScreenState> {
  InfoScreenCubit({
    required this.authenticationManager,
    required this.databaseRepository,
  }) : super(InfoScreenState(currentUser: User.empty)) {
    getCurrentUserAndSetState();
    _startListening();
  }

  final IAuthenticationManager authenticationManager;
  final IDatabaseRepository databaseRepository;

  Stream<QuerySnapshot>? _specialistStream;

  Future<void> signOut() async {
    try {
      await authenticationManager.signOut();
    } on firebase_auth.FirebaseAuthException catch (error) {
      emit(state.copyWith(currentUser: User(id: 'sign out error')));
    }
  }

  void getCurrentUserAndSetState() {
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
    final currentUser = authenticationManager.getCurrentUser();

    if (currentUser is Parent) {
      if (currentUser.assignedSpecialistId == null) {
        emit(state.copyWith(specialist: Specialist(id: '')));
      } else {
        _specialistStream =
            databaseRepository.getSpecialistStream(specialistId: currentUser.assignedSpecialistId);
      }
    } else {
      _specialistStream = databaseRepository.getSpecialistStream(specialistId: currentUser.id);
    }

    _specialistStream?.listen(
      (querySnapshot) {
        final Specialist specialist =
            Specialist.fromJson(querySnapshot.docs[0].data() as Map<String, dynamic>);

        emit(state.copyWith(specialist: specialist));
      },
    );
  }
}
