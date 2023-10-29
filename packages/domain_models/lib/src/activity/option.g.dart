// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      text: json['text'] as String,
      comprehensionLevel:
          $enumDecode(_$ComprehensionLevelEnumMap, json['comprehensionLevel']),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'text': instance.text,
      'comprehensionLevel':
          _$ComprehensionLevelEnumMap[instance.comprehensionLevel]!,
    };

const _$ComprehensionLevelEnumMap = {
  ComprehensionLevel.high: 'high',
  ComprehensionLevel.partial: 'partial',
  ComprehensionLevel.low: 'low',
};
