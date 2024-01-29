import 'package:weather_app/data/model/weather_response.dart';
import 'package:weather_app/domain/model/weather.dart';


extension WeatherResponseToDomain on WeatherResponse {
  Weather toDomain() {
    return Weather(
        description: description.map((it) => it.toDomain()).toList(),
        info: info.toDomain(),
        cityName: name,
        wind: wind.toDomain()
    );
  }
}

extension DescriptionResponseToDomain on DescriptionResponse {
  Description toDomain() {
    return Description(
        main: main,
        description: description,
        icon: icon
    );
  }
}

extension InfoResponseToDomain on InfoResponse {
  Info toDomain() {
    return Info(
        temp: temp,
        feelsLike: feelsLike,
        pressure: pressure,
        humidity: humidity
    );
  }
}

extension WindResponseToDomain on WindResponse {
  Wind toDomain() {
    return Wind(
        speed: speed,
        deg: deg,
        gust: gust
    );
  }
}