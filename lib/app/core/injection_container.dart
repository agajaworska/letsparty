import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';
import 'package:letsparty/features/pages/weather/cubit/weather_cubit.dart';
import 'package:letsparty/repositories/weather_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //bloc
  getIt.registerFactory(() => WeatherCubit(getIt()));

  //repository
  getIt.registerFactory(() => WeatherRepository(getIt()));

  //data sources
  getIt.registerFactory(() => WeatherRemoteRetrofitDataSource(Dio()));
}
