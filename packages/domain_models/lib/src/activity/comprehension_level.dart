import 'package:json_annotation/json_annotation.dart';

enum ComprehensionLevel {
  @JsonValue('high')
  high,
  @JsonValue('partial')
  partial,
  @JsonValue('low')
  low,
  @JsonValue('initialDefault')
  initialDefault,
}
