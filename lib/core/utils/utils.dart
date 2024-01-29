
String formatPressure(int pressure) {
  return "${(pressure*0.75).round()} мм рт. ст.";
}

String formatWind(double wind) {
  return "${(wind*0.75).round()} м/с";
}

String formatHumidity(int humidity) {
  return "$humidity %";
}

String formatTemp({required double temperature, required double feelsLike}) {
  return "${temperature.round()} °C (ощущается как ${feelsLike.round()} °C)";
}