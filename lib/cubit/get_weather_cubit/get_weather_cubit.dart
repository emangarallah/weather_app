import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../serveses/weather_server.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<GetWeatherStates> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServer(
        Dio(),
      ).geCurrentWeather(cityName: cityName);

      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailerState(e.toString()));
    }
  }
}
