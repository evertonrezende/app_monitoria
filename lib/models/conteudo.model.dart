class Conteudo {
  int id;
  int id_materia;
  String assunto;  
  String texto;  
  int likes;
  int deslikes;

  Conteudo(this.id_materia, this.assunto, this.texto, this.likes, this.deslikes, {this.id});

  Conteudo.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      id_materia = map["id_materia"],
      assunto = map["assunto"],
      texto = map["texto"],
      likes = map["likes"],
      deslikes = map["deslikes"];

   toJson() {
    return <String, dynamic> {
      'id': id,
      'id_materia': id_materia,
      'assunto': assunto,
      'texto': texto,
      'likes': likes,
      'deslikes': deslikes,
    };
   }
}