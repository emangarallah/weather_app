


import 'package:flutter/material.dart';
import 'package:weather_app/views/searchview.dart';

import '../weidget/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:Text('Weather App'),
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Searchview();

            }));
          }

    ,icon: Icon(Icons.search),
  ),
        ],



      ),
      body:  const NoWeatherBody(),
    );
  }
}
