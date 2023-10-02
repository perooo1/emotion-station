// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'child.g.dart';

@JsonSerializable()
class Child {
  Child({
    required this.id,
    required this.parentId,
    this.assignedSpecialistId,
    required this.name,
    required this.lastName,
    required this.age,
    required this.isGenderMale,
    required this.diagnosis,
  });

  final String id;
  final String parentId;
  final String? assignedSpecialistId;
  final String name;
  final String lastName;
  final int age;
  final bool isGenderMale;
  final String diagnosis;

  String get fullName => '${this.name} ${this.lastName}';
  bool get isGenderFemale => !isGenderMale;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
  Map<String, dynamic> toJson() => _$ChildToJson(this);
}