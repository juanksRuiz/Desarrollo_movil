//import 'package:ensayos/domain/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:ensayos/widgets/comment_box.dart';
import 'package:ensayos/clases/comentario.dart';
//import 'package:get/get.dart';

Color verde = Colors.green[400]!;
Color gris = Colors.grey[350]!;

class ComentariosPage extends StatefulWidget {
  const ComentariosPage({Key? key}) : super(key: key);

  @override
  _ComentariosPageState createState() => _ComentariosPageState();
}

// Aqui se debe hacer un query a los comentarios asociados a este post
class _ComentariosPageState extends State<ComentariosPage> {
  List<String> nombres = ["Juan Camilo Ruiz", "Dave Alsina"];
  List<bool> havePhoto = [false, false];
  List<String> contenidos = [
    "Hola mi nombre es JC Ruiz",
    "Hola, yo soy Dave Alsina"
  ];
  List<int> likesPorComentario = [0, 0];
  List<int> nRespPorComentario = [0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: verde, title: Text("Comentarios:")),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: nombres.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber,
            );
          },
        ));
  }
}
