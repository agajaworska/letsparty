import 'package:flutter_test/flutter_test.dart';
import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';
import 'package:letsparty/domain/models/weather_model.dart';
import 'package:letsparty/domain/repositories/weather_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherDataSource extends Mock
    implements WeatherRemoteRetrofitDataSource {}

void main() {
  late WeatherRepository sut;
  late MockWeatherDataSource dataSource;

  setUp(() {
    dataSource = MockWeatherDataSource();
    sut = WeatherRepository(dataSource);
  });

  group('getArticlesForAuthorId', () {
    test('should call weatherRemoteDataSource.getWeatherData(city) method',
        () async {
      // 1
      when(() => dataSource.getWeatherData('Warsaw')).thenAnswer(
        (_) async => WeatherModel(
          LocationModel('Warsaw'),
          CurrentModel(
            12.0,
            ConditionModel('sunny'),
          ),
        ),
      );
      // 2
      await sut.getWeatherModel(city: 'Warsaw');
      // 3
      verify(() => dataSource.getWeatherData('Warsaw')).called(1);
    });
  });
}
