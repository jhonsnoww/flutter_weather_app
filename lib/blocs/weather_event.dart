import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FeatchWeather extends WeatherEvent {
  final String city;

  const FeatchWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
