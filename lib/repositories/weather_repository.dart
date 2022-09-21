import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';

import 'package:letsparty/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this.weatherRemoteDataSource);

  final WeatherRemoteRetrofitDataSource weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    return await weatherRemoteDataSource.getWeatherData(city);
  }
}
