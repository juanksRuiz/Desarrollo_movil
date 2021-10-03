import 'dart:html';
import "package:get/get.dart";

class AuthenticationController extends GetxController {
  @override
  Future<bool> login(user, password) {
    if (user == 'a@a.com') {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<bool> singup(user, password) {
    if (user == 'a@a.com') {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
