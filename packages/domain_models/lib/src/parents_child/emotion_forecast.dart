import 'package:json_annotation/json_annotation.dart';

enum EmotionForecast {
  @JsonValue('sad')
  sad,
  @JsonValue('happy')
  happy,
  @JsonValue('angry')
  angry,
}
