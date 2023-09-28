// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    this.isSpecialist = false,
    this.name,
    this.lastName,
    this.email,
    this.password,
  });

  final String id;
  final bool isSpecialist;
  final String? name;
  final String? lastName;
  final String? email;
  final String? password;

  static const empty = User(id: '');
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;
  String? get fullName => '${this.name} ${this.lastName}';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
