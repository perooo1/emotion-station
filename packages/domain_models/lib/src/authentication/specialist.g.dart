// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specialist _$SpecialistFromJson(Map<String, dynamic> json) => Specialist(
      id: json['id'] as String,
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
    );
