import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/result/result.dart';
import 'package:weather_app/data/data_source/weather_api.dart';
import 'package:weather_app/data/mapper/mappers.dart';
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi _weatherApi;

  WeatherRepositoryImpl(this._weatherApi);

  @override
  Future<Result<Weather>> getWeatherByQuery(String query) async {
    try {
      final httpResponse = await _weatherApi.getWeather(
        query: query,
        units: metricUnits,
        apiKey: apiKey,
      );

      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return Success(httpResponse.data.toDomain());

      } else {
        return Failure(httpResponse.response.statusMessage ?? "HttpStatus != 200");

      }
    } on DioException catch (e) {
      return Failure(e.message ?? "DioException");
    } catch (e) {
      return const Failure("Error in getWeatherByQuery()");
    }
  }




}