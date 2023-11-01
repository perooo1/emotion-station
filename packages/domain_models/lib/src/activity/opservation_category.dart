import 'package:json_annotation/json_annotation.dart';

enum OpservationCategory {
  @JsonValue('emotionReckognition')
  emotionReckognition,
  @JsonValue('emotionUnderstandingVisual')
  emotionUnderstandingVisual,
  @JsonValue('emotionUnderstandingTextual')
  emotionUnderstandingTextual,
}
