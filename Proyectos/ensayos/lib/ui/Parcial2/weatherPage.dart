import 'package:flutter/material.dart';
import 'package:ensayos/widgets/WeatherInformationBox.dart';
import 'package:ensayos/domain/controllers/weatherInfoController.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _textController = TextEditingController();
  WeatherInfoController _wiController = Get.find();

  Widget getInputFields(bool withCoordinates) {
    if (!withCoordinates) {
      return Column(
        children: [
          TextField(
            // Falta validator
            controller: _textController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "Latitud",
            ),
          ),
          TextField(
            // Falta validator
            controller: _textController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "Longitud",
            ),
          )
        ],
      );
    } else {
      return TextField(
        // Falta validator
        controller: _textController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "Buscar una ciudad",
        ),
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Con lista predefinida
    List<String> ciudades = ["Madrid"];
    List<double> humedades = [60];
    List<double> temperaturas = [28];
    List<double> sensacionesTermicas = [30];
    List<double> vientos = [6];

    bool isSearchByName = true;

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
                  // Falta validator
                  controller: _textController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Buscar una ciudad",
                  ),
                ),
                FloatingActionButton(
                  // When the user presses the button, show an alert dialog containing the
                  // text that the user has entered into the text field.
                  onPressed: () {
                    if (ciudades.contains(_textController.text)) {
                      int i = ciudades.indexOf(_textController.text);
                      _wiController.setInformation(humedades[i],
                          temperaturas[i], sensacionesTermicas[i], vientos[i]);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text the user has entered by using the
                            // TextEditingController.
                            content: Text(
                                "No se encontró la ciudad ${_textController.text}"),
                          );
                        },
                      );
                    }
                  },
                  tooltip: 'Show me the value!',
                  child: Icon(Icons.text_fields),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInformationBox("Humedad", _wiController.humedad),
                      WeatherInformationBox(
                          "Temperatura", _wiController.temperatura)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInformationBox("Viento", _wiController.viento),
                      WeatherInformationBox(
                          "Sensación Térmica", _wiController.sensacionTermica)
                    ]),
              ]),
        ),
      ),
    );
  }
}
