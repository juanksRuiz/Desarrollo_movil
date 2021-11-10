import 'package:ensayos/ui/Parcial2/favoritesPage.dart';
import 'package:flutter/material.dart';
import 'package:ensayos/widgets/WeatherInformationBox.dart';
import 'package:ensayos/domain/controllers/weatherInfoController.dart';
import 'package:ensayos/widgets/favoriteBox.dart';
import 'package:get/get.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _textController = TextEditingController();
  WeatherInfoController _wiController = Get.find();
  // Variable para controlar el valor del switch
  bool isSearchByLatLon = false;
  bool isInfoFound = true;

  // Esta pagina debe tener una lista de favoritos que se le pasa a la pagina de favoritos

  Widget getInputFields(bool isByLatLon) {
    /*
    Funcion que crea espacios para ingresar consulta por nombre de ciudad o 
    por coordenadas
    ARGUMENTOS: 
      isByLatLon: booleano para determinar si la consulta es por coordenadas
       (true) o por nombre (false)
    RETORNA:
      Widget con los campos segun el tipo de consulta
    */
    if (isByLatLon) {
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
    // Simulacion Lista de favoritas
    List<String> ciudades = ["Madrid", "París"];
    List<String> paises = ["España", "Francia"];
    List<double> humedades = [15, 30];
    List<double> temperaturas = [28, 25];
    List<double> vientos = [6, 15];
    List<double> sensacionesTermicas = [30, 28];
    List<String> descripciones = ["Sol intenso", "Fresco"];
    List IDs = [1, 2];

    // LISTA DE WIDGETS CON FAVORITAS
    List<Widget> favoritos = [];
    for (int i = 0; i < ciudades.length; i++) {
      favoritos.add(FavoriteBox(
          ciudades[i],
          paises[i],
          humedades[i],
          temperaturas[i],
          vientos[i],
          sensacionesTermicas[i],
          descripciones[i],
          IDs[i]));
    }

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
                // Se añadio el primer Widget Row con los textos para definir
                // el tipo de consulta con un switch. No hay más cambios después
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Busqueda por nombre"),
                      Switch(
                          value: isSearchByLatLon,
                          onChanged: (value) {
                            setState(() {
                              isSearchByLatLon = value;
                            });
                          },
                          activeTrackColor: Colors.yellow,
                          activeColor: Colors.orangeAccent),
                      Text("Busqueda por coordenadas")
                    ]),
                getInputFields(isSearchByLatLon),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        // When the user presses the button, show an alert dialog containing the
                        // text that the user has entered into the text field.
                        onPressed: () {
                          if (ciudades.contains(_textController.text)) {
                            int i = ciudades.indexOf(_textController.text);
                            _wiController.setInformation(
                                ciudades[i],
                                paises[i],
                                humedades[i],
                                temperaturas[i],
                                vientos[i],
                                sensacionesTermicas[i],
                                descripciones[i]);
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
                      FloatingActionButton(
                        onPressed: () {
                          if (!IDs.contains(_wiController.id)) {
                            favoritos.add(FavoriteBox(
                                _wiController.ciudad,
                                _wiController.pais,
                                _wiController.humedad,
                                _wiController.temperatura,
                                _wiController.viento,
                                _wiController.sensacionTermica,
                                _wiController.description,
                                _wiController.id));
                          }
                        },
                        tooltip: "Añadir a favoritos",
                        child: Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24,
                        ),
                      )
                    ]),
                //Para moverse a pagina de favoritos
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoritesPage(favoritos)),
                      );
                    },
                    child: Text("Favoritos")),
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
