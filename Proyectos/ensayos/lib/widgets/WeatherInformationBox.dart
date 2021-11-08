import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherInformationBox extends StatelessWidget {
  // atributos
  final String name;
  final value;
  String _showValue(String nombre) {
    if (nombre == "Humedad") {
      return "${this.value} %";
    } else if (nombre == "Temperatura") {
      return "${this.value} °C"; // transformar de °K a °C
    } else if (nombre == "Viento") {
      // Para viento
      return "${this.value} km/h";
    } else {
      // Para Sensación
      return "${this.value} °C";
    }
  }

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
          height: 150,
          width: 150,
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
              Obx(() => Text(
                    _showValue(this.name),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ))
            ],
          ),
        ));
  }
}
