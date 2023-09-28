// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:injectable/injectable.dart';

abstract class IDatabaseRepository {
  FirebaseFirestore get instance;

  Future<bool> registerParent({required Parent parent});
  Future<bool> registerSpecialist({required Specialist specialist});

  Future<Parent> getParentFromDatabase({required String userId});
  Future<Specialist> getSpecialistFromDatabase({required String userId});
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
      print('DB MANAGER - registerSpecialist() : Error adding parent document: $e');
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
      print('DB MANAGER - registerSpecialist() : Error adding specialist document: $e');
      return false;
    }
  }

  @override
  Future<Parent> getParentFromDatabase({required String userId}) async {
    try {
      final snapshot = await instance.collection(FIRESTORE_COLLECTION_PARENTS).doc(userId).get();
      if (snapshot.data() != null) {
        return Parent.fromJson(snapshot.data()!);
      } else {
        print('DB MANAGER - getParentFromDatabase() : getParentFromDatabase snapshot data is null');
        return Parent(id: '');
      }
    } on FirebaseException catch (e) {
      print('DB MANAGER - getParentFromDatabase() : error reading parent doc from database: $e');

      return Parent(id: '');
    }
  }

  @override
  Future<Specialist> getSpecialistFromDatabase({required String userId}) async {
    try {
      final snapshot =
          await instance.collection(FIRESTORE_COLLECTION_SPECIALISTS).doc(userId).get();
      if (snapshot.data() != null) {
        return Specialist.fromJson(snapshot.data()!);
      } else {
        print(
            'DB MANAGER - getParentFromDatabase() : getSpecialistFromDatabase snapshot data is null');
        return Specialist(id: '');
      }
    } on FirebaseException catch (e) {
      print(
          'DB MANAGER - getParentFromDatabase() : error reading specialist doc from database: $e');
      return Specialist(id: '');
    }
  }
}
