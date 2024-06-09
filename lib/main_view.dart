import 'package:flutter/material.dart';
import 'package:flutter_training/weather_kind.dart';
import 'package:flutter_training/weather_overview.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
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
            const Spacer(),
            WeatherOverview(
              weatherKind: weatherKind,
              lowest: null,
              highest: null,
            ),
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
