import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/repositories/weather_api_client.dart';
import 'package:meta/meta.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  const WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeatherData(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
