import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'station_activity_screen_state.dart';

@Injectable()
class StationActivityScreenCubit extends Cubit<StationActivityScreenState> {
  StationActivityScreenCubit({required this.authenticationManager})
      : super(StationActivityScreenState(currentUser: User.empty)) {
    getCurrentUserAndSetState();
  }

  final IAuthenticationManager authenticationManager;

  Future<void> signParentOut() async {
    try {
      await authenticationManager.signOut();
    } on firebase_auth.FirebaseAuthException catch (error) {
      emit(state.copyWith(currentUser: User(id: 'sign out error')));
    }
  }

  void getCurrentUserAndSetState() {
    try {
      final currentUser = authenticationManager.getCurrentUser();

      if (currentUser is Specialist) {
        emit(state.copyWith(
          currentUser: currentUser,
        ));
      } else {
        emit(state.copyWith(
          currentUser: currentUser,
        ));
      }
    } catch (e) {
      print('error home cubit - getCurrentUserAndSetState');
    }
  }
}
