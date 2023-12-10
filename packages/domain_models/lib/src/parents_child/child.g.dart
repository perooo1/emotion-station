// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      id: json['id'] as String,
      parentId: json['parentId'] as String,
      assignedSpecialistId: json['assignedSpecialistId'] as String?,
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as int,
      isGenderMale: json['isGenderMale'] as bool,
      diagnosis: json['diagnosis'] as String,
      emotionForecast: (json['emotionForecast'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            DateTime.parse(k), $enumDecode(_$EmotionForecastEnumMap, e)),
      ),
      attendsKindergarten: json['attendsKindergarten'] as bool? ?? false,
      riskyPregnancy: json['riskyPregnancy'] as bool? ?? false,
      pregnancyBirthWeek: json['pregnancyBirthWeek'] as int?,
      treatmentStartMonth: json['treatmentStartMonth'] == null
          ? null
          : DateTime.parse(json['treatmentStartMonth'] as String),
      specialistNote: json['specialistNote'] as String?,
    );

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'assignedSpecialistId': instance.assignedSpecialistId,
      'name': instance.name,
      'lastName': instance.lastName,
      'age': instance.age,
      'isGenderMale': instance.isGenderMale,
      'diagnosis': instance.diagnosis,
      'emotionForecast': instance.emotionForecast?.map((k, e) =>
          MapEntry(k.toIso8601String(), _$EmotionForecastEnumMap[e]!)),
      'attendsKindergarten': instance.attendsKindergarten,
      'riskyPregnancy': instance.riskyPregnancy,
      'pregnancyBirthWeek': instance.pregnancyBirthWeek,
      'treatmentStartMonth': instance.treatmentStartMonth?.toIso8601String(),
      'specialistNote': instance.specialistNote,
    };

const _$EmotionForecastEnumMap = {
  EmotionForecast.sad: 'sad',
  EmotionForecast.happy: 'happy',
  EmotionForecast.angry: 'angry',
};
