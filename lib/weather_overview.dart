import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_training/weather_kind.dart';

class WeatherOverview extends StatelessWidget {
  const WeatherOverview({
    required this.weatherKind,
    required this.lowest,
    required this.highest,
    super.key,
  });
  final int? lowest;
  final int? highest;
  final WeatherKind? weatherKind;

  @override
  Widget build(BuildContext context) {
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: weatherKind?.svgImage ?? const Placeholder(),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '${lowest ?? '**'}℃',
                  textAlign: TextAlign.center,
                  style: labelLargeStyle?.copyWith(color: Colors.blue),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '${highest ?? '**'}℃',
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
    properties
        .add(DiagnosticsProperty<WeatherKind>('weatherKind', weatherKind));
    properties.add(DiagnosticsProperty<int>('lowest', lowest));
    properties.add(DiagnosticsProperty<int>('highest', highest));
  }
}
