part of 'weather_cubit.dart';

class WeatherState {
  const WeatherState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
    this.saved = false,
  });
  final WeatherModel? model;
  final Status status;
  final String? errorMessage;
  final bool saved;
}
