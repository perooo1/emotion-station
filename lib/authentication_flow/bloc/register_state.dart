part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    this.submissionStatus = SubmissionStatus.idle,
    this.isSpecialist = false,
  });

  final String name;
  final String lastName;
  final String email;
  final String password;
  final SubmissionStatus submissionStatus;
  final bool isSpecialist;

  RegisterState copyWith({
    String? name,
    String? lastName,
    String? email,
    String? password,
    SubmissionStatus? submissionStatus,
    bool? isSpecialist,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      isSpecialist: isSpecialist ?? this.isSpecialist,
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        name,
        lastName,
        email,
        password,
        submissionStatus,
        isSpecialist,
      ];
}
