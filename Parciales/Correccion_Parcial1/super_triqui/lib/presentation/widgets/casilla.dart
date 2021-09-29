import 'package:flutter/material.dart';
import 'package:super_triqui/domain/controllers/triqui_controller.dart';
import 'package:get/get.dart';

class Casilla extends StatelessWidget {
  // Recibo el texto que muestra
  final String texto;
  final int posicion;

  const Casilla(this.posicion, this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TriquiController controller = Get.find();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: MaterialButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            texto,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            controller.updateTablero(posicion);
          },
        ));
  }
}
