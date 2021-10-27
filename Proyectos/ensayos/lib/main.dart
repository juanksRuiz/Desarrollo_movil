import 'package:flutter/material.dart';
import 'package:ensayos/domain/controllers/nameController.dart';
import 'package:get/get.dart';
import 'package:ensayos/ui/pages/post.dart';
import 'package:ensayos/ui/pages/comentariosPage.dart';
//import "ui/my_app.dart";

void main() {
  Get.put<StudentController>(StudentController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "State Management with Obx",
      home: Scaffold(appBar: null, body: Post()),
    );
  }
}

/*
class StudentBlock extends StatelessWidget {
  StudentController studController = Get.find();
  @override
  Widget build(BuildContext build) {
    return Column(children: [
      Obx(() => Text("Name: ${studController.name}")),
      Obx(() => Text("Age: ${studController.age}")),
      ElevatedButton(
          onPressed: () {
            studController.setPersona();
          },
          child: Text("Switch Person"))
    ]);
  }
}
*/