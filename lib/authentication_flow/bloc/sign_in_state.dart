part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.email,
    required this.password,
    this.submissionStatus = SubmissionStatus.idle,
    this.testUser,
  });

  final String email;
  final String password;
  final SubmissionStatus submissionStatus;
  final User? testUser;

  SignInState copyWith({
    String? email,
    String? password,
    SubmissionStatus? submissionStatus,
    User? testUser,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      testUser: testUser ?? this.testUser,
    );
  }

  @override
  List<Object?> get props => [email, password, submissionStatus, testUser];
}

enum SubmissionStatus {
  idle,

  inProgress,

  success,

  genericError,

  invalidCredentialsError,
}
