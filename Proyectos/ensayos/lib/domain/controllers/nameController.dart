import 'package:get/get.dart';

class StudentController extends GetxController {
  var _name = "Juan Camilo Ruiz".obs;
  var _age = 22.obs;
  var _isJC = true.obs;

  String get name => _name.value;
  int get age => _age.value;

  void setName(String newName) {
    _name.value = newName;
  }

  void setAge(int newAge) {
    _age.value = newAge;
  }

  void setPersona() {
    if (_isJC.value) {
      setName("Otro");
      setAge(23);
      _isJC.value = false;
    } else {
      setName("Juan Camilo Ruiz");
      setAge(22);
      _isJC.value = true;
    }
  }
}
