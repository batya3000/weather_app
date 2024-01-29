

import 'package:flutter/material.dart';
import 'package:weather_app/core/design/colors.dart';
import 'package:weather_app/core/design/dimensions.dart';
import 'package:weather_app/core/design/styles.dart';

ThemeData myAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: surfaceColor,
    fontFamily: 'Inter',
    appBarTheme: myAppBarTheme(),
    cardTheme: myCardTheme(),
    elevatedButtonTheme: myElevatedButtonTheme(),
    textSelectionTheme: myTextSelectionThemeData(),
    inputDecorationTheme: myInputDecorationTheme(),
  );
}



AppBarTheme myAppBarTheme() {
  return const AppBarTheme(
    color: whiteColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: blackColor),
    titleTextStyle: titleTextStyle,
  );
}

CardTheme myCardTheme() {
  return CardTheme(
      elevation: elevation0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius16)
      )
  );
}

ElevatedButtonThemeData myElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius16)
      ),
    ),
  );
}

InputDecorationTheme myInputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelStyle: floatingLabelTextStyle,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    labelStyle: labelTextStyle,
    filled: true,
    fillColor: surfaceColor,
    focusColor: gray2Color,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius16),
      borderSide: const BorderSide(
          color: grayColor,
          width: border1
      ),

    ),
  );
}

TextSelectionThemeData myTextSelectionThemeData() {
  return const TextSelectionThemeData(
    cursorColor: blackColor,
    selectionColor: gray2Color,
    selectionHandleColor: blackColor,
  );
}
