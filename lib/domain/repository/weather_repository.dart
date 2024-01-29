

import 'package:weather_app/core/result/result.dart';
import 'package:weather_app/domain/model/weather.dart';

abstract class WeatherRepository {


  Future<Result<Weather>> getWeatherByQuery(String query);

}