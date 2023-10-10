// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:injectable/injectable.dart';

abstract class IDatabaseRepository {
  FirebaseFirestore get instance;

  //streams
  Stream<QuerySnapshot> getChildrenStream({required String parentId});

  //read-write
  Future<bool> createChildInDatabase({required Child child, required String parrentId});
  Future<bool> registerParent({required Parent parent});
  Future<bool> registerSpecialist({required Specialist specialist});

  Future<Child> getChildFromDatabase({required String childId});
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

  //streams

  @override
  Stream<QuerySnapshot> getChildrenStream({required String parentId}) => instance
      .collection(FIRESTORE_COLLECTION_CHILDREN)
      .where("parentId", isEqualTo: parentId)
      .snapshots();

  //read-write

  @override
  Future<bool> createChildInDatabase({required Child child, required String parrentId}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_CHILDREN)
          .doc(child.id)
          .set(child.toJson(), SetOptions(merge: true))
          .then((value) => print('child added'));

      var a = await _connectChildWithParent(childId: child.id, parentDocId: parrentId);

      return true;
    } on FirebaseException catch (e) {
      print('DB MANAGER - createChildInDatabase() : Error adding child document: $e');
      return false;
    }
  }

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
  Future<Child> getChildFromDatabase({required String childId}) async {
    try {
      final snapshot = await instance.collection(FIRESTORE_COLLECTION_CHILDREN).doc(childId).get();
      if (snapshot.data() != null) {
        return Child.fromJson(snapshot.data()!);
      } else {
        print('DB MANAGER - getParentFromDatabase() : getParentFromDatabase snapshot data is null');
        return Child(
          id: '',
          parentId: '',
          name: '',
          lastName: '',
          age: 0,
          isGenderMale: true,
          diagnosis: '',
        );
      }
    } on FirebaseException catch (e) {
      print('DB MANAGER - getParentFromDatabase() : error reading parent doc from database: $e');
      return Child(
        id: '',
        parentId: '',
        name: '',
        lastName: '',
        age: 0,
        isGenderMale: true,
        diagnosis: '',
      );
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

  Future<bool> _connectChildWithParent(
      {required String childId, required String parentDocId}) async {
    // need to pass parent Id (which is currently logged in user)
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_PARENTS)
          .doc(parentDocId)
          .update(
            {
              "children": FieldValue.arrayUnion([childId])
            },
          )
          .then((value) => print("addded child to parent"))
          .catchError((err) {
            print("Failed to add child to user $parentDocId");
            return false;
          });
      return true;
    } on FirebaseException catch (e) {
      print('DB MANAGER - _connectChildWithParent() : Error adding achild to parent document: $e');
      return false;
    }
  }
}
