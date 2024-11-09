// Package imports:
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/bloc/sign_in_cubit.dart';

part 'register_state.dart';

@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authenticationManager})
      : super(
          const RegisterState(
            name: '',
            lastName: '',
            email: '',
            password: '',
          ),
        );

  final IAuthenticationManager authenticationManager;

  void saveEmailToState(String email) {
    emit(state.copyWith(email: email));
  }

  void savePwdToState(String pwd) {
    emit(state.copyWith(password: pwd));
  }

  void saveNameToState(String name) {
    emit(state.copyWith(name: name));
  }

  void saveLastNameToState(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void setIsSpecialist(bool isSpecialist) {
    emit(state.copyWith(isSpecialist: isSpecialist));
  }

  Future<void> onRegisterSubmit() async {
    try {
      emit(state.copyWith(submissionStatus: SubmissionStatus.inProgress));
      final isSuccess =
          await authenticationManager.registerUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      if (isSuccess) {
        final newUserId = authenticationManager.currentUserId!;
        try {
          final successfull =
              await authenticationManager.registerUserInDatabase(
            user: state.isSpecialist
                ? Specialist(
                    id: newUserId,
                    isSpecialist: state.isSpecialist,
                    name: state.name,
                    lastName: state.lastName,
                    email: state.email,
                  )
                : Parent(
                    id: newUserId,
                    isSpecialist: state.isSpecialist,
                    name: state.name,
                    lastName: state.lastName,
                    email: state.email,
                  ),
          );

          successfull
              ? emit(state.copyWith(submissionStatus: SubmissionStatus.success))
              : emit(state.copyWith(
                  submissionStatus: SubmissionStatus.genericError));
        } on FirebaseException catch (_) {
          emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
        }
      }
    } on FirebaseAuthException catch (_) {
      emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
    }
  }
}
