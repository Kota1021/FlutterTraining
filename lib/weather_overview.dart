import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_training/weather_info.dart';
import 'package:flutter_training/weather_kind.dart';

class WeatherOverview extends StatelessWidget {
  const WeatherOverview({
    required this.weatherInfo,
    super.key,
  });

  final WeatherInfo? weatherInfo;

  @override
  Widget build(BuildContext context) {
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: weatherInfo?.weatherKind.svgImage ?? const Placeholder(),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '${weatherInfo?.lowest ?? '**'}℃',
                  textAlign: TextAlign.center,
                  style: labelLargeStyle?.copyWith(color: Colors.blue),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '${weatherInfo?.highest ?? '**'}℃',
                  textAlign: TextAlign.center,
                  style: labelLargeStyle?.copyWith(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WeatherKind>(
        'weatherKind',
        weatherInfo?.weatherKind,
      ),
    );
    properties.add(DiagnosticsProperty<int>('lowest', weatherInfo?.lowest));
    properties.add(DiagnosticsProperty<int>('highest', weatherInfo?.highest));
  }
}
