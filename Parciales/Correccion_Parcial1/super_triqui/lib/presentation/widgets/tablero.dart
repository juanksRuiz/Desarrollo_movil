import 'package:super_triqui/domain/controllers/triqui_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'casilla.dart';

class Tablero extends StatelessWidget {
  void reset() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    // Aqui se pide al modulo que busque una instancia del controlador
    TriquiController controller = Get.find();
    return Container(
      child: SafeArea(
          child: Obx(() =>
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0.00, 3.00),
                          color: const Color(0xff000000).withOpacity(0.16),
                          blurRadius: 6,
                        )
                      ],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      "Mensaje de UI",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  // FILA 1
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(1, controller.getTextMatriz(1)),
                        )),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(2, controller.getTextMatriz(2)),
                        )),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(3, controller.getTextMatriz(3)),
                        ))
                      ]),
                )),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  // FILA 2
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(4, controller.getTextMatriz(4)),
                        )),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(5, controller.getTextMatriz(5)),
                        )),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(6, controller.getTextMatriz(6)),
                        ))
                      ]),
                )),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  // FILA 3
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(7, controller.getTextMatriz(7)),
                        )),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(8, controller.getTextMatriz(8)),
                        )),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Casilla(9, controller.getTextMatriz(9)),
                        ))
                      ]),
                )),
                //BOTON DE RESET
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: MaterialButton(
                              onPressed: () {
                                controller.reset();
                                reset();
                              },
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ))
              ]))),
    );
  }
}
