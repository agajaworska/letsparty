import 'package:bloc/bloc.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/models/weather_model.dart';
import 'package:letsparty/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(const WeatherState());

  final WeatherRepository weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(const WeatherState(status: Status.loading));
    try {
      final weatherModel = await weatherRepository.getWeatherModel(
        city: city,
      );
      emit(WeatherState(
        model: weatherModel,
        status: Status.success,
      ));
    } catch (error) {
      emit(
        WeatherState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
