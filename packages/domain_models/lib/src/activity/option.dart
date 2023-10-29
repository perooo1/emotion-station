import 'package:domain_models/src/activity/comprehension_level.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  Option({required this.text, required this.comprehensionLevel});

  final String text;
  final ComprehensionLevel comprehensionLevel;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
