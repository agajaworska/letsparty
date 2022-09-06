import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';
import 'package:letsparty/features/enums/enums.dart';
import 'package:letsparty/features/pages/weather/cubit/weather_cubit.dart';
import 'package:letsparty/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final json = await _weatherRemoteDataSource.getWeatherData(
      city: city,
    );

    if (json == null) {
      return null;
    }
    print(json);
    return WeatherModel.fromJson(json);
  }
}
