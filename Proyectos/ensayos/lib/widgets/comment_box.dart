import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ensayos/clases/comentario.dart';

class CommentBox extends StatelessWidget {
  CommentBox(
      this.autor, this.hasPhoto, this.contenido, this.nLikes, this.nRespuestas);

  final String autor; // = "Juan Camilo Ruiz";
  final bool hasPhoto; // = false;
  final String contenido; // = "Hola estoy probando un comentario";
  final int nLikes; // = 0;
  var nRespuestas; // = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          CircleAvatar(
              radius: 55,
              child: CircleAvatar(
                radius: 50,
                child: Image(image: AssetImage("img/persona_avatar.jpg")),
              )),
          // Si no se ve bien dejar todo en row
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$autor',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$contenido')
            ],
          )
        ],
      ),
    );
  }
}
