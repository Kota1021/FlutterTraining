import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';

enum WeatherKind { sunny, cloudy, rainy }

extension WeatherKindIcon on WeatherKind {
  SvgPicture get svgImage => switch (this) {
        WeatherKind.sunny => Assets.images.sunny.svg(),
        WeatherKind.cloudy => Assets.images.cloudy.svg(),
        WeatherKind.rainy => Assets.images.rainy.svg(),
      };
}
