import 'package:json_annotation/json_annotation.dart';

enum ActivityType {
  @JsonValue('stationOfHappiness')
  stationOfHappiness,
  @JsonValue('stationOfSadness')
  stationOfSadness,
  @JsonValue('stationOfAnger')
  stationOfAnger,
  @JsonValue('stationOfFear')
  stationOfFear,
}
