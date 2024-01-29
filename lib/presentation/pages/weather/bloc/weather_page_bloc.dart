
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/result/result.dart';
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

part 'weather_page_event.dart';
part 'weather_page_state.dart';


class WeatherPageBloc extends Bloc<WeatherPageEvent, WeatherPageState> {
  final WeatherRepository _weatherRepository;

  WeatherPageBloc(this._weatherRepository) : super(const WeatherPageLoading()) {
    on<GetWeatherEvent>(_onGetWeather);
  }

  void _onGetWeather(GetWeatherEvent event, Emitter<WeatherPageState> emit) async {
    
    final result = await _weatherRepository.getWeatherByQuery(event.query);

    switch(result) {
      case Success(): {
        emit(WeatherPageContent(result.data));

      }
      case Failure(): {
        emit(WeatherPageError(result.errorMessage));

      }
    }
  }

}
