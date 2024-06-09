import 'package:flutter/material.dart';

class WeatherOverviewWidget extends StatelessWidget {
  const WeatherOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AspectRatio(aspectRatio: 1, child: Placeholder()),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  '**℃',
                  textAlign: TextAlign.center,
                  style: labelLargeStyle?.copyWith(color: Colors.blue),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  '**℃',
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
