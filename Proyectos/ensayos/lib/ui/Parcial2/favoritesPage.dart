import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  final List<Widget> listaFavoritos;
  const FavoritesPage(this.listaFavoritos, {Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text("Ciudades favoritas"),
        ),
        body: ListView(
          children: widget.listaFavoritos,
        ),
      ),
    );
  }
}
