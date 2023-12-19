part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.email,
    required this.password,
    this.submissionStatus = SubmissionStatus.idle,
    this.rememberLogin = false,
  });

  final String email;
  final String password;
  final SubmissionStatus submissionStatus;
  final bool rememberLogin;

  SignInState copyWith({
    String? email,
    String? password,
    SubmissionStatus? submissionStatus,
    bool? rememberLogin,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      rememberLogin: rememberLogin ?? this.rememberLogin,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        submissionStatus,
        rememberLogin,
      ];
}

enum SubmissionStatus {
  idle,
  inProgress,
  success,
  genericError,
  invalidCredentialsError,
}
