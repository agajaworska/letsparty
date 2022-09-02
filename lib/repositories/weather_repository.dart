import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';
import 'package:letsparty/models/weather_model.dart';

class WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepository(this._weatherRemoteDataSource);

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final responseData = await _weatherRemoteDataSource.getWeatherData(
      city: city,
    );

    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;

    return WeatherModel(temperature: temperature, city: name);
  }
}
