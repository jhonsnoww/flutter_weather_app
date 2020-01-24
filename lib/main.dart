import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repositories/weather_api_client.dart';
import 'package:weather_app/repositories/weather_repositories.dart';
import 'package:weather_app/widgets/simple_bloc_delegate.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/widgets/weather_view.dart';

import 'blocs/weather_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(
      repository: weatherRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final WeatherRepository repository;
  MyApp({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: repository),
        child: WeatherView(),
      ),
    );
  }
}
