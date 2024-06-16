import 'package:flutter/foundation.dart';
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

  Future<void> showErrorDialog(YumemiWeatherError error) async {
    await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('天気の取得に失敗'),
        content: Text('error name: ${error.name}'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
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
                          onPressed: () async {
                            try {
                              final weatherStr =
                                  yumemiWeather.fetchThrowsWeather('tokyo');
                              setState(() {
                                weatherKind =
                                    WeatherKind.values.byName(weatherStr);
                              });
                            } on YumemiWeatherError catch (e) {
                              await showErrorDialog(e);
                            }
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<YumemiWeather>('yumemiWeather', yumemiWeather),
    );
    properties.add(EnumProperty<WeatherKind?>('weatherKind', weatherKind));
    properties.add(EnumProperty<WeatherKind?>('weatherKind', weatherKind));
    properties.add(EnumProperty<WeatherKind?>('weatherKind', weatherKind));
    properties.add(EnumProperty<WeatherKind?>('weatherKind', weatherKind));
  }
}
