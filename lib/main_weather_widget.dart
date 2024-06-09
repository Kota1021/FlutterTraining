import 'package:flutter/material.dart';
import 'package:flutter_training/weather_kind.dart';
import 'package:flutter_training/weather_overview_widget.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final yumemiWeather = YumemiWeather();
  WeatherKind? weatherKind;

  @override
  Widget build(BuildContext context) {
    final labelLargeStyle = Theme.of(context).textTheme.labelLarge;
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            WeatherOverviewWidget(weatherKind: weatherKind),
            Flexible(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {/* ボタンがタップされた時の処理 */},
                          child: Text(
                            'Close',
                            textAlign: TextAlign.center,
                            style:
                                labelLargeStyle?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            final weatherStr =
                                yumemiWeather.fetchSimpleWeather();
                            setState(() {
                              weatherKind =
                                  WeatherKind.values.byName(weatherStr);
                            });
                          },
                          child: Text(
                            'Reload',
                            textAlign: TextAlign.center,
                            style:
                                labelLargeStyle?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
