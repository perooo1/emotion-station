// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      id: json['id'] as String,
      parentId: json['parentId'] as String,
      assignedSpecialistId: json['assignedSpecialistId'] as String?,
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as int,
      isGenderMale: json['isGenderMale'] as bool,
      diagnosis: json['diagnosis'] as String,
    );

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'assignedSpecialistId': instance.assignedSpecialistId,
      'name': instance.name,
      'lastName': instance.lastName,
      'age': instance.age,
      'isGenderMale': instance.isGenderMale,
      'diagnosis': instance.diagnosis,
    };
