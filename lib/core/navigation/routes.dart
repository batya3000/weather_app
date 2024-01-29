import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/presentation/pages/search/search_page.dart';
import 'package:weather_app/presentation/pages/weather/weather_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case searchPageRoute:
        return _materialRoute(const SearchPage());

      case weatherPageRoute:
        return _materialRoute(
            WeatherPage(arguments: settings.arguments as WeatherPageArguments)
        );

      default:
        return _materialRoute(const SearchPage());
    }
  }

  static Route _materialRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
