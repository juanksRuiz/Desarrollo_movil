import 'package:flutter/material.dart';
import 'package:ensayos/widgets/WeatherInformationBox.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cool weatherApp"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Buscar una ciudad"),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInformationBox("Humedad", 20),
                      Container(
                        color: Colors.red,
                        child: SizedBox(
                          width: 30,
                          height: 100,
                        ),
                      ),
                      WeatherInformationBox("Temperatura", 20)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInformationBox("Viento", 20),
                      Container(
                        color: Colors.red,
                        child: SizedBox(
                          width: 30,
                          height: 100,
                        ),
                      ),
                      WeatherInformationBox("Sensación", "Clima fresco")
                    ]),
              ]),
        ),
      ),
    );
  }
}
