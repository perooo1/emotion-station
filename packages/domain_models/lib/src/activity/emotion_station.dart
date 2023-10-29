import 'package:domain_models/domain_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emotion_station.g.dart';

@JsonSerializable()
class EmotionStation {
  EmotionStation({
    required this.activityType,
    required this.stationName,
    required this.questions,
  });

  final ActivityType activityType;
  final String stationName;
  final List<Question> questions;

  factory EmotionStation.fromJson(Map<String, dynamic> json) => _$EmotionStationFromJson(json);
  Map<String, dynamic> toJson() => _$EmotionStationToJson(this);
}
