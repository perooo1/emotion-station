// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:injectable/injectable.dart';

abstract class IDatabaseRepository {
  FirebaseFirestore get instance;

  //streams
  Stream<QuerySnapshot> getChildrenStream(
      {String? parentId, String? specialistId});
  Stream<QuerySnapshot> getRecordedActivitiesStream({String? childId});
  Stream<QuerySnapshot> getSingleChildStream({String? childId});
  Stream<QuerySnapshot> getSpecialistStream({String? specialistId});

  //write
  Future<bool> createChildInDatabase(
      {required Child child, required String parentId});
  Future<bool> connectSpecialistWithParent({
    required String parentEmail,
    required String currentSpecialistId,
  });
  Future<bool> recordCompletedActivity(
      {required ActivityRecord activityRecord});
  Future<bool> registerParent({required Parent parent});
  Future<bool> registerSpecialist({required Specialist specialist});
  Future<bool> updateChildEmotionForecast({
    required String childId,
    required Map<DateTime, EmotionForecast>? forecast,
  });
  Future<bool> addSpecialistNoteChild(
      {required String childId, required String? specialistNote});
  Future<bool> addSpecialistNoteActivityRecord(
      {required String activityRecordId, required String? specialistNote});
  Future<bool> addParentNoteActivityRecord(
      {required String activityRecordId, required String? parentNote});

  //read
  Future<Child> getChildFromDatabase({required String childId});
  Future<Parent> getParentFromDatabase({required String userId});
  Future<Specialist> getSpecialistFromDatabase({required String userId});

  //update
  Future<bool> declineSpecialistConnection({required String parentId});
  Future<bool> approveSpecialistConnection({required String parentId});
  Future<bool> updateSpecialistInformation({
    required String specialistId,
    required String occupation,
    required String workplace,
    required String workHours,
    required String professionalPhoneNum,
    required String additionalEducation,
  });
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

  @override
  Stream<QuerySnapshot> getChildrenStream(
      {String? parentId, String? specialistId}) {
    final bool isSpecialist = specialistId != null;
    if (parentId == null && specialistId == null) {
      throw const FormatException('Both parent and specialist are null!');
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

  @override
  Stream<QuerySnapshot<Object?>> getRecordedActivitiesStream(
      {String? childId}) {
    if (childId == null) {
      throw const FormatException('Both parent and specialist are null!');
    }
    return instance
        .collection(FIRESTORE_COLLECTION_ACTIVITY_RECORDS)
        .where('childId', isEqualTo: childId)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot> getSingleChildStream({String? childId}) {
    if (childId == null) {
      throw const FormatException('Child id is null!');
    }
    return instance
        .collection(FIRESTORE_COLLECTION_CHILDREN)
        .where('id', isEqualTo: childId)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Object?>> getSpecialistStream({String? specialistId}) {
    if (specialistId == null) {
      throw const FormatException('Specialist id is null!');
    }
    return instance
        .collection(FIRESTORE_COLLECTION_SPECIALISTS)
        .where('id', isEqualTo: specialistId)
        .snapshots();
  }

  //write

  @override
  Future<bool> createChildInDatabase(
      {required Child child, required String parentId}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_CHILDREN)
          .doc(child.id)
          .set(child.toJson(), SetOptions(merge: true))
          .then((value) => print('child added'));

      await _connectChildWithParent(childId: child.id, parentDocId: parentId);

      return true;
    } on FirebaseException catch (_) {
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
    } on FirebaseException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> recordCompletedActivity(
      {required ActivityRecord activityRecord}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_ACTIVITY_RECORDS)
          .doc(
              '${activityRecord.emotionStation.activityType.name}-${activityRecord.childId}-${activityRecord.timeOfActivity.toString()}')
          .set(activityRecord.toJson(), SetOptions(merge: true))
          .then((value) => print('activity record'));

      return true;
    } on FirebaseException catch (_) {
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
    } on FirebaseException catch (_) {
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

        await _assignSpecialistToChild(
          currentSpecialistId: currentSpecialistId,
          parentId: parentId,
        );
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateChildEmotionForecast({
    required String childId,
    required Map<DateTime, EmotionForecast>? forecast,
  }) async {
    try {
      final Map<String, String> convertedForecast = forecast?.map(
            (key, value) => MapEntry(key.toString(), value.name.toString()),
          ) ??
          {};

      await instance
          .collection(FIRESTORE_COLLECTION_CHILDREN)
          .doc(childId)
          .update({'emotionForecast': convertedForecast});

      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }

  @override
  Future<bool> addSpecialistNoteChild(
      {required String childId, required String? specialistNote}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_CHILDREN)
          .doc(childId)
          .update({'specialistNote': specialistNote});

      return true;
    } on FirebaseException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> addParentNoteActivityRecord(
      {required String activityRecordId, required String? parentNote}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_ACTIVITY_RECORDS)
          .doc(activityRecordId)
          .update({'parentNote': parentNote});

      return true;
    } on FirebaseException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> addSpecialistNoteActivityRecord(
      {required String activityRecordId,
      required String? specialistNote}) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_ACTIVITY_RECORDS)
          .doc(activityRecordId)
          .update({'specialistNote': specialistNote});

      return true;
    } on FirebaseException catch (_) {
      return false;
    }
  }

