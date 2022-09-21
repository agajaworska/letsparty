import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';

import 'package:letsparty/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteRetrofitDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    return await _weatherRemoteDataSource.getWeatherData(city);
  }
}
