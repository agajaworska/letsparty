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

// @JsonSerializable()
// class WeatherModel {
//   WeatherModel({
//     required this.location,
//     required this.current,
//   });

//   final LocationModel location;
//   final CurrentModel current;

//   factory WeatherModel.fromJson(Map<String, dynamic> json) =>
//       _$WeatherModelFromJson(json);

//   Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
// }

// @JsonSerializable()
// class LocationModel {
//   LocationModel({
//     required this.name,
//   });

//   final String name;

//   factory LocationModel.fromJson(Map<String, dynamic> json) =>
//       _$LocationModelFromJson(json);
// }

// @JsonSerializable()
// class CurrentModel {
//   CurrentModel({
//     required this.temperature,
//     required this.condition,
//   });
//   @JsonKey(name: 'temp_c')
//   final double temperature;
//   final ConditionModel condition;

//   factory CurrentModel.fromJson(Map<String, dynamic> json) =>
//       _$CurrentModelFromJson(json);
// }

// @JsonSerializable()
// class ConditionModel {
//   ConditionModel({
//     required this.text,
//   });

//   final String text;

//   factory ConditionModel.fromJson(Map<String, dynamic> json) =>
//       _$ConditionModelFromJson(json);
// }




  // WeatherModel.fromJson(Map<String, dynamic> json)
  //     : temperature = json['current']['temp_c'] + 0.0,
  //       city = json['location']['name'],
  //       condition = json['current']['condition']['text'];


