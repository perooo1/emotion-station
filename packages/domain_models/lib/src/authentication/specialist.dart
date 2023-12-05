// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:domain_models/src/authentication/authentication.dart';

part 'specialist.g.dart';

@JsonSerializable()
class Specialist extends User {
  Specialist({
    required super.id,
    super.isSpecialist = true,
    super.name,
    super.lastName,
    super.email,
    super.password,
    this.connectedParents,
    this.assignedChildren,
    this.workAddress,
    this.workHours,
    this.professionalPhoneNum,
    this.occupation,
    this.additionalEducation,
  });

  final List<String>? connectedParents; //list of parents' ids
  final List<String>? assignedChildren; //list of childrens' ids
  final String? workAddress;
  final String? workHours;
  final String? professionalPhoneNum;
  final String? occupation;
  final String? additionalEducation;

  factory Specialist.fromJson(Map<String, dynamic> json) => _$SpecialistFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialistToJson(this);
}
