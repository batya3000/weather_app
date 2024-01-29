import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/design/colors.dart';
import 'package:weather_app/core/design/dimensions.dart';
import 'package:weather_app/core/design/images.dart';
import 'package:weather_app/core/design/styles.dart';
import 'package:weather_app/core/di/get_it.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/presentation/pages/weather/bloc/weather_page_bloc.dart';
import 'package:weather_app/presentation/widgets/content_card.dart';
import 'package:weather_app/presentation/widgets/error_ui.dart';
import 'package:weather_app/presentation/widgets/loading_ui.dart';

class WeatherPageArguments {
  final String cityQuery;

  const WeatherPageArguments(this.cityQuery);
}

class WeatherPage extends StatelessWidget {
  final WeatherPageArguments arguments;

  const WeatherPage({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          onTap: () => _onBackButtonTapped(context),
          behavior: HitTestBehavior.opaque,
          child: const Icon(Icons.arrow_back_rounded, color: blackColor),
        ),
      ),
      title: const Text("Погода"),
    );
  }

  Widget _buildBody() {
    return BlocProvider<WeatherPageBloc>(
      create: (context) => getIt<WeatherPageBloc>()
        ..add(GetWeatherEvent(query: arguments.cityQuery)),
      child: BlocConsumer<WeatherPageBloc, WeatherPageState>(
        listener: (context, state) {
          if (state is WeatherPageError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Произошла ошибка!"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherPageLoading) {
            return const LoadingUI();
          }
          if (state is WeatherPageError) {
            // можно возвращать ошибку, тогда юзаем state.errorMessage, можно как по тз:
            return const ErrorUI(errorMessage: "Ошибка получения данных");
          }

          if (state is WeatherPageContent) {
            return _buildContentUI(context, state);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildContentUI(BuildContext context, WeatherPageContent state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: padding8, bottom: padding16),
        child: Column(
          children: [
            _buildCityCard(state),
            const SizedBox(height: height8),
            _buildWeatherCard(state),
          ],
        ),
      ),
    );
  }

  Widget _buildContentRow({required String text, required Widget icon, TextStyle textStyle = bodyTextStyle}) {
    return Row(
      children: [
        icon,
        const SizedBox(width: width8),
        Text(text, style: textStyle)
      ],
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.of(context).pop();
  }


  Widget _buildCityCard(WeatherPageContent state) {
    final String weatherDescription = state.weather.description.first.description;
    final String weatherImageAsset = 'assets/icons/${state.weather.description.first.icon}.png';


    return ContentCard(
        childPadding: padding16,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state.weather.cityName, style: subtitleTextStyle,),
              const SizedBox(height: height16),
              _buildContentRow(
                text: "Погода: $weatherDescription",
                textStyle: bodyTextStyle.copyWith(fontWeight: FontWeight.w500),
                icon: Image.asset(
                    weatherImageAsset,
                    width: 24,
                    height: 24
                ),
              ),
            ]
        )
    );
  }
  Widget _buildWeatherCard(WeatherPageContent state) {
    final String temperatureText = formatTemp(
        temperature: state.weather.info.temp,
        feelsLike: state.weather.info.feelsLike
    );
    final String windText = formatWind(state.weather.wind.speed);
    final String humidityText = formatHumidity(state.weather.info.humidity);
    final String pressureText = formatPressure(state.weather.info.pressure);


    return ContentCard(
        childPadding: padding16,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Weather', style: subtitleTextStyle),
              const SizedBox(height: height16),
              _buildContentRow(
                text: temperatureText,
                icon: iconTemperature16,
              ),
              const SizedBox(height: height16),
              _buildContentRow(
                text: windText,
                icon: iconWind16,
              ),

              const SizedBox(height: height16),
              _buildContentRow(
                text: humidityText,
                icon: iconHumidity16,
              ),

              const SizedBox(height: height16),
              _buildContentRow(
                text: pressureText,
                icon: iconPressure16,
              ),
            ]
        )
    );
  }
}
