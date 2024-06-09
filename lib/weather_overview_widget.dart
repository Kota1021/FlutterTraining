import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/weather_kind.dart';

class WeatherOverviewWidget extends StatelessWidget {
  const WeatherOverviewWidget(
      {super.key, this.weatherKind, this.lowest, this.highest});
  final int? lowest;
  final int? highest;
  final WeatherKind? weatherKind;

  @override
  Widget build(BuildContext context) {
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;
    Widget icon;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
            aspectRatio: 1,
            child: weatherKind?.svgImage ?? const Placeholder()),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  '${lowest ?? '**'}℃',
                  textAlign: TextAlign.center,
                  style: labelLargeStyle?.copyWith(color: Colors.blue),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
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
}
