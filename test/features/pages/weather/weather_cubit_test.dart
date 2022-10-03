import 'package:flutter_test/flutter_test.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/domain/models/weather_model.dart';
import 'package:letsparty/domain/repositories/items_repository.dart';
import 'package:letsparty/features/pages/weather/cubit/weather_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:letsparty/domain/repositories/weather_repository.dart';
import 'package:bloc_test/bloc_test.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late WeatherCubit sut;
  late MockWeatherRepository repository;

  setUp(() {
    repository = MockWeatherRepository();
    sut = WeatherCubit(repository);
  });

  group('success', () {
    setUp(() {
      when(() => repository.getWeatherModel(city: 'Warsaw')).thenAnswer(
        (_) async => WeatherModel(LocationModel('Warsaw'),
            CurrentModel(12.0, ConditionModel('sunny'))),
      );
    });

    blocTest<WeatherCubit, WeatherState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.getWeather(city: 'Warsaw'),
        expect: () => [
              WeatherState(
                status: Status.loading,
              ),
              WeatherState(
                status: Status.success,
                model: WeatherModel(LocationModel('Warsaw'),
                    CurrentModel(12.0, ConditionModel('sunny'))),
              )
            ]);
  });
}
