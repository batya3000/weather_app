import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final List<Description> description;
  final Info info;
  final String cityName;
  final Wind wind;

  const Weather({
    required this.description,
    required this.info,
    required this.cityName,
    required this.wind
  });

  @override
  List<Object?> get props => [description, info, cityName, wind];


}

class Description extends Equatable  {
  final String main;
  final String description;
  final String icon;

  const Description({
    required this.main,
    required this.description,
    required this.icon
  });

  @override
  List<Object?> get props => [main, description, icon];

}

class Info extends Equatable {
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;

  const Info({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity
  });

  @override
  List<Object?> get props => [temp, feelsLike, pressure, humidity];
}


class Wind extends Equatable {
  final double speed;
  final double deg;
  final double gust;

  const Wind({
    required this.speed,
    required this.deg,
    required this.gust
  });

  @override
  List<Object?> get props => [speed, deg, gust];
}