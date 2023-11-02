// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRecord _$ActivityRecordFromJson(Map<String, dynamic> json) =>
    ActivityRecord(
      emotionStation: EmotionStation.fromJson(
          json['emotionStation'] as Map<String, dynamic>),
      childId: json['childId'] as String,
      timeOfActivity: DateTime.parse(json['timeOfActivity'] as String),
      recognitionAnswer1:
          $enumDecode(_$ComprehensionLevelEnumMap, json['recognitionAnswer1']),
      recognitionAnswer2:
          $enumDecode(_$ComprehensionLevelEnumMap, json['recognitionAnswer2']),
      understandingVisualAnswer1: $enumDecode(
          _$ComprehensionLevelEnumMap, json['understandingVisualAnswer1']),
      understandingVisualAnswer2: $enumDecode(
          _$ComprehensionLevelEnumMap, json['understandingVisualAnswer2']),
      understandingTextualAnswer1: $enumDecode(
          _$ComprehensionLevelEnumMap, json['understandingTextualAnswer1']),
      understandingTextualAnswer2: $enumDecode(
          _$ComprehensionLevelEnumMap, json['understandingTextualAnswer2']),
      recognitionAnswer1Duration:
          Duration(microseconds: json['recognitionAnswer1Duration'] as int),
      recognitionAnswer2Duration:
          Duration(microseconds: json['recognitionAnswer2Duration'] as int),
      understandingVisualAnswer1Duration: Duration(
          microseconds: json['understandingVisualAnswer1Duration'] as int),
      understandingVisualAnswer2Duration: Duration(
          microseconds: json['understandingVisualAnswer2Duration'] as int),
      understandingTextualAnswer1Duration: Duration(
          microseconds: json['understandingTextualAnswer1Duration'] as int),
      understandingTextualAnswer2Duration: Duration(
          microseconds: json['understandingTextualAnswer2Duration'] as int),
    );

Map<String, dynamic> _$ActivityRecordToJson(ActivityRecord instance) =>
    <String, dynamic>{
      'emotionStation': instance.emotionStation.toJson(),
      'childId': instance.childId,
      'timeOfActivity': instance.timeOfActivity.toIso8601String(),
      'recognitionAnswer1':
          _$ComprehensionLevelEnumMap[instance.recognitionAnswer1]!,
      'recognitionAnswer2':
          _$ComprehensionLevelEnumMap[instance.recognitionAnswer2]!,
      'understandingVisualAnswer1':
          _$ComprehensionLevelEnumMap[instance.understandingVisualAnswer1]!,
      'understandingVisualAnswer2':
          _$ComprehensionLevelEnumMap[instance.understandingVisualAnswer2]!,
      'understandingTextualAnswer1':
          _$ComprehensionLevelEnumMap[instance.understandingTextualAnswer1]!,
      'understandingTextualAnswer2':
          _$ComprehensionLevelEnumMap[instance.understandingTextualAnswer2]!,
      'recognitionAnswer1Duration':
          instance.recognitionAnswer1Duration.inMicroseconds,
      'recognitionAnswer2Duration':
          instance.recognitionAnswer2Duration.inMicroseconds,
      'understandingVisualAnswer1Duration':
          instance.understandingVisualAnswer1Duration.inMicroseconds,
      'understandingVisualAnswer2Duration':
          instance.understandingVisualAnswer2Duration.inMicroseconds,
      'understandingTextualAnswer1Duration':
          instance.understandingTextualAnswer1Duration.inMicroseconds,
      'understandingTextualAnswer2Duration':
          instance.understandingTextualAnswer2Duration.inMicroseconds,
    };

const _$ComprehensionLevelEnumMap = {
  ComprehensionLevel.high: 'high',
  ComprehensionLevel.partial: 'partial',
  ComprehensionLevel.low: 'low',
  ComprehensionLevel.initialDefault: 'initialDefault',
};
