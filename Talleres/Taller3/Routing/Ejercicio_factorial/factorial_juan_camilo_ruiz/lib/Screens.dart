import 'dart:html';

import 'package:flutter/material.dart';

// Pagina de inicio
class HomeScreen extends StatelessWidget {
  final int N = 0; // numero que se muestra
  final int finalResult = 1; // resultado final

  const HomeScreen({Key? key}) : super(key: key);

  String _setFinalResult() {
    if (N == 0) {
      return "";
    } else {
      return "El resultado final es $finalResult";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Página inicial'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(_setFinalResult()),
              // Botón con el que se envía a la siguiente página
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SecondaryScreen(value: N + 1)));
                  },
                  child: Text('X!'))
            ],
          ),
        ));
  }
}

class SecondaryScreen extends StatelessWidget {
  final int value;
  // Cada pantalla segundaria de factorial debe tener un numero
  SecondaryScreen({required this.value});

  // Metodos
  void _nextSecondaryScreen(BuildContext context) async {
    int resultado = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondaryScreen(value: value + 1)));
    Navigator.pop(context, resultado * value);
  }

  // Apariencia
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Continuación calculo de factorial"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Presione + para aumentar el factorial o = para el resultado"),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, value);
                  },
                  child: Text("=")),
              ElevatedButton(
                  onPressed: () {
                    _nextSecondaryScreen(context);
                  },
                  child: Text("+"))
            ],
          )
        ],
      ),
    );
  }
}
