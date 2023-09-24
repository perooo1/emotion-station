import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'sign_in_state.dart';

@Injectable()
class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authenticationManager})
      : super(const SignInState(email: '', password: ''));

  final IAuthenticationManager authenticationManager;
  //final IAuthenticationRepository authenticationRepository;

  void saveEmailToState(String email) {
    emit(state.copyWith(email: email));
  }

  void savePwdToState(String pwd) {
    emit(state.copyWith(password: pwd));
  }

  Future<void> onLoginSubmit() async {
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
  }

  Future<void> signOut() async {
    try {
      await authenticationManager.signOut();
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(submissionStatus: SubmissionStatus.genericError));
    }
  }
}
