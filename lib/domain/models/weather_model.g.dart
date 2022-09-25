// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherModel _$$_WeatherModelFromJson(Map<String, dynamic> json) =>
    _$_WeatherModel(
      LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WeatherModelToJson(_$_WeatherModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

_$_LocationModel _$$_LocationModelFromJson(Map<String, dynamic> json) =>
    _$_LocationModel(
      json['name'] as String,
    );

Map<String, dynamic> _$$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$_CurrentModel _$$_CurrentModelFromJson(Map<String, dynamic> json) =>
    _$_CurrentModel(
      (json['temp_c'] as num).toDouble(),
      ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CurrentModelToJson(_$_CurrentModel instance) =>
    <String, dynamic>{
      'temp_c': instance.temperature,
      'condition': instance.condition,
    };

_$_ConditionModel _$$_ConditionModelFromJson(Map<String, dynamic> json) =>
    _$_ConditionModel(
      json['text'] as String,
    );

Map<String, dynamic> _$$_ConditionModelToJson(_$_ConditionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
