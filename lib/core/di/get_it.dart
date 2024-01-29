
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/data/data_source/weather_api.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/presentation/pages/search/bloc/search_page_bloc.dart';
import 'package:weather_app/presentation/pages/weather/bloc/weather_page_bloc.dart';


final GetIt getIt = GetIt.instance;

Future<void> initializeGetIt() async {

  // ------------------------------------------
  // Data layer
  // ------------------------------------------


  // Retrofit
  getIt.registerSingleton<Dio>(Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10)
  )));

  getIt.registerLazySingleton<WeatherApi>(
          () => WeatherApi(getIt())
  );

  // Repositories
  getIt.registerLazySingleton<WeatherRepository>(
          () => WeatherRepositoryImpl(getIt())
  );


  // ------------------------------------------
  // Presentation layer
  // ------------------------------------------


  getIt.registerFactory<SearchPageBloc>(() =>
      SearchPageBloc()
  );
  getIt.registerFactory<WeatherPageBloc>(() =>
      WeatherPageBloc(getIt())
  );


  // ------------------------------------------
  // Domain layer
  // ------------------------------------------

  // не юзал юскейсы, и так слишком оверинжениринг

}