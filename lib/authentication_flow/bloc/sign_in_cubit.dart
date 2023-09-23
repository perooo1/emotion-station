import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'sign_in_state.dart';

@Injectable()
class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authenticationRepository})
      : super(const SignInState(email: '', password: ''));

  final IAuthenticationRepository authenticationRepository;

  void saveEmailToState(String email) {
    emit(state.copyWith(email: email));
  }

  void savePwdToState(String pwd) {
    emit(state.copyWith(password: pwd));
  }

  Future<void> onLoginSubmit() async {
    try {
      await authenticationRepository.signIn(email: state.email, password: state.password);
    } catch (error) {
      emit(state.copyWith(
          submissionStatus:
              error is Exception ? SubmissionStatus.genericError : SubmissionStatus.genericError));
    }
  }

  Future<void> signOut() async {
    try {
      await authenticationRepository.signOut();
    } catch (error) {
      emit(state.copyWith(
          submissionStatus: error is Exception
              ? SubmissionStatus.invalidCredentialsError
              : SubmissionStatus.invalidCredentialsError));
    }
  }
}
