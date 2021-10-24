class InformacionComentario {
  // validar si informacion de autor esta contenido en una clase
  var autor; // = "Juan Camilo Ruiz";
  var hasPhoto; // = false;
  var contenido; // = "Hola estoy probando un comentario";
  var nLikes; // = 0;
  var nRespuestas; // = 0;

  InformacionComentario(String autor, bool hasPhoto, String contenido,
      int nLikes, int nRespuestas) {
    this.autor = autor;
    this.hasPhoto = hasPhoto;
    this.contenido = contenido;
    this.nLikes = nLikes;
    this.nRespuestas = nRespuestas;
  }
}
