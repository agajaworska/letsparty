import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.g.dart';
part 'weather_model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel(
    LocationModel location,
    CurrentModel current,
  ) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class LocationModel with _$LocationModel {
  factory LocationModel(
    String name,
  ) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@freezed
class CurrentModel with _$CurrentModel {
  factory CurrentModel(
    @JsonKey(name: 'temp_c') double temperature,
    ConditionModel condition,
  ) = _CurrentModel;

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);
}

@freezed
class ConditionModel with _$ConditionModel {
  factory ConditionModel(
    String text,
  ) = _ConditionModel;

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);
}
