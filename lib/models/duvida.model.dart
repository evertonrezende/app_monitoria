
class Duvida {
  int id;
  String titulo;
  String resposta; 

  Duvida.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      titulo = map["titulo"],
      resposta = map["resposta"];
}