// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:repository/src/database/database_repository.dart';

abstract class IParentRepository {
  Future<bool> createParent({required String email, required String password});
}

@Injectable(as: IParentRepository)
class ParentRepository implements IParentRepository {
  ParentRepository({required this.databaseRepository});

  final IDatabaseRepository databaseRepository;

  @override
  Future<bool> createParent({required String email, required String password}) {
    // TODO: implement createParent
    throw UnimplementedError();
  }
}
