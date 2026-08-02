

import 'dart:developer';

import 'package:flutter/material.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search city'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(child: TextField(
          onSubmitted: (v){
            log(v);

          },
          decoration: InputDecoration(
            hintText: 'Enter city name',
            labelText: 'Search',
            suffixIcon: Icon(Icons.search,color: Colors.blue,),
            labelStyle: TextStyle(color: Colors.blue),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                color: Colors.green
            )

            ),
          ),

        )),
      ),
    );
  }
}
