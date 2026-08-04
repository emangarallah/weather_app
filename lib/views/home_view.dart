import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/searchview.dart';
import 'package:weather_app/weidget/no_weather_body.dart';
import 'package:weather_app/weidget/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // جلب موديل الطقس
    var weatherModel = context.read<GetWeatherCubit>().weatherModel;

    return Scaffold(
      appBar: AppBar(
        // إعطاء الـ AppBar اللون المناسب للحالة
        backgroundColor: getThemeColor(weatherModel?.watherconditonal),
        title: const Text('Weather App', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Searchview()),
              );
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
        elevation: 8.0,
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weather: state.weatherModel);
          } else {
            return const Center(child: Text('Oops, there was an error!'));
          }
        },
      ),
    );
  }
}
