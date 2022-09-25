import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:letsparty/domain/models/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_remote_data_sources.g.dart';

@injectable
@RestApi()
abstract class WeatherRemoteRetrofitDataSource {
  @factoryMethod
  factory WeatherRemoteRetrofitDataSource(
    Dio dio,
  ) = _WeatherRemoteRetrofitDataSource;

  @GET("/current.json?key=63933c09c9a44a15a9c201031221109&q={city}&aqi=no")
  Future<WeatherModel> getWeatherData(
    @Path('city') String city,
  );
}

// class WeatherRemoteDataSource {
//   Future<Map<String, dynamic>?> getWeatherData({
//     required String city,
//   }) async {
//     try {
//       final response = await Dio().get<Map<String, dynamic>>(
//           'http://api.weatherapi.com/v1/current.json?key=63933c09c9a44a15a9c201031221109&q=$city&aqi=no ');
//       return response.data;
//     } on DioError catch (error) {
//       throw Exception(
//           error.response?.data['error']['message'] ?? 'Unkown error');
//     }
//   }
// }
