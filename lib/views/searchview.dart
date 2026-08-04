import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';

import 'package:weather_app/main.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = context.read<GetWeatherCubit>().weatherModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search city'),
        backgroundColor: getThemeColor(weatherModel?.watherconditonal),
        elevation: 8.0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getweathercubit = context.read<GetWeatherCubit>();
              getweathercubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Enter city name',
              labelText: 'Search',
              suffixIcon: Icon(Icons.search, color: Colors.blue),
              labelStyle: TextStyle(color: Colors.blue),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
