// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      description: (json['weather'] as List<dynamic>)
          .map((e) => DescriptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: InfoResponse.fromJson(json['main'] as Map<String, dynamic>),
      name: json['name'] as String,
      wind: WindResponse.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'weather': instance.description,
      'main': instance.info,
      'name': instance.name,
      'wind': instance.wind,
    };

DescriptionResponse _$DescriptionResponseFromJson(Map<String, dynamic> json) =>
    DescriptionResponse(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$DescriptionResponseToJson(
        DescriptionResponse instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

InfoResponse _$InfoResponseFromJson(Map<String, dynamic> json) => InfoResponse(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$InfoResponseToJson(InfoResponse instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

WindResponse _$WindResponseFromJson(Map<String, dynamic> json) => WindResponse(
      speed: (json['speed'] as num).toDouble(),
      deg: (json['deg'] as num).toDouble(),
      gust: (json['gust'] as num).toDouble(),
    );

Map<String, dynamic> _$WindResponseToJson(WindResponse instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
