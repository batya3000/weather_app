

import 'package:retrofit/retrofit.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/data/model/weather_response.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: weatherBaseUrl)
abstract class WeatherApi {
  factory WeatherApi(Dio dio) = _WeatherApi;

  @GET("data/2.5/weather")
  Future<HttpResponse<WeatherResponse>> getWeather({
    @Query("q") required String query,
    @Query("units") required String units,
    @Query("appid") required String apiKey,
  });
}