//read

  @override
  Future<Child> getChildFromDatabase({required String childId}) async {
    try {
      final snapshot = await instance
          .collection(FIRESTORE_COLLECTION_CHILDREN)
          .doc(childId)
          .get();
      if (snapshot.data() != null) {
        return Child.fromJson(snapshot.data()!);
      } else {
        return Child(
          id: '',
          parentId: '',
          name: '',
          lastName: '',
          age: 0,
          isGenderMale: true,
          diagnosis: '',
          attendsKindergarten: false,
          riskyPregnancy: false,
          pregnancyBirthWeek: 22,
          treatmentStartMonth: DateTime.now(),
        );
      }
    } on FirebaseException catch (_) {
      return Child(
        id: '',
        parentId: '',
        name: '',
        lastName: '',
        age: 0,
        isGenderMale: true,
        diagnosis: '',
        attendsKindergarten: false,
        riskyPregnancy: false,
        pregnancyBirthWeek: 22,
        treatmentStartMonth: DateTime.now(),
      );
    }
  }

  @override
  Future<Parent> getParentFromDatabase({required String userId}) async {
    try {
      final snapshot = await instance
          .collection(FIRESTORE_COLLECTION_PARENTS)
          .doc(userId)
          .get();
      if (snapshot.data() != null) {
        return Parent.fromJson(snapshot.data()!);
      } else {
        return Parent(id: '');
      }
    } on FirebaseException catch (_) {
      return Parent(id: '');
    }
  }

  @override
  Future<Specialist> getSpecialistFromDatabase({required String userId}) async {
    try {
      final snapshot = await instance
          .collection(FIRESTORE_COLLECTION_SPECIALISTS)
          .doc(userId)
          .get();
      if (snapshot.data() != null) {
        return Specialist.fromJson(snapshot.data()!);
      } else {
        return Specialist(id: '');
      }
    } on FirebaseException catch (_) {
      return Specialist(id: '');
    }
  }

  Future<bool> _connectChildWithParent({
    required String childId,
    required String parentDocId,
  }) async {
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
            return false;
          });
      return true;
    } on FirebaseException catch (_) {
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
      return false;
    }
  }

  //Update

  @override
  Future<bool> declineSpecialistConnection({required String parentId}) async {
    try {
      final querySnapshot = await instance
          .collection(FIRESTORE_COLLECTION_PARENTS)
          .where('id', isEqualTo: parentId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot parent = querySnapshot.docs[0];
        final String parentId = parent.id;

        await instance
            .collection(FIRESTORE_COLLECTION_PARENTS)
            .doc(parentId)
            .update({'assignedSpecialistId': null});

        await _removeAssignedSpecialistFromChild(parentId: parentId);
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> approveSpecialistConnection({required String parentId}) async {
    try {
      final querySnapshot = await instance
          .collection(FIRESTORE_COLLECTION_PARENTS)
          .where('id', isEqualTo: parentId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot parent = querySnapshot.docs[0];
        final String parentId = parent.id;

        await instance
            .collection(FIRESTORE_COLLECTION_PARENTS)
            .doc(parentId)
            .update({'specialistConnectionApproved': true});
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      return false;
    }
  }

  Future<bool> _removeAssignedSpecialistFromChild(
      {required String parentId}) async {
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
                .update({'assignedSpecialistId': null});
          },
        );
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> updateSpecialistInformation({
    required String specialistId,
    required String occupation,
    required String workplace,
    required String workHours,
    required String professionalPhoneNum,
    required String additionalEducation,
  }) async {
    try {
      await instance
          .collection(FIRESTORE_COLLECTION_SPECIALISTS)
          .doc(specialistId)
          .update(
        {
          'workAddress': workplace,
          'workHours': workHours,
          'occupation': occupation,
          'professionalPhoneNum': professionalPhoneNum,
          'additionalEducation': additionalEducation,
        },
      );
      return true;
    } on FirebaseException catch (_) {
      return false;
    }
  }
}
