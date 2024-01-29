import 'package:flutter/material.dart';
import 'package:weather_app/core/design/theme.dart';
import 'package:weather_app/core/di/get_it.dart';
import 'package:weather_app/core/navigation/routes.dart';
import 'package:weather_app/presentation/pages/search/search_page.dart';



void main() async {
  await initializeGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Погода',
      theme: myAppTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: const SearchPage(),
    );
  }
}

