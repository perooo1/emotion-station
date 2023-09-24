// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:injectable/injectable.dart';

abstract class IDatabaseRepository {
  FirebaseFirestore get instance;

  Future<void> registerParent({required Parent parent});
  Future<void> registerSpecialist({required Specialist specialist});
}

@Singleton(as: IDatabaseRepository)
class DatabaseRepository implements IDatabaseRepository {
  static const String FIRESTORE_COLLECTION_PARENTS = 'Parents';
  static const String FIRESTORE_COLLECTION_SPECIALISTS = 'Specialists';
  static const String FIRESTORE_COLLECTION_CHILDREN = 'Children';

  @override
  FirebaseFirestore get instance => FirebaseFirestore.instance;

  @override
  Future<void> registerParent({required Parent parent}) {
    // TODO: implement registerParent
    throw UnimplementedError();
  }

  @override
  Future<void> registerSpecialist({required Specialist specialist}) {
    // TODO: implement registerSpecialist
    throw UnimplementedError();
  }
}
