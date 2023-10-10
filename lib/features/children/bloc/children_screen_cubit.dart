import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'children_screen_state.dart';

@Injectable()
class ChildrenScreenCubit extends Cubit<ChildrenScreenState> {
  ChildrenScreenCubit({
    required this.authenticationManager,
    required this.databaseRepository,
  }) : super(ChildrenScreenState(currentUser: User.empty)) {
    _getCurrentUserAndSetState();
    _startListening();
  }

  final IAuthenticationManager authenticationManager;
  final IDatabaseRepository databaseRepository;

  Stream<QuerySnapshot>? _childrenStream;

  Stream<QuerySnapshot> _initStream() {
    return databaseRepository.instance.collection('Children').snapshots();
  }

  void _getCurrentUserAndSetState() {
    try {
      final currentUser = authenticationManager.getCurrentUser();

      if (currentUser is Specialist) {
        emit(state.copyWithCurrentUser(
          currentUser: currentUser,
        ));
      } else {
        emit(state.copyWithCurrentUser(
          currentUser: currentUser,
        ));
      }
    } catch (e) {
      print('error home cubit - getCurrentUserAndSetState');
    }
  }

  void _startListening() {
    _childrenStream = databaseRepository.getChildrenStream(
        parentId: authenticationManager.getCurrentUser().id);

    _childrenStream?.listen(
      (querySnapshot) {
        final List<Child> children = [];
        for (var doc in querySnapshot.docs) {
          children.add(Child.fromJson(doc.data() as Map<String, dynamic>));
        }
        emit(state.copyWith(children: children));
      },
    );
  }
}
