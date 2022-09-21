import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
  });
  @JsonKey(name: 'location')
  final LocationModel location;
  @JsonKey(name: 'current')
  final CurrentModel current;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  LocationModel({
    required this.name,
  });

  final String name;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@JsonSerializable()
class CurrentModel {
  CurrentModel({
    required this.temperature,
    required this.condition,
  });
  @JsonKey(name: 'temp_c')
  final double temperature;
  final ConditionModel condition;

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);
}

@JsonSerializable()
class ConditionModel {
  ConditionModel({
    required this.text,
  });

  final String text;

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);
}




  // WeatherModel.fromJson(Map<String, dynamic> json)
  //     : temperature = json['current']['temp_c'] + 0.0,
  //       city = json['location']['name'],
  //       condition = json['current']['condition']['text'];


