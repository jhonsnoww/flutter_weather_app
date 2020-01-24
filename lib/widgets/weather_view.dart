import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/blocs/weather_event.dart';
import 'package:weather_app/blocs/weather_state.dart';
import 'package:weather_app/widgets/city_selection.dart';

class WeatherView extends StatefulWidget {
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Haha'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CitySelection()));

              if (city != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(FeatchWeather(city: city));
              }
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              Center(
                  child: CircularProgressIndicator(
                semanticsLabel: "Please Wait!",
              ));
            }

            if (state is WeatherLoaded) {
              final weather = state.weather;

              return ListView(
                children: <Widget>[
                  Text(weather.location),
                  Text("${weather.temp}"),
                  Text("${weather.maxTemp}"),
                ],
              );
            }
            if (state is WeatherError) {
              return Text('Something was wrong!');
            }

            return Center(
              child: Text('Select a city!'),
            );
          },
        ),
      ),
    );
  }
}
