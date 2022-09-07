import 'package:bloc/bloc.dart';
import 'package:letsparty/features/enums/enums.dart';
import 'package:letsparty/models/weather_model.dart';
import 'package:letsparty/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(const WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel(
    String city,
  ) async {
    emit(const WeatherState(status: Status.loading));
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
      emit(WeatherState(
        saved: true,
        model: weatherModel,
        status: Status.success,
      ));
    } catch (error) {
      emit(
        WeatherState(
          saved: false,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
