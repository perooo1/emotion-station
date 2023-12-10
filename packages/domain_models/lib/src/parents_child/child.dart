// Package imports:
import 'package:domain_models/domain_models.dart';
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
    this.emotionForecast,
    this.attendsKindergarten = false,
    this.riskyPregnancy = false,
    required this.pregnancyBirthWeek,
    required this.treatmentStartMonth,
    this.specialistNote,
  });

  final String id;
  final String parentId;
  final String? assignedSpecialistId;
  final String name;
  final String lastName;
  final int age;
  final bool isGenderMale;
  final String diagnosis;
  final Map<DateTime, EmotionForecast>? emotionForecast;
  final bool? attendsKindergarten;
  final bool? riskyPregnancy;
  final int? pregnancyBirthWeek;
  final DateTime? treatmentStartMonth;
  final String? specialistNote;

  String get fullName => '${this.name} ${this.lastName}';
  bool get isGenderFemale => !isGenderMale;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
  Map<String, dynamic> toJson() => _$ChildToJson(this);
}
