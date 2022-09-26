// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/remote_data_sources/weather_remote_data_sources.dart' as _i4;
import '../../domain/repositories/weather_repository.dart' as _i5;
import '../../features/pages/weather/cubit/weather_cubit.dart' as _i6;
import 'injection_container.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i3.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i4.WeatherRemoteRetrofitDataSource>(
      () => _i4.WeatherRemoteRetrofitDataSource(get<_i3.Dio>()));
  gh.factory<_i5.WeatherRepository>(
      () => _i5.WeatherRepository(get<_i4.WeatherRemoteRetrofitDataSource>()));
  gh.factory<_i6.WeatherCubit>(
      () => _i6.WeatherCubit(get<_i5.WeatherRepository>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
