// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      text: json['text'] as String,
      storyText: json['storyText'] as String?,
      imageAssetPath: json['imageAssetPath'] as String?,
      activityType: $enumDecode(_$ActivityTypeEnumMap, json['activityType']),
      opservationCategory: $enumDecode(
          _$OpservationCategoryEnumMap, json['opservationCategory']),
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'text': instance.text,
      'storyText': instance.storyText,
      'imageAssetPath': instance.imageAssetPath,
      'activityType': _$ActivityTypeEnumMap[instance.activityType]!,
      'opservationCategory':
          _$OpservationCategoryEnumMap[instance.opservationCategory]!,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };

const _$ActivityTypeEnumMap = {
  ActivityType.stationOfHappiness: 'stationOfHappiness',
  ActivityType.stationOfSadness: 'stationOfSadness',
  ActivityType.stationOfAnger: 'stationOfAnger',
  ActivityType.stationOfFear: 'stationOfFear',
};

const _$OpservationCategoryEnumMap = {
  OpservationCategory.emotionReckognition: 'emotionReckognition',
  OpservationCategory.emotionUnderstandingVisual: 'emotionUnderstandingVisual',
  OpservationCategory.emotionUnderstandingTextual:
      'emotionUnderstandingTextual',
};
