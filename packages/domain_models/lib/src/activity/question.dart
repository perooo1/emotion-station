import 'package:domain_models/domain_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question {
  Question({
    required this.text,
    this.storyText,
    this.imageAssetPath,
    required this.activityType,
    required this.opservationCategory,
    required this.options,
  });

  final String text;
  final String? storyText;
  final String? imageAssetPath;
  final ActivityType activityType;
  final OpservationCategory opservationCategory;
  final List<Option> options;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
