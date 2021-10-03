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

  void _setMatriz(int n) {
    _matriz[n ~/ 3][n % 3] = _turno.value;
  }

  String getTextMatriz(int n) {
    return _matriz[n ~/ 3][n % 3] == -1
        ? "O"
        : _matriz[n ~/ 3][n % 3] == 1
            ? "X"
            : " ";
  }

  bool updateTablero(int n) {
    if (getMatriz(n) == 0 && _nturnos.value < 9) {
      // Se realiza la jugada
      _setMatriz(n);
      _nturnos++;
      if (_nturnos >= 5) {
        checkWinner();
      }
      return true; // se pudo hacer la jugada
    }
    return false; //  NO se pudo hacer la jugada
  }

  void checkWinner() {
    int cont = 0;

    //Por filas
    for (int i = 0; i < 3; i++) {
      cont = 0;
      for (int j = 0; j < 3; j++) {
        cont += _matriz[i][j];
      }
      if (cont == 3) {
        _fin.value = 1;
      } else if (cont == -3) {
        _fin.value = -1;
      }
    }

    //Por columnas
    for (int i = 0; i < 3; i++) {
      cont = 0;
      for (int j = 0; j < 3; j++) {
        cont += _matriz[j][i];
      }
      if (cont == 3) {
        _fin.value = 1;
      } else if (cont == -3) {
        _fin.value = -1;
      }
    }

    // Diagonal principal
    cont = 0;
    for (int j = 0; j < 3; j++) {
      cont += _matriz[j][j];
    }
    if (cont == 3) {
      _fin.value = 1;
    } else if (cont == -3) {
      _fin.value = -1;
    }

    // Diagonal segundaria
    cont = 0;
    for (int j = 0; j < 3; j++) {
      cont += _matriz[j][3 - j - 1];
    }
    if (cont == 3) {
      _fin.value = 1;
    } else if (cont == -3) {
      _fin.value = -1;
    }

    if (_fin.value == -2 && _nturnos.value == 9) {
      _fin.value = 0;
    }
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
