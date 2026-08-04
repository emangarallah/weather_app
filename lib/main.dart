import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  context
                      .read<GetWeatherCubit>()
                      .weatherModel
                      ?.watherconditonal,
                ),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  // تحويل النص للحروف الصغيرة وتنظيف المسافات لتجنب المشاكل في المطابقة
  final formattedCondition = condition.trim();

  switch (formattedCondition) {
    // ☀️ طقس مشمس وصافٍ
    case 'Sunny':
    case 'Clear':
      return Colors.amber;

    // ⛅ غائم جزئياً وكلياً
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;

    // 🌫️ ضباب ورطوبة عاليه
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    // 🌧️ أمطار خفيفة ومعتدلة
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain':
    case 'Patchy light rain':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.lightBlue;

    // 🌧️⚡ أمطار غزيرة وعواصف رعدية
    case 'Heavy rain':
    case 'Moderate rain at times':
    case 'Heavy rain at times':
    case 'Torrential rain shower':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Thundery outbreaks possible':
      return Colors.indigo;

    // ❄️ ثلوج وصقير
    case 'Patchy snow possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Moderate snow':
    case 'Patchy moderate snow':
    case 'Heavy snow':
    case 'Patchy heavy snow':
    case 'Ice pellets':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
      return Colors.cyan;

    // ❄️⚡ ثلوج مع رعد
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.teal;

    //  DEFAULT - لأي حالة غير متوقعة
    default:
      return Colors.blue;
  }
}
