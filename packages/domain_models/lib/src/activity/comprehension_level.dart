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

extension ComprehensionLevelToDouble on ComprehensionLevel {
  double toBarChartData() {
    switch (this) {
      case ComprehensionLevel.high:
        return 19.0;
      case ComprehensionLevel.partial:
        return 10.0;
      case ComprehensionLevel.low:
        return 1.5;
      case ComprehensionLevel.initialDefault:
        return 0.0;
    }
  }

  double toRadarChartData() {
    switch (this) {
      case ComprehensionLevel.high:
        return 300.0;
      case ComprehensionLevel.partial:
        return 150.0;
      case ComprehensionLevel.low:
        return 10.0; //0 ideally
      case ComprehensionLevel.initialDefault:
        return 0.0;
    }
  }
}
