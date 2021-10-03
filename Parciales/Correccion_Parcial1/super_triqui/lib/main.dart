import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'domain/controllers/triqui_controller.dart';
import 'presentation/screens/myhome.dart';

void main() {
  Get.put<TriquiController>(TriquiController());
  runApp(App());
}
