import 'package:super_triqui/presentation/screens/triqui_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Super Triqui",
        theme: ThemeData(primaryColor: Color(0xff4264b4)),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Super Triqui!"),
          ),
          body: Center(
              child: MaterialButton(
                  child: Text("Comenzar"),
                  onPressed: () {
                    Get.to(Triqui_screen());
                  })),
        ));
  }
}
