part of 'weather_page_bloc.dart';

abstract class WeatherPageEvent extends Equatable {
  const WeatherPageEvent();

}

class GetWeatherEvent extends WeatherPageEvent {
  final String query;

  const GetWeatherEvent({required this.query});

  @override
  List<Object?> get props => [query];

}
