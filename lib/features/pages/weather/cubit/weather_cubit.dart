import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/domain/models/weather_model.dart';
import 'package:letsparty/domain/repositories/weather_repository.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this.weatherRepository,
  ) : super(WeatherState());

  final WeatherRepository weatherRepository;

  Future<void> getWeather({
    required String city,
  }) async {
    emit(WeatherState(status: Status.loading));
    try {
      final weatherModel = await weatherRepository.getWeatherModel(
        city: city,
      );
      emit(WeatherState(
        model: weatherModel!,
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

  // Stream<WeatherState> getWeatherStream() {
  //   try {
  //     final subscription = WeatherCubit(
  //             WeatherRepository(WeatherRemoteRetrofitDataSource(Dio())))
  //         .stream;
  //     return subscription;
  //   } catch (error) {
  //     throw Exception(
  //       error.toString(),
  //     );
  //   }
  // }
}
