import 'package:get/get.dart';

class WeatherInfoController extends GetxController {
  var _ciudad = "".obs;
  var _pais = "".obs;
  var _humedad = 0.0.obs;
  var _temperatura = 0.0.obs;
  var _viento = 0.0.obs;
  var _sensacionTermica = 0.0.obs;
  var _infoFound = true.obs;
  var _description = "".obs;
  var _id = 0.obs;

  String get ciudad => _ciudad.value;
  String get pais => _pais.value;
  double get humedad => _humedad.value;
  double get temperatura => _temperatura.value;
  double get viento => _viento.value;
  double get sensacionTermica => _sensacionTermica.value;
  bool get infoFound => _infoFound.value;
  String get description => _description.value;
  get id => _id.value;

  void setCiudad(String valor) {
    _ciudad.value = valor;
  }

  void setPais(String valor) {
    _ciudad.value = valor;
  }

  void setHumedad(double valor) {
    _humedad.value = valor;
  }

  void setTemperatura(double valor) {
    _temperatura.value = valor;
  }

  void setViento(double valor) {
    _viento.value = valor;
  }

  void setSensacionTermica(double valor) {
    _temperatura.value = valor;
  }

  void setDescription(String valor) {
    _description.value = valor;
  }

  void setInformation(
      String c, String p, double h, double t, double v, double st, String d) {
    setCiudad(c);
    setPais(p);
    setHumedad(h);
    setTemperatura(t);
    setViento(v);
    setSensacionTermica(st);
    setDescription(d);
  }
}
