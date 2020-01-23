import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_event.dart';
import 'package:weather_app/blocs/weather_state.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/repositories/weather_repositories.dart';
import 'package:meta/meta.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FeatchWeather) {
      yield WeatherLoading();

      try {
        final Weather weather =
            await weatherRepository.getWeatherData(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (_) {
        yield WeatherError();
      }
    }
  }
}
