import 'package:domain_models/domain_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_record.g.dart';

@JsonSerializable()
class ActivityRecord {
  ActivityRecord({
    required this.emotionStation,
    required this.recognitionAnswer1,
    required this.recognitionAnswer2,
    required this.understandingVisualAnswer1,
    required this.understandingVisualAnswer2,
    required this.understandingTextualAnswer1,
    required this.understandingTextualAnswer2,
    required this.recognitionAnswer1Duration,
    required this.recognitionAnswer2Duration,
    required this.understandingVisualAnswer1Duration,
    required this.understandingVisualAnswer2Duration,
    required this.understandingTextualAnswer1Duration,
    required this.understandingTextualAnswer2Duration,
  });

  final EmotionStation emotionStation;
  final ComprehensionLevel recognitionAnswer1;
  final ComprehensionLevel recognitionAnswer2;
  final ComprehensionLevel understandingVisualAnswer1;
  final ComprehensionLevel understandingVisualAnswer2;
  final ComprehensionLevel understandingTextualAnswer1;
  final ComprehensionLevel understandingTextualAnswer2;
  final Duration recognitionAnswer1Duration;
  final Duration recognitionAnswer2Duration;
  final Duration understandingVisualAnswer1Duration;
  final Duration understandingVisualAnswer2Duration;
  final Duration understandingTextualAnswer1Duration;
  final Duration understandingTextualAnswer2Duration;

  factory ActivityRecord.fromJson(Map<String, dynamic> json) => _$ActivityRecordFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityRecordToJson(this);
}
