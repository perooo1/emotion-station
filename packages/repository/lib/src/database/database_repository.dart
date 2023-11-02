// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:injectable/injectable.dart';

abstract class IDatabaseRepository {
  FirebaseFirestore get instance;

  //streams
  Stream<QuerySnapshot> getChildrenStream({String? parentId, String? specialistId});

  //write
  Future<bool> createChildInDatabase({required Child child, required String parentId});
  Future<bool> connectSpecialistWithParent({
    required String parentEmail,
    required String currentSpecialistId,
  });
  Future<bool> recordCompletedActivity({required ActivityRecord activityRecord});
  Future<bool> registerParent({required Parent parent});
  Future<bool> registerSpecialist({required Specialist specialist});

  //read
  Future<Child> getChildFromDatabase({required String childId});
  Future<Parent> getParentFromDatabase({required String userId});
  Future<Specialist> getSpecialistFromDatabase({required String userId});
}

@Singleton(as: IDatabaseRepository)
class DatabaseRepository implements IDatabaseRepository {
  final String FIRESTORE_COLLECTION_ACTIVITY_RECORDS = 'ActivityRecords';
  final String FIRESTORE_COLLECTION_CHILDREN = 'Children';
  final String FIRESTORE_COLLECTION_PARENTS = 'Parents';
  final String FIRESTORE_COLLECTION_SPECIALISTS = 'Specialists';

  @override
  FirebaseFirestore get instance => FirebaseFirestore.instance;

  //streams

  Stream<QuerySnapshot> getChildrenStream({String? parentId, String? specialistId}) {
    final bool isSpecialist = specialistId != null;
    if (parentId == null && specialistId == null) {
      throw FormatException('Both parent and specialist are null!');
    }

    return isSpecialist
        ? instance
            .collection(FIRESTORE_COLLECTION_CHILDREN)
            .where('assignedSpecialistId', isEqualTo: specialistId)
            .snapshots()
        : instance
            .collection(FIRESTORE_COLLECTION_CHILDREN)
            .where('parentId', isEqualTo: parentId)
            .snapshots();
  }

  //write

  @override
  Future<bool> createChildInDatabase({required Child child, required String parentId}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_CHILDREN)
          .doc(child.id)
          .set(child.toJson(), SetOptions(merge: true))
          .then((value) => print('child added'));

      var a = await _connectChildWithParent(childId: child.id, parentDocId: parentId);

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
  Future<bool> recordCompletedActivity({required ActivityRecord activityRecord}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_ACTIVITY_RECORDS)
          .doc(
              '${activityRecord.emotionStation.activityType.name}-${activityRecord.childId}-${activityRecord.timeOfActivity.toString()}')
          .set(activityRecord.toJson(), SetOptions(merge: true))
          .then((value) => print('activity record'));

      return true;
    } on FirebaseException catch (e) {
      print('DB MANAGER - recordCompletedActivity() : Error adding activity record document: $e');
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
  Future<bool> connectSpecialistWithParent({
    required String parentEmail,
    required String currentSpecialistId,
  }) async {
    try {
      final querySnapshot = await instance
          .collection(FIRESTORE_COLLECTION_PARENTS)
          .where('email', isEqualTo: parentEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot parent = querySnapshot.docs[0];
        final String parentId = parent.id;

        await instance
            .collection(FIRESTORE_COLLECTION_PARENTS)
            .doc(parentId)
            .update({'assignedSpecialistId': currentSpecialistId});

        final a = await _assignSpecialistToChild(
          currentSpecialistId: currentSpecialistId,
          parentId: parentId,
        );
        print('db repo, a is $a');
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      print(
          'DB MANAGER - connectSpecialistWithParent() : Error connecting specialist with parent: $e');
      return false;
    }
  }

//read

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

  Future<bool> _assignSpecialistToChild({
    required String currentSpecialistId,
    required String parentId,
  }) async {
    try {
      final querySnapshot = await instance
          .collection(FIRESTORE_COLLECTION_CHILDREN)
          .where('parentId', isEqualTo: parentId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach(
          (DocumentSnapshot child) async {
            await instance
                .collection(FIRESTORE_COLLECTION_CHILDREN)
                .doc(child.id)
                .update({'assignedSpecialistId': currentSpecialistId});
          },
        );
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      print('DB MANAGER - _assignSpecialistToChild() : Error assigning specialist to child: $e');
      return false;
    }
  }
}
