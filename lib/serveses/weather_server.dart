import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServer {
  final Dio dio;
  final String baseurl = 'http://api.weatherapi.com/v1';
  final String apikey = '6f5a9ebcbe4b48b598b141740252506';

  WeatherServer(this.dio);
  Future<WeatherModel> geCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseurl/forecast.json?key=$apikey&q=$cityName&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          "oops there was an error. tray later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , try later ');
    }
  }
}
