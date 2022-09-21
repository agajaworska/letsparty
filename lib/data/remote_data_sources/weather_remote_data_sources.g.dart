// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_remote_data_sources.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WeatherRemoteRetrofitDataSource
    implements WeatherRemoteRetrofitDataSource {
  _WeatherRemoteRetrofitDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://api.weatherapi.com/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<WeatherModel> getWeatherData(city) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<WeatherModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/current.json?key=63933c09c9a44a15a9c201031221109&q=${city}&aqi=no',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WeatherModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
