// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specialist _$SpecialistFromJson(Map<String, dynamic> json) => Specialist(
      id: json['id'] as String,
      isSpecialist: json['isSpecialist'] as bool? ?? true,
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      connectedParents: (json['connectedParents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      assignedChildren: (json['assignedChildren'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workAddress: json['workAddress'] as String?,
      workHours: json['workHours'] as String?,
      professionalPhoneNum: json['professionalPhoneNum'] as String?,
      occupation: json['occupation'] as String?,
      additionalEducation: json['additionalEducation'] as String?,
    );

Map<String, dynamic> _$SpecialistToJson(Specialist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isSpecialist': instance.isSpecialist,
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'connectedParents': instance.connectedParents,
      'assignedChildren': instance.assignedChildren,
      'workAddress': instance.workAddress,
      'workHours': instance.workHours,
      'professionalPhoneNum': instance.professionalPhoneNum,
      'occupation': instance.occupation,
      'additionalEducation': instance.additionalEducation,
    };
