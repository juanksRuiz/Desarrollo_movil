import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavoritesController extends GetxController {
  // Si no funciona con Getx entonces con setState
  var _listaFavoritos = [].obs; // Para pasarselo a la ventana de favoritos
  var _favHumedades = [];
  var _favTemps = [];
  var _favVientos = [];
  var _favFeelsLikes = [];
  var _favIDs = []; //definir cual es el id

  List<dynamic> get listaFavoritos => _listaFavoritos.value;
  void addFavorite(var id, var h, var t, var v, var fl) {
    /* Funcion que añade Widget a lista de favoritos si el id no esta en
     los ids de favoritos*/
    if (!this._favIDs.contains(id)) {
      listaFavoritos.add("");
    }
  }
}
