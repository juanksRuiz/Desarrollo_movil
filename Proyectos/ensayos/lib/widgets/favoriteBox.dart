import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class FavoriteBox extends StatelessWidget {
  final ciudad;
  final pais;
  final humedad;
  final temp;
  final viento;
  final feelsLike;
  final description;
  final id;

  @override
  FavoriteBox(this.ciudad, this.pais, this.humedad, this.temp, this.viento,
      this.feelsLike, this.description, this.id);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 80,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              child: Text(
                "${this.ciudad} , ${this.pais}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // Humedad
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Humedad:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Text("${this.humedad} %"),
                )),
              ],
            ),
            Divider(),
            // Temperatura
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Temperatura:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text("${this.temp} °C"),
                  ),
                ),
              ],
            ),
            Divider(),
            // Feels Like
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Feels like:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text("${this.feelsLike} °C"),
                  ),
                ),
              ],
            ),
            Divider(),
            // Viento
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Viento:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text("${this.viento} km/h"),
                  ),
                )
              ],
            ),
            Divider(),
            // Descripcion
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Descripción: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text("${this.description}"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
