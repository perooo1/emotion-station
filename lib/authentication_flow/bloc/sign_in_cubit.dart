// Package imports:
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'sign_in_state.dart';

@Injectable()
class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.authenticationManager,
    required this.secureStorageRepository,
  }) : super(const SignInState(email: '', password: '')) {
    _readRememberedLoginData();
  }

  final IAuthenticationManager authenticationManager;
  final ISecureStorageRepository secureStorageRepository;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void saveEmailToState(String email) {
    emit(state.copyWith(email: email));
  }

  void savePwdToState(String pwd) {
    emit(state.copyWith(password: pwd));
  }

  Future<void> _readRememberedLoginData() async {
    emit(
      state.copyWith(
        email: await secureStorageRepository.readEmail(SecureStorageRepository.EMAIL_KEY) ?? '',
        password:
            await secureStorageRepository.readPassword(SecureStorageRepository.PASSWORD_KEY) ?? '',
      ),
    );

    emailController.text = state.email;
    passwordController.text = state.password;
  }

  void setRememberLogin(bool value) => emit(state.copyWith(rememberLogin: value));

  Future<void> onLoginSubmit() async {
    try {
      emit(state.copyWith(submissionStatus: SubmissionStatus.inProgress));

      if (state.rememberLogin == true) {
        secureStorageRepository.writeEmail(SecureStorageRepository.EMAIL_KEY, state.email);
        secureStorageRepository.writePassword(SecureStorageRepository.PASSWORD_KEY, state.password);
      }
      final isSuccess =
          await authenticationManager.signIn(email: state.email, password: state.password);
      if (isSuccess == true) {
        emit(state.copyWith(submissionStatus: SubmissionStatus.success));
      } else {
        print('is success in sign in cubit is ${isSuccess.toString()}');
        emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
      }
    } on FirebaseAuthException catch (error) {
      print(error.message);
      emit(state.copyWith(submissionStatus: SubmissionStatus.invalidCredentialsError));
    }

/*
    try {
      emit(state.copyWith(submissionStatus: SubmissionStatus.inProgress));
      final isSuccess =
          await authenticationManager.signIn(email: state.email, password: state.password);
      if (isSuccess == true) {
        emit(state.copyWith(submissionStatus: SubmissionStatus.success));
      } else {
        print('is success in sign in cubit is ${isSuccess.toString()}');
        emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
      }
    } on FirebaseAuthException catch (error) {
      print(error.message);
      emit(state.copyWith(submissionStatus: SubmissionStatus.invalidCredentialsError));
    }
*/
  }

  Future<void> signOut() async {
    try {
      await authenticationManager.signOut();
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
    }
  }
}
