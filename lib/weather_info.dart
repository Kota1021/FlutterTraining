import 'package:flutter_training/weather_kind.dart';

class WeatherInfo {
  WeatherInfo({
    required this.weatherKind,
    required this.lowest,
    required this.highest,
  });

  WeatherInfo.fromJson(Map<String, dynamic> json)
      : weatherKind =
            WeatherKind.values.byName(json['weather_condition'].toString()),
        lowest = json['min_temperature'] as int,
        highest = json['max_temperature'] as int;
  WeatherKind weatherKind;
  int highest;
  int lowest;
}
