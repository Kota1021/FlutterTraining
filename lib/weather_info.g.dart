// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => WeatherInfo(
      weatherKind: $enumDecode(_$WeatherKindEnumMap, json['weather_condition']),
      lowest: (json['min_temperature'] as num).toInt(),
      highest: (json['max_temperature'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'weather_condition': _$WeatherKindEnumMap[instance.weatherKind]!,
      'max_temperature': instance.highest,
      'min_temperature': instance.lowest,
    };

const _$WeatherKindEnumMap = {
  WeatherKind.sunny: 'sunny',
  WeatherKind.cloudy: 'cloudy',
  WeatherKind.rainy: 'rainy',
};
