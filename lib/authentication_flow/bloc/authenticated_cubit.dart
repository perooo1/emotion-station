
/*
import 'dart:async';

import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'authenticated_state.dart';

@Injectable()
class AuthenticatedCubit extends Cubit<BaseAuthenticatedState> {
  AuthenticatedCubit({required this.authenticationRepository}) : super(UnauthenticatedState()) {
    _initListeners();
  }

  final IAuthenticationRepository authenticationRepository;
  late final StreamSubscription<User> _authenticationChangedListener;

  void _initListeners() {
    _authenticationChangedListener = authenticationRepository.user.listen(
      (user) {
        if (user.isEmpty) {
          emit(UnauthenticatedState());
        } else {
          emit(AuthenticatedState());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _authenticationChangedListener.cancel();
    return super.close();
  }
}
*/