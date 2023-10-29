// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmotionStation _$EmotionStationFromJson(Map<String, dynamic> json) =>
    EmotionStation(
      activityType: $enumDecode(_$ActivityTypeEnumMap, json['activityType']),
      stationName: json['stationName'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmotionStationToJson(EmotionStation instance) =>
    <String, dynamic>{
      'activityType': _$ActivityTypeEnumMap[instance.activityType]!,
      'stationName': instance.stationName,
      'questions': instance.questions,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.stationOfHappiness: 'stationOfHappiness',
  ActivityType.stationOfSadness: 'stationOfSadness',
  ActivityType.stationOfAnger: 'stationOfAnger',
  ActivityType.stationOfFear: 'stationOfFear',
};
