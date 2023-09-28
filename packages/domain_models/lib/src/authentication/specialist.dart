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
  });

  final List<String>? connectedParents; //list of parents' ids
  final List<String>? assignedChildren; //list of childrens' ids

  factory Specialist.fromJson(Map<String, dynamic> json) => _$SpecialistFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialistToJson(this);
}
