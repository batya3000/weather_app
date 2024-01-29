part of 'weather_page_bloc.dart';

abstract class WeatherPageState extends Equatable {
  const WeatherPageState();

}

class WeatherPageLoading extends WeatherPageState {
  const WeatherPageLoading();

  @override
  List<Object> get props => [];
}


class WeatherPageContent extends WeatherPageState {
  final Weather weather;

  const WeatherPageContent(this.weather);

  @override
  List<Object> get props => [weather];
}

class WeatherPageError extends WeatherPageState {
  final String errorMessage;

  const WeatherPageError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}