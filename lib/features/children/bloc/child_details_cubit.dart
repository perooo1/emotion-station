import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'child_details_state.dart';

@Injectable()
class ChildDetailsCubit extends Cubit<ChildDetailsState> {
  ChildDetailsCubit({
    @factoryParam required Child child,
    required this.databaseRepository,
  }) : super(ChildDetailsState(child: child));

  final IDatabaseRepository databaseRepository;
}
