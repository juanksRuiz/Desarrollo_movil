import 'package:super_triqui/presentation/widgets/tablero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Triqui_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Super Triqui!"),
      ),
      body: Center(child: Tablero()),
    );
  }
}
