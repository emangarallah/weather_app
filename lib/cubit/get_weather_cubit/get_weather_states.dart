import 'package:weather_app/models/weather_model.dart';

class GetWeatherStates {}

class WeatherInitialState extends GetWeatherStates {}

class WeatherLoadedState extends GetWeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailerState extends GetWeatherStates {
  final String errorMesage;

  WeatherFailerState(this.errorMesage);
}
