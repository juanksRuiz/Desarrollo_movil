import 'package:get/get.dart';

class TriquiController extends GetxController {
  var _matriz = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ].obs;

  var _turno = 1.obs; //1 = X, -1 = o
  var _fin = (-2).obs; //-2: jugando, -1: O, 0: empate, 1: X
  var _nturnos = 0.obs;

  int get turno => _turno.value;
  int get nturnos => _nturnos.value;
  int get fin => _fin.value;

  int getMatriz(int n) {
    return _matriz[n ~/ 3][n % 3];
  }

  String getTextMatriz(int n) {
    return _matriz[n ~/ 3][n % 3] == -1
        ? "O"
        : _matriz[n ~/ 3][n % 3] == 1
            ? "X"
            : " ";
  }

  bool checkWinner() {
    return false;
  }

  void reset() {
    _matriz.value = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ];

    _turno.value = 1;
    _nturnos.value = 0;
    _fin.value = -2;
  }
}
