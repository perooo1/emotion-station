// Package imports:
import 'package:equatable/equatable.dart';
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

  Future<void> onRegisterSubmit() async {}
}
