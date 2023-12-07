// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:domain_models/domain_models.dart';

part 'parent.g.dart';

@JsonSerializable()
class Parent extends User {
  Parent({
    //potencijalni required na ostalo
    required super.id,
    super.isSpecialist = false,
    super.name,
    super.lastName,
    super.email,
    super.password,
    this.assignedSpecialistId,
    this.children,
    this.specialistConnectionApproved = false,
  });

  /*
  Parent({
    required super.id,
    this.assignedSpecialistId,
    this.children,
  });*/

  final String? assignedSpecialistId;
  final List<String>? children;
  final bool specialistConnectionApproved;

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
  Map<String, dynamic> toJson() => _$ParentToJson(this);
}
