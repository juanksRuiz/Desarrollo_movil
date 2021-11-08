import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class WeatherInformationBox extends StatelessWidget {
  // atributos
  final String name;
  final value;

  // Constructor
  @override
  WeatherInformationBox(this.name, this.value);
  // Compilacion
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 20,
        child: Container(
          color: Colors.indigo[900],
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "$value",
                style: TextStyle(fontSize: 30, color: Colors.white),
              )
            ],
          ),
        ));
  }
}
