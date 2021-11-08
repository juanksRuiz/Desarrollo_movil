import 'package:get/get.dart';

class WeatherInfoController extends GetxController {
  var _humedad = 0.0.obs;
  var _temperatura = 0.0.obs;
  var _viento = 0.0.obs;
  var _sensacionTermica = 0.0.obs;
  var _infoFound = true.obs;

  double get humedad => _humedad.value;
  double get temperatura => _temperatura.value;
  double get viento => _viento.value;
  double get sensacionTermica => _sensacionTermica.value;
  bool get infoFound => _infoFound.value;

  void setHumedad(double valor) {
    _humedad.value = valor;
  }

  void setTemperatura(double valor) {
    _temperatura.value = valor;
  }

  void setSensacionTermica(double valor) {
    _temperatura.value = valor;
  }

  void setViento(double valor) {
    _viento.value = valor;
  }

  void setInformation(double h, double t, double st, double v) {
    setHumedad(h);
    setTemperatura(t);
    setSensacionTermica(st);
    setViento(v);
  }
}
