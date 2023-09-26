// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:injectable/injectable.dart';

abstract class IDatabaseRepository {
  FirebaseFirestore get instance;

  Future<bool> registerParent({required Parent parent});
  Future<bool> registerSpecialist({required Specialist specialist});
}

@Singleton(as: IDatabaseRepository)
class DatabaseRepository implements IDatabaseRepository {
  final String FIRESTORE_COLLECTION_PARENTS = 'Parents';
  final String FIRESTORE_COLLECTION_SPECIALISTS = 'Specialists';
  final String FIRESTORE_COLLECTION_CHILDREN = 'Children';

  @override
  FirebaseFirestore get instance => FirebaseFirestore.instance;

  @override
  Future<bool> registerParent({required Parent parent}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_PARENTS)
          .doc(parent.id)
          .set(parent.toJson(), SetOptions(merge: true))
          .then((value) => print('parent added'));

      return true;
    } on FirebaseException catch (e) {
      print('Error adding parent document: $e');
      return false;
    }
  }

  @override
  Future<bool> registerSpecialist({required Specialist specialist}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_SPECIALISTS)
          .doc(specialist.id)
          .set(specialist.toJson(), SetOptions(merge: true))
          .then((value) => print('specialist added'));

      return true;
    } on FirebaseException catch (e) {
      print('Error adding specialist document: $e');
      return false;
    }
  }
}
