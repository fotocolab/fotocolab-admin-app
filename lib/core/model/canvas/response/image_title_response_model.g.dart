// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_title_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageTitleResponseModelImpl _$$ImageTitleResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageTitleResponseModelImpl(
      title: json['title'] as String? ?? '',
      language: $enumDecodeNullable(_$LanguageEnumEnumMap, json['language']) ??
          LanguageEnum.english,
    );

Map<String, dynamic> _$$ImageTitleResponseModelImplToJson(
        _$ImageTitleResponseModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'language': _$LanguageEnumEnumMap[instance.language]!,
    };

const _$LanguageEnumEnumMap = {
  LanguageEnum.english: 'english',
  LanguageEnum.hindi: 'hindi',
  LanguageEnum.assamese: 'assamese',
  LanguageEnum.bengali: 'bengali',
  LanguageEnum.bodo: 'bodo',
  LanguageEnum.gujarati: 'gujarati',
  LanguageEnum.kannada: 'kannada',
  LanguageEnum.malayalam: 'malayalam',
  LanguageEnum.marathi: 'marathi',
  LanguageEnum.nepali: 'nepali',
  LanguageEnum.odia: 'odia',
  LanguageEnum.punjabi: 'punjabi',
  LanguageEnum.tamil: 'tamil',
  LanguageEnum.telugu: 'telugu',
  LanguageEnum.urdu: 'urdu',
};
