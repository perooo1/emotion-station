part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.email,
    required this.password,
    this.submissionStatus = SubmissionStatus.idle,
  });

  final String email;
  final String password;
  final SubmissionStatus submissionStatus;

  SignInState copyWith({
    String? email,
    String? password,
    SubmissionStatus? submissionStatus,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, submissionStatus];
}

enum SubmissionStatus {
  idle,
  inProgress,
  success,
  genericError,
  invalidCredentialsError,
}
