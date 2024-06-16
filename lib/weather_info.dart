import 'package:flutter_training/weather_kind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_info.g.dart';

@JsonSerializable(createToJson: false)
class WeatherInfo {
  WeatherInfo({
    required this.weatherKind,
    required this.lowest,
    required this.highest,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  @JsonKey(name: 'weather_condition')
  WeatherKind weatherKind;
  @JsonKey(name: 'max_temperature')
  int highest;
  @JsonKey(name: 'min_temperature')
  int lowest;
}
