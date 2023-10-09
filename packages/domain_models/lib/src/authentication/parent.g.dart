// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      id: json['id'] as String,
      isSpecialist: json['isSpecialist'] as bool? ?? false,
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      assignedSpecialistId: json['assignedSpecialistId'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'id': instance.id,
      'isSpecialist': instance.isSpecialist,
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'assignedSpecialistId': instance.assignedSpecialistId,
      'children': instance.children,
    };
