import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  @JsonKey(name: "weather")
  final List<DescriptionResponse> description;
  @JsonKey(name: "main")
  final InfoResponse info;
  final String name;
  final WindResponse wind;

  WeatherResponse({
    required this.description,
    required this.info,
    required this.name,
    required this.wind
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}

@JsonSerializable()
class DescriptionResponse {
  final String main;
  final String description;
  final String icon;

  DescriptionResponse({
    required this.main,
    required this.description,
    required this.icon
  });

  factory DescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescriptionResponseFromJson(json);

}
@JsonSerializable()

class InfoResponse {
  final double temp;
  @JsonKey(name: "feels_like")
  final double feelsLike;
  final int pressure;
  final int humidity;

  InfoResponse({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity
  });

  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);
}

@JsonSerializable()
class WindResponse {
  final double speed;
  final double deg;
  final double gust;

  WindResponse({
    required this.speed,
    required this.deg,
    required this.gust
  });

  factory WindResponse.fromJson(Map<String, dynamic> json) =>
      _$WindResponseFromJson(json);

